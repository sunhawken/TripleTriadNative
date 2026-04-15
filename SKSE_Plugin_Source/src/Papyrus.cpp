#include "Papyrus.h"

#include <algorithm>
#include <array>
#include <numeric>
#include <random>
#include <vector>

using namespace std::string_view_literals;

namespace TT::Papyrus {

    static constexpr std::string_view SCRIPT = "TT_NativeFunctions"sv;

    // ── RNG ──────────────────────────────────────────────────────
    static std::mt19937& RNG() {
        static std::mt19937 rng{ std::random_device{}() };
        return rng;
    }

    // =============================================================
    //  FOV Control  (replaces ConsoleUtil dependency)
    // =============================================================

    static bool  s_fovSaved            = false;
    static float s_savedWorldFOV       = 0.0f;
    static float s_savedFirstPersonFOV = 0.0f;

    void SetFOV(RE::StaticFunctionTag*, float a_fov) {
        // In Skyrim VR the HMD lens controls visual FOV, and
        // PlayerCamera's member offsets differ from SE/AE — writing
        // worldFOV/firstPersonFOV at SE offsets corrupts adjacent
        // pointer fields, causing a CTD during PlayerCharacter::Update.
        if (REL::Module::IsVR()) {
            SKSE::log::info("SetFOV: skipped (VR — HMD controls FOV, "
                            "SE offsets unsafe)");
            return;
        }

        auto* cam = RE::PlayerCamera::GetSingleton();
        if (!cam) {
            SKSE::log::warn("SetFOV: PlayerCamera unavailable");
            return;
        }

        if (!s_fovSaved) {
            s_savedWorldFOV       = cam->worldFOV;
            s_savedFirstPersonFOV = cam->firstPersonFOV;
            s_fovSaved            = true;
            SKSE::log::info("SetFOV: saved original (world={:.1f}, fp={:.1f})",
                            s_savedWorldFOV, s_savedFirstPersonFOV);
        }

        cam->worldFOV       = a_fov;
        cam->firstPersonFOV = a_fov;
        SKSE::log::info("SetFOV: {:.1f}", a_fov);
    }

    void ResetFOV(RE::StaticFunctionTag*) {
        if (REL::Module::IsVR()) return;  // nothing to do in VR
        if (!s_fovSaved) return;

        auto* cam = RE::PlayerCamera::GetSingleton();
        if (!cam) return;

        cam->worldFOV       = s_savedWorldFOV;
        cam->firstPersonFOV = s_savedFirstPersonFOV;
        SKSE::log::info("ResetFOV: restored (world={:.1f}, fp={:.1f})",
                        s_savedWorldFOV, s_savedFirstPersonFOV);

        s_fovSaved            = false;
        s_savedWorldFOV       = 0.0f;
        s_savedFirstPersonFOV = 0.0f;
    }

    // =============================================================
    //  FormList Utilities
    // =============================================================

    RE::TESForm* GetRandomForm(RE::StaticFunctionTag*, RE::BGSListForm* a_list) {
        if (!a_list || a_list->forms.empty()) return nullptr;

        auto size = static_cast<std::uint32_t>(a_list->forms.size());
        std::uniform_int_distribution<std::uint32_t> dist(0, size - 1);
        return a_list->forms[dist(RNG())];
    }

    RE::TESForm* GetRandomFormInRange(RE::StaticFunctionTag*, RE::BGSListForm* a_list,
                                      std::int32_t a_min, std::int32_t a_max) {
        if (!a_list || a_list->forms.empty()) return nullptr;

        auto size = static_cast<std::int32_t>(a_list->forms.size());
        auto lo   = std::clamp(a_min, 0, size - 1);
        auto hi   = std::clamp(a_max, 0, size - 1);
        if (lo > hi) return nullptr;

        std::uniform_int_distribution<std::int32_t> dist(lo, hi);
        return a_list->forms[static_cast<std::uint32_t>(dist(RNG()))];
    }

