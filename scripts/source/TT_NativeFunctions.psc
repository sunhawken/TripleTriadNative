Scriptname TT_NativeFunctions Native Hidden
{Native functions provided by TripleTriadNative.dll v2.0 (SKSE plugin).
 Replaces ConsoleUtil dependency and adds fast AI board evaluation,
 difficulty levels, win/loss tracking with cosave persistence,
 Same Wall rule, and card collection counting.}

; === FOV Control (replaces ConsoleUtil) ===================================
; Saves the current camera FOV, then overrides it.  Call ResetFOV() to restore.
; In VR these are no-ops (HMD controls FOV; SE offsets are unsafe in VR).

Function SetFOV(float fov) native global
Function ResetFOV() native global

; === FormList Utilities ===================================================
; NOTE: These operate on base plugin forms only.
; Forms added at runtime via Papyrus AddForm() are NOT included.

Form Function GetRandomForm(FormList akList) native global
Form Function GetRandomFormInRange(FormList akList, int minIndex, int maxIndex) native global
Form[] Function GetRandomForms(FormList akList, int count, bool allowDuplicates = false) native global

; === AI Board Evaluation ==================================================
; Usage:
;   1. TT_NativeFunctions.ResetBoard()
;   2. For each occupied board position (0-8):
;        TT_NativeFunctions.SetBoardCard(pos, top, right, bottom, left, isPlayerOwned)
;   3. For each opponent hand card (index 0-4):
;        TT_NativeFunctions.SetHandCard(index, top, right, bottom, left)
;   4. int[] result = TT_NativeFunctions.FindBestMove(handSize, ruleSame, rulePlus, ruleCombo, difficulty, ruleSameWall)
;      result[0] = best board position (0-8, or -1 if board full)
;      result[1] = best hand card index
;      result[2] = max flip count (0 = no flips, 5 = combo triggered)

Function ResetBoard() native global
Function SetBoardCard(int position, int top, int right, int bottom, int left, bool isPlayerOwned) native global
Function SetHandCard(int index, int top, int right, int bottom, int left) native global

; difficulty: 0 = Easy (50% random moves), 1 = Normal (v1 behavior), 2 = Hard (defensive awareness)
; ruleSameWall: if true, board edges count as value "A" (10) for Same rule
int[] Function FindBestMove(int handSize, bool ruleSame, bool rulePlus, bool ruleCombo, int difficulty = 1, bool ruleSameWall = false) native global

; === v2.0 — Win/Loss Statistics (persisted via SKSE cosave) ===============
; Call these from the EndGame() function in TT_Skyrim_QuestScript.

Function RecordWin() native global
Function RecordLoss() native global
Function RecordDraw() native global

; Returns [wins, losses, draws, currentStreak, bestWinStreak, totalGamesPlayed]
int[] Function GetStats() native global

; Resets all statistics to zero.
Function ResetStats() native global

; === v2.0 — Card Collection Counter =======================================
; Counts how many unique forms from allCards the player owns (in inventory
; or in the storage container).  Returns [owned, total].
; Much faster than Papyrus nested loops for large card lists.

int[] Function CountCollection(FormList allCards, ObjectReference playerRef, ObjectReference storageContainer = None) native global
