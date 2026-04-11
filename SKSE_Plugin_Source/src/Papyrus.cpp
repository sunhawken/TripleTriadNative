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
        auto* cam = RE::PlayerCamera::GetSingleton();
        if (!cam) {
            SKSE::log::warn("SetFOV: PlayerCamera unavailable");
            return;
        }

        // Save the original FOV on first call so ResetFOV can restore it.
        if (!s_fovSaved) {
            s_savedWorldFOV       = cam->worldFOV;
            s_savedFirstPersonFOV = cam->firstPersonFOV;
            s_fovSaved            = true;
            SKSE::log::info("SetFOV: saved original (world={:.1f}, fp={:.1f})",
                            s_savedWorldFOV, s_savedFirstPersonFOV);
        }

        cam->worldFOV       = a_fov;
        cam->firstPersonFOV = a_fov;

        // In Skyrim VR the HMD lens dictates the visual FOV; worldFOV still
        // affects UI/2D rendering but will not visually zoom the view.
        if (REL::Module::IsVR()) {
            SKSE::log::info("SetFOV: {:.1f} (VR: visual FOV is HMD-controlled)", a_fov);
        } else {
            SKSE::log::info("SetFOV: {:.1f}", a_fov);
        }
    }

    void ResetFOV(RE::StaticFunctionTag*) {
        if (!s_fovSaved) return;  // nothing to restore

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
    //
    //  These read from BGSListForm::forms (base plugin forms).
    //  Forms added at runtime via Papyrus AddForm() are stored in a
    //  separate internal list and are NOT included.  For those, fall
    //  back to the Papyrus FormList.GetAt() method.

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
            // Fisher-Yates partial shuffle for unique picks.
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
    //
    //  The opponent AI in Triple Triad evaluates every (position, card)
    //  combination via PlaceCard() with Wait(0.1) between iterations.
    //  That adds ~4.5 seconds of pure sleep per turn.
    //
    //  These native functions let Papyrus pass the board state once,
    //  then evaluate all possibilities in microseconds.
    //
    //  Usage from Papyrus:
    //    1. TT_NativeFunctions.ResetBoard()
    //    2. For each occupied position:
    //         TT_NativeFunctions.SetBoardCard(pos, T, R, B, L, isPlayer)
    //    3. For each opponent hand card:
    //         TT_NativeFunctions.SetHandCard(idx, T, R, B, L)
    //    4. int[] result = TT_NativeFunctions.FindBestMove(handSize, ...)
    //       result[0] = best position (0-8), result[1] = card index, result[2] = flip count

    struct CardStats {
        int top    = 0;
        int right  = 0;
        int bottom = 0;
        int left   = 0;
    };

    static struct {
        bool      occupied[9]     = {};
        bool      isPlayerOwned[9] = {};
        CardStats board[9]        = {};
        CardStats hand[5]         = {};
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

    // Evaluate how many enemy cards placing `card` at `pos` would flip.
    // `asOpponent == true` means the opponent is placing (enemy = player-owned cards).
    // Mirrors the logic in TT_Skyrim_QuestScript.PlaceCard(CheckPosition=true).
    static int EvaluatePlacement(int pos, const CardStats& card, bool asOpponent,
                                 bool ruleSame, bool rulePlus, bool ruleCombo) {
        int topP    = AboveOf(pos);
        int rightP  = RightOf(pos);
        int bottomP = BelowOf(pos);
        int leftP   = LeftOf(pos);

        bool flipTop = false, flipRight = false, flipBottom = false, flipLeft = false;
        bool sameHit = false, plusHit = false;

        // Helper: is adjacent card owned by the "enemy" of the placer?
        auto isEnemy = [&](int adj) -> bool {
            if (adj < 0 || !s_state.occupied[adj]) return false;
            return asOpponent ? s_state.isPlayerOwned[adj]
                              : !s_state.isPlayerOwned[adj];
        };

        // Value the placed card exposes toward a given adjacent position.
        auto myVal = [&](int adj) -> int {
            if (adj == topP)    return card.top;
            if (adj == rightP)  return card.right;
            if (adj == bottomP) return card.bottom;
            if (adj == leftP)   return card.left;
            return 0;
        };

        // Value the adjacent board card exposes back toward `pos`.
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

        // All 6 unordered pairs of adjacent positions
        // (same pairs checked in the original Papyrus code).
        struct Pair { int a; int b; };
        constexpr int ADJ_COUNT = 4;
        int adj[ADJ_COUNT];  // filled below
        adj[0] = topP; adj[1] = rightP; adj[2] = bottomP; adj[3] = leftP;

        // ── Same rule ────────────────────────────────────────────
        if (ruleSame) {
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

        // ── Combo rule: if Same or Plus triggered, return max priority ──
        if (ruleCombo && (sameHit || plusHit)) {
            return 5;  // matches Papyrus `Return 5` for Combo
        }

        // ── Count flips from Same/Plus ───────────────────────────
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

    std::vector<std::int32_t> FindBestMove(RE::StaticFunctionTag*,
                                           std::int32_t a_handSize,
                                           bool a_ruleSame,
                                           bool a_rulePlus,
                                           bool a_ruleCombo) {
        // Result: [bestPosition, bestCardIndex, maxFlips]
        std::vector<std::int32_t> result = { -1, 0, 0 };

        int bestFlips = 0;
        int bestPos   = -1;
        int bestCard  = 0;

        // Randomize starting position so ties are broken unpredictably
        // (matches the original Papyrus behavior).
        auto startPos = std::uniform_int_distribution<int>(0, 8)(RNG());
        auto handSize = std::clamp(static_cast<int>(a_handSize), 0, 5);

        for (int i = 0; i < 9; ++i) {
            int pos = (startPos + i) % 9;
            if (s_state.occupied[pos]) continue;

            for (int c = 0; c < handSize; ++c) {
                int flips = EvaluatePlacement(pos, s_state.hand[c], /*asOpponent=*/true,
                                              a_ruleSame, a_rulePlus, a_ruleCombo);
                if (flips > bestFlips) {
                    bestFlips = flips;
                    bestPos   = pos;
                    bestCard  = c;
                }
            }
        }

        // No card flips anything -- pick a random empty position and random card.
        if (bestPos < 0) {
            for (int i = 0; i < 9; ++i) {
                int pos = (startPos + i) % 9;
                if (!s_state.occupied[pos]) {
                    bestPos = pos;
                    break;
                }
            }
            if (handSize > 0) {
                bestCard = std::uniform_int_distribution<int>(0, handSize - 1)(RNG());
            }
        }

        result[0] = bestPos;
        result[1] = bestCard;
        result[2] = bestFlips;

        SKSE::log::trace("FindBestMove: pos={}, card={}, flips={}", bestPos, bestCard, bestFlips);
        return result;
    }

    // =============================================================
    //  Registration
    // =============================================================

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

        SKSE::log::info("Registered 9 Papyrus native functions on {}", SCRIPT);
        return true;
    }

}  // namespace TT::Papyrus