    std::vector<RE::TESForm*> GetRandomForms(RE::StaticFunctionTag*,
                                             RE::BGSListForm* a_list,
                                             std::int32_t     a_count,
                                             bool             a_allowDuplicates) {
        std::vector<RE::TESForm*> result;
        if (!a_list || a_list->forms.empty() || a_count <= 0) return result;

        auto size = static_cast<std::uint32_t>(a_list->forms.size());

        if (a_allowDuplicates) {
            result.reserve(static_cast<std::size_t>(a_count));
            std::uniform_int_distribution<std::uint32_t> dist(0, size - 1);
            for (std::int32_t i = 0; i < a_count; ++i) {
                result.push_back(a_list->forms[dist(RNG())]);
            }
        } else {
            auto pick = std::min(static_cast<std::uint32_t>(a_count), size);
            std::vector<std::uint32_t> idx(size);
            std::iota(idx.begin(), idx.end(), 0u);

            result.reserve(pick);
            for (std::uint32_t i = 0; i < pick; ++i) {
                std::uniform_int_distribution<std::uint32_t> dist(i, size - 1);
                std::swap(idx[i], idx[dist(RNG())]);
                result.push_back(a_list->forms[idx[i]]);
            }
        }
        return result;
    }

    // =============================================================
    //  AI Board Evaluation
    // =============================================================

    struct CardStats {
        int top    = 0;
        int right  = 0;
        int bottom = 0;
        int left   = 0;
    };

    static struct {
        bool      occupied[9]      = {};
        bool      isPlayerOwned[9] = {};
        CardStats board[9]         = {};
        CardStats hand[5]          = {};
    } s_state;

    void ResetBoard(RE::StaticFunctionTag*) {
        s_state = {};
    }

    void SetBoardCard(RE::StaticFunctionTag*,
                      std::int32_t a_pos,
                      std::int32_t a_top, std::int32_t a_right,
                      std::int32_t a_bottom, std::int32_t a_left,
                      bool a_isPlayerOwned) {
        if (a_pos < 0 || a_pos > 8) return;
        s_state.occupied[a_pos]      = true;
        s_state.isPlayerOwned[a_pos] = a_isPlayerOwned;
        s_state.board[a_pos]         = { a_top, a_right, a_bottom, a_left };
    }

    void SetHandCard(RE::StaticFunctionTag*,
                     std::int32_t a_idx,
                     std::int32_t a_top, std::int32_t a_right,
                     std::int32_t a_bottom, std::int32_t a_left) {
        if (a_idx < 0 || a_idx > 4) return;
        s_state.hand[a_idx] = { a_top, a_right, a_bottom, a_left };
    }

    // ── Board adjacency (3x3 grid) ──────────────────────────────
    //
    //   0 | 1 | 2
    //  ---+---+---
    //   3 | 4 | 5
    //  ---+---+---
    //   6 | 7 | 8

    static int RightOf(int p)  { return (p % 3 < 2) ? p + 1 : -1; }
    static int LeftOf(int p)   { return (p % 3 > 0) ? p - 1 : -1; }
    static int AboveOf(int p)  { return (p >= 3)     ? p - 3 : -1; }
    static int BelowOf(int p)  { return (p <= 5)     ? p + 3 : -1; }

    // ── Same Wall constant ──────────────────────────────────────
    // Board edges count as value 10 ("A") for Same rule checks.
    static constexpr int WALL_VALUE = 10;

