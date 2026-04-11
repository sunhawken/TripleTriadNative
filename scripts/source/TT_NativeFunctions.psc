Scriptname TT_NativeFunctions Hidden
{Native functions provided by TripleTriadNative.dll (SKSE plugin).
 Replaces ConsoleUtil dependency and adds fast AI board evaluation.}

; === FOV Control (replaces ConsoleUtil) ===================================
; Saves the current camera FOV, then overrides it.  Call ResetFOV() to restore.

Function SetFOV(float fov) native global
Function ResetFOV() native global

; === FormList Utilities ===================================================
; NOTE: These operate on base plugin forms only.
; Forms added at runtime via Papyrus AddForm() are NOT included.
; For those, use the standard FormList.GetAt() method.

Form Function GetRandomForm(FormList akList) native global
Form Function GetRandomFormInRange(FormList akList, int minIndex, int maxIndex) native global
Form[] Function GetRandomForms(FormList akList, int count, bool allowDuplicates = false) native global

; === AI Board Evaluation ==================================================
; Evaluates the opponent's best move in native code, eliminating the
; Wait(0.1) calls between each (position, card) check in Papyrus.
;
; Usage:
;   1. TT_NativeFunctions.ResetBoard()
;   2. For each occupied board position (0-8):
;        TT_NativeFunctions.SetBoardCard(pos, top, right, bottom, left, isPlayerOwned)
;   3. For each opponent hand card (index 0-4):
;        TT_NativeFunctions.SetHandCard(index, top, right, bottom, left)
;   4. int[] result = TT_NativeFunctions.FindBestMove(handSize, ruleSame, rulePlus, ruleCombo)
;      result[0] = best board position (0-8, or -1 if board full)
;      result[1] = best hand card index
;      result[2] = max flip count (0 = no flips, 5 = combo triggered)

Function ResetBoard() native global
Function SetBoardCard(int position, int top, int right, int bottom, int left, bool isPlayerOwned) native global
Function SetHandCard(int index, int top, int right, int bottom, int left) native global
int[] Function FindBestMove(int handSize, bool ruleSame, bool rulePlus, bool ruleCombo) native global