    // Evaluate how many enemy cards placing `card` at `pos` would flip.
    static int EvaluatePlacement(int pos, const CardStats& card, bool asOpponent,
                                 bool ruleSame, bool rulePlus, bool ruleCombo,
                                 bool ruleSameWall) {
        int topP    = AboveOf(pos);
        int rightP  = RightOf(pos);
        int bottomP = BelowOf(pos);
        int leftP   = LeftOf(pos);

        bool flipTop = false, flipRight = false, flipBottom = false, flipLeft = false;
        bool sameHit = false, plusHit = false;

        auto isEnemy = [&](int adj) -> bool {
            if (adj < 0 || !s_state.occupied[adj]) return false;
            return asOpponent ? s_state.isPlayerOwned[adj]
                              : !s_state.isPlayerOwned[adj];
        };

        auto myVal = [&](int adj) -> int {
            if (adj == topP)    return card.top;
            if (adj == rightP)  return card.right;
            if (adj == bottomP) return card.bottom;
            if (adj == leftP)   return card.left;
            return 0;
        };

        auto theirVal = [&](int adj) -> int {
            if (adj == topP)    return s_state.board[adj].bottom;
            if (adj == rightP)  return s_state.board[adj].left;
            if (adj == bottomP) return s_state.board[adj].top;
            if (adj == leftP)   return s_state.board[adj].right;
            return 0;
        };

        auto setFlip = [&](int adj) {
            if (adj == topP)    flipTop    = true;
            if (adj == rightP)  flipRight  = true;
            if (adj == bottomP) flipBottom = true;
            if (adj == leftP)   flipLeft   = true;
        };

        constexpr int ADJ_COUNT = 4;
        int adj[ADJ_COUNT];
        adj[0] = topP; adj[1] = rightP; adj[2] = bottomP; adj[3] = leftP;

        // ── Same rule (with optional Wall extension) ─────────────
        if (ruleSame) {
            // For Same Wall: edges act as virtual "A" (10) cards.
            // A wall match on one side + a real card match on another
            // triggers the Same rule and flips the real card.
            if (ruleSameWall) {
                // Check wall adjacencies: myVal toward a wall == WALL_VALUE
                bool wallTop    = (topP    < 0) && (card.top    == WALL_VALUE);
                bool wallRight  = (rightP  < 0) && (card.right  == WALL_VALUE);
                bool wallBottom = (bottomP < 0) && (card.bottom == WALL_VALUE);
                bool wallLeft   = (leftP   < 0) && (card.left   == WALL_VALUE);
                int wallMatches = (wallTop?1:0) + (wallRight?1:0) +
                                  (wallBottom?1:0) + (wallLeft?1:0);

                // Check real card matches
                for (int i = 0; i < ADJ_COUNT; ++i) {
                    int a = adj[i];
                    if (a < 0 || !s_state.occupied[a]) continue;
                    if (!isEnemy(a)) continue;

                    if (myVal(a) == theirVal(a)) {
                        // This side matches a real card. Combined with
                        // a wall match or another real match = Same.
                        // Check for a second match:
                        bool hasSecond = (wallMatches > 0);
                        if (!hasSecond) {
                            for (int j = i + 1; j < ADJ_COUNT; ++j) {
                                int b = adj[j];
                                if (b < 0 || !s_state.occupied[b]) continue;
                                if (!isEnemy(b)) continue;
                                if (myVal(b) == theirVal(b)) {
                                    setFlip(b);
                                    hasSecond = true;
                                }
                            }
                        }
                        if (hasSecond) {
                            setFlip(a);
                            sameHit = true;
                        }
                    }
                }
            } else {
                // Standard Same: require two real adjacent enemy cards
                for (int i = 0; i < ADJ_COUNT; ++i) {
                    for (int j = i + 1; j < ADJ_COUNT; ++j) {
                        int a = adj[i], b = adj[j];
                        if (a < 0 || b < 0) continue;
                        if (!s_state.occupied[a] || !s_state.occupied[b]) continue;
                        if (!isEnemy(a) || !isEnemy(b)) continue;

                        if (myVal(a) == theirVal(a) && myVal(b) == theirVal(b)) {
                            setFlip(a);
                            setFlip(b);
                            sameHit = true;
                        }
                    }
                }
            }
        }

        // ── Plus rule ────────────────────────────────────────────
        if (rulePlus) {
            for (int i = 0; i < ADJ_COUNT; ++i) {
                for (int j = i + 1; j < ADJ_COUNT; ++j) {
                    int a = adj[i], b = adj[j];
                    if (a < 0 || b < 0) continue;
                    if (!s_state.occupied[a] || !s_state.occupied[b]) continue;
                    if (!isEnemy(a) || !isEnemy(b)) continue;

                    if ((myVal(a) + theirVal(a)) == (myVal(b) + theirVal(b))) {
                        setFlip(a);
                        setFlip(b);
                        plusHit = true;
                    }
                }
            }
        }

        // ── Combo rule: if Same or Plus triggered, return max priority
        if (ruleCombo && (sameHit || plusHit)) {
            return 5;
        }

        int flips = 0;
        if (flipTop)    ++flips;
        if (flipRight)  ++flips;
        if (flipBottom) ++flips;
        if (flipLeft)   ++flips;

        // ── Basic value comparison (higher value flips lower) ────
        auto checkBasicFlip = [&](int adjPos, bool alreadyFlipped) {
            if (alreadyFlipped) return;
            if (adjPos < 0 || !s_state.occupied[adjPos]) return;
            if (!isEnemy(adjPos)) return;
            if (myVal(adjPos) > theirVal(adjPos)) ++flips;
        };

        checkBasicFlip(topP,    flipTop);
        checkBasicFlip(rightP,  flipRight);
        checkBasicFlip(bottomP, flipBottom);
        checkBasicFlip(leftP,   flipLeft);

        return flips;
    }

    // =============================================================
    //  v2.0 — AI Difficulty Levels
    // =============================================================
    //
    //  difficulty 0 = Easy:   50% chance of random move, else best
    //  difficulty 1 = Normal: always picks best move (v1 behavior)
    //  difficulty 2 = Hard:   best move + defensive awareness
    //
    //  FindBestMove now accepts an optional difficulty parameter.

    std::vector<std::int32_t> FindBestMove(RE::StaticFunctionTag*,
                                           std::int32_t a_handSize,
                                           bool a_ruleSame,
                                           bool a_rulePlus,
                                           bool a_ruleCombo,
                                           std::int32_t a_difficulty,
                                           bool a_ruleSameWall) {
        std::vector<std::int32_t> result = { -1, 0, 0 };

        auto handSize = std::clamp(static_cast<int>(a_handSize), 0, 5);
        auto startPos = std::uniform_int_distribution<int>(0, 8)(RNG());

        // ── Easy: 50% chance to just pick randomly ───────────────
        if (a_difficulty == 0) {
            if (std::uniform_int_distribution<int>(0, 1)(RNG()) == 0) {
                for (int i = 0; i < 9; ++i) {
                    int pos = (startPos + i) % 9;
                    if (!s_state.occupied[pos]) {
                        result[0] = pos;
                        result[1] = (handSize > 0)
                            ? std::uniform_int_distribution<int>(0, handSize - 1)(RNG())
                            : 0;
                        result[2] = 0;
                        SKSE::log::trace("FindBestMove(Easy): random pos={}, card={}",
                                         result[0], result[1]);
                        return result;
                    }
                }
            }
            // else fall through to normal evaluation
        }

        // ── Normal + Hard: evaluate all placements ───────────────
        struct Candidate {
            int pos, card, flips;
            int defensiveScore;  // only used by Hard
        };
        std::vector<Candidate> candidates;

        for (int i = 0; i < 9; ++i) {
            int pos = (startPos + i) % 9;
            if (s_state.occupied[pos]) continue;

            for (int c = 0; c < handSize; ++c) {
                int flips = EvaluatePlacement(pos, s_state.hand[c],
                    /*asOpponent=*/true, a_ruleSame, a_rulePlus, a_ruleCombo,
                    a_ruleSameWall);

                int defense = 0;
                if (a_difficulty >= 2 && flips >= 0) {
                    // Hard: penalize placements where the card's exposed
                    // values are low (easy for opponent to flip back).
                    const auto& h = s_state.hand[c];
                    int exposed = 0, count = 0;
                    if (AboveOf(pos) >= 0 && !s_state.occupied[AboveOf(pos)])
                        { exposed += h.top;    ++count; }
                    if (RightOf(pos) >= 0 && !s_state.occupied[RightOf(pos)])
                        { exposed += h.right;  ++count; }
                    if (BelowOf(pos) >= 0 && !s_state.occupied[BelowOf(pos)])
                        { exposed += h.bottom; ++count; }
                    if (LeftOf(pos) >= 0 && !s_state.occupied[LeftOf(pos)])
                        { exposed += h.left;   ++count; }
                    // Prefer high exposed values (harder for opponent to flip).
                    // Also prefer walls (count=0 means all exposed sides are
                    // walls = impossible to flip).
                    defense = (count > 0) ? (exposed / count) : 10;
                }

                candidates.push_back({ pos, c, flips, defense });
            }
        }

        if (candidates.empty()) {
            // Board full
            return result;
        }

        // Pick best candidate
        auto best = std::max_element(candidates.begin(), candidates.end(),
            [&](const Candidate& a, const Candidate& b) {
                if (a.flips != b.flips) return a.flips < b.flips;
                if (a_difficulty >= 2)  return a.defensiveScore < b.defensiveScore;
                return false;  // tie = keep first (random start handles this)
            });

        // If no flips at all, pick random (all candidates have flips==0)
        if (best->flips <= 0) {
            auto idx = std::uniform_int_distribution<std::size_t>(
                0, candidates.size() - 1)(RNG());
            best = candidates.begin() + static_cast<std::ptrdiff_t>(idx);
        }

        result[0] = best->pos;
        result[1] = best->card;
        result[2] = best->flips;

        SKSE::log::trace("FindBestMove(d={}): pos={}, card={}, flips={}, def={}",
                         a_difficulty, best->pos, best->card, best->flips,
                         best->defensiveScore);
        return result;
    }

    // =============================================================
    //  v2.0 — Statistics Tracking (SKSE Cosave)
    // =============================================================

    static struct Stats {
        std::int32_t totalWins       = 0;
        std::int32_t totalLosses     = 0;
        std::int32_t totalDraws      = 0;
        std::int32_t currentStreak   = 0;  // positive = wins, negative = losses
        std::int32_t bestWinStreak   = 0;
        std::int32_t totalGamesPlayed = 0;
    } s_stats;

    static constexpr std::uint32_t kCosaveType = 'TTNS';  // "Triple Triad Native Stats"
    static constexpr std::uint32_t kCosaveVersion = 1;

    void RecordWin(RE::StaticFunctionTag*) {
        s_stats.totalWins++;
        s_stats.totalGamesPlayed++;
        s_stats.currentStreak = (s_stats.currentStreak > 0)
            ? s_stats.currentStreak + 1 : 1;
        if (s_stats.currentStreak > s_stats.bestWinStreak)
            s_stats.bestWinStreak = s_stats.currentStreak;
        SKSE::log::info("Stats: Win! Total {}-{}-{}, streak {}, best {}",
            s_stats.totalWins, s_stats.totalLosses, s_stats.totalDraws,
            s_stats.currentStreak, s_stats.bestWinStreak);
    }

    void RecordLoss(RE::StaticFunctionTag*) {
        s_stats.totalLosses++;
        s_stats.totalGamesPlayed++;
        s_stats.currentStreak = (s_stats.currentStreak < 0)
            ? s_stats.currentStreak - 1 : -1;
        SKSE::log::info("Stats: Loss. Total {}-{}-{}",
            s_stats.totalWins, s_stats.totalLosses, s_stats.totalDraws);
    }

    void RecordDraw(RE::StaticFunctionTag*) {
        s_stats.totalDraws++;
        s_stats.totalGamesPlayed++;
        s_stats.currentStreak = 0;
        SKSE::log::info("Stats: Draw. Total {}-{}-{}",
            s_stats.totalWins, s_stats.totalLosses, s_stats.totalDraws);
    }

    // Returns [wins, losses, draws, currentStreak, bestWinStreak, totalGames]
    std::vector<std::int32_t> GetStats(RE::StaticFunctionTag*) {
        return {
            s_stats.totalWins,
            s_stats.totalLosses,
            s_stats.totalDraws,
            s_stats.currentStreak,
            s_stats.bestWinStreak,
            s_stats.totalGamesPlayed
        };
    }

    void ResetStats(RE::StaticFunctionTag*) {
        s_stats = {};
        SKSE::log::info("Stats: Reset");
    }

    // ── Cosave callbacks ─────────────────────────────────────────

    void SaveCallback(SKSE::SerializationInterface* a_intfc) {
        if (!a_intfc->OpenRecord(kCosaveType, kCosaveVersion)) {
            SKSE::log::error("Cosave: failed to open record");
            return;
        }
        a_intfc->WriteRecordData(&s_stats, sizeof(s_stats));
        SKSE::log::info("Cosave: saved stats ({} games)", s_stats.totalGamesPlayed);
    }

    void LoadCallback(SKSE::SerializationInterface* a_intfc) {
        std::uint32_t type, version, length;
        while (a_intfc->GetNextRecordInfo(type, version, length)) {
            if (type == kCosaveType) {
                if (version == kCosaveVersion && length == sizeof(s_stats)) {
                    a_intfc->ReadRecordData(&s_stats, sizeof(s_stats));
                    SKSE::log::info("Cosave: loaded stats ({} games, {}-{}-{})",
                        s_stats.totalGamesPlayed, s_stats.totalWins,
                        s_stats.totalLosses, s_stats.totalDraws);
                } else {
                    SKSE::log::warn("Cosave: version/size mismatch (v={}, len={}), "
                                    "resetting stats", version, length);
                    s_stats = {};
                }
            }
        }
    }

    void RevertCallback(SKSE::SerializationInterface*) {
        s_stats = {};
    }

    // =============================================================
    //  v2.0 — Card Collection Counter
    // =============================================================
    //
    //  Counts how many unique forms from `allCards` the player owns
    //  (either in inventory or in a storage container).  O(n) native
    //  vs O(n^2) Papyrus nested loops.

    std::vector<std::int32_t> CountCollection(RE::StaticFunctionTag*,
                                              RE::BGSListForm* a_allCards,
                                              RE::TESObjectREFR* a_player,
                                              RE::TESObjectREFR* a_storage) {
        // Returns [owned, total]
        std::vector<std::int32_t> result = { 0, 0 };
        if (!a_allCards) return result;

        auto total = static_cast<std::int32_t>(a_allCards->forms.size());
        result[1] = total;

        if (!a_player) return result;

        int owned = 0;
        auto playerInv = a_player->GetInventory();
        auto storageInv = a_storage ? a_storage->GetInventory()
                                    : decltype(playerInv){};

        for (auto* form : a_allCards->forms) {
            if (!form) continue;
            bool found = false;

            // Check player inventory
            auto it = playerInv.find(form->As<RE::TESBoundObject>());
            if (it != playerInv.end() && it->second.first > 0)
                found = true;

            // Check storage container
            if (!found && a_storage) {
                auto it2 = storageInv.find(form->As<RE::TESBoundObject>());
                if (it2 != storageInv.end() && it2->second.first > 0)
                    found = true;
            }

            if (found) ++owned;
        }

        result[0] = owned;
        SKSE::log::trace("CountCollection: {}/{}", owned, total);
        return result;
    }

    // =============================================================
    //  Registration
    // =============================================================

    void RegisterCosave() {
        auto* serial = SKSE::GetSerializationInterface();
        if (serial) {
            serial->SetUniqueID(kCosaveType);
            serial->SetSaveCallback(SaveCallback);
            serial->SetLoadCallback(LoadCallback);
            serial->SetRevertCallback(RevertCallback);
            SKSE::log::info("Cosave serialization registered");
        }
    }

    bool Register(RE::BSScript::IVirtualMachine* a_vm) {
        // FOV
        a_vm->RegisterFunction("SetFOV"sv,   SCRIPT, SetFOV);
        a_vm->RegisterFunction("ResetFOV"sv, SCRIPT, ResetFOV);

        // FormList utilities
        a_vm->RegisterFunction("GetRandomForm"sv,        SCRIPT, GetRandomForm);
        a_vm->RegisterFunction("GetRandomFormInRange"sv,  SCRIPT, GetRandomFormInRange);
        a_vm->RegisterFunction("GetRandomForms"sv,        SCRIPT, GetRandomForms);

        // AI board evaluation
        a_vm->RegisterFunction("ResetBoard"sv,    SCRIPT, ResetBoard);
        a_vm->RegisterFunction("SetBoardCard"sv,  SCRIPT, SetBoardCard);
        a_vm->RegisterFunction("SetHandCard"sv,   SCRIPT, SetHandCard);
        a_vm->RegisterFunction("FindBestMove"sv,  SCRIPT, FindBestMove);

        // v2.0 — Statistics
        a_vm->RegisterFunction("RecordWin"sv,     SCRIPT, RecordWin);
        a_vm->RegisterFunction("RecordLoss"sv,    SCRIPT, RecordLoss);
        a_vm->RegisterFunction("RecordDraw"sv,    SCRIPT, RecordDraw);
        a_vm->RegisterFunction("GetStats"sv,      SCRIPT, GetStats);
        a_vm->RegisterFunction("ResetStats"sv,    SCRIPT, ResetStats);

        // v2.0 — Collection counter
        a_vm->RegisterFunction("CountCollection"sv, SCRIPT, CountCollection);

        SKSE::log::info("Registered {} Papyrus native functions on {}", 16, SCRIPT);
        return true;
    }

}  // namespace TT::Papyrus
