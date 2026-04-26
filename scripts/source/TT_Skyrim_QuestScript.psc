Scriptname TT_Skyrim_QuestScript extends Quest 
Import Utility;	Included by TTTT_v1
Topic Property TT_TripleTriadCardGameQuestGoodbye Auto
Actor Property PlayerRef Auto
Actor Property Opponent Auto Hidden
ReferenceAlias Property TT_OpponentAlias Auto
ReferenceAlias Property TT_CardToGet Auto
ObjectReference Property TT_CardFetchChestRef Auto
;Excluded by TTTT_v1: Actor[] Property CityVendors Auto ;used to add a cardpack and game board to main vendors on init

;these are used to display rules in the set rules and display rules messages
ReferenceAlias Property TT_RuleSameDisplay Auto
ObjectReference Property TT_RuleSameCheckedRef Auto 
ObjectReference Property TT_RuleSameUnCheckedRef Auto 

ReferenceAlias Property TT_RulePlusDisplay Auto
ObjectReference Property TT_RulePlusCheckedRef Auto 
ObjectReference Property TT_RulePlusUnCheckedRef Auto 

ReferenceAlias Property TT_RuleCoinTossDisplay Auto
ObjectReference Property TT_RuleCoinTossCheckedRef Auto 
ObjectReference Property TT_RuleCoinTossUnCheckedRef Auto 

ReferenceAlias Property TT_RuleComboDisplay Auto
ObjectReference Property TT_RuleComboCheckedRef Auto 
ObjectReference Property TT_RuleComboUnCheckedRef Auto 

ReferenceAlias Property TT_RuleOpenDisplay Auto
ObjectReference Property TT_RuleOpenCheckedRef Auto 
ObjectReference Property TT_RuleOpenUnCheckedRef Auto 

ReferenceAlias Property TT_RuleRandomDisplay Auto
ObjectReference Property TT_RuleRandomCheckedRef Auto 
ObjectReference Property TT_RuleRandomUnCheckedRef Auto 

ReferenceAlias Property TT_RuleTransferDisplay Auto
ObjectReference Property TT_RuleTransferCheckedRef Auto 
ObjectReference Property TT_RuleTransferUnCheckedRef Auto 

ReferenceAlias Property TT_RuleHoldsDisplay Auto
ObjectReference Property TT_RuleHoldsCheckedRef Auto 
ObjectReference Property TT_RuleHoldsUnCheckedRef Auto 

ReferenceAlias Property TT_TradeRule_Display Auto
ObjectReference Property TT_TradeRule_0 Auto
ObjectReference Property TT_TradeRule_1 Auto
ObjectReference Property TT_TradeRule_2 Auto
ObjectReference Property TT_TradeRule_3 Auto     

ReferenceAlias Property TT_Holds_Display Auto
ObjectReference[] Property TT_HoldDisplayRefs Auto
ObjectReference Property TT_HoldDisplayRandom Auto

ReferenceAlias Property TT_Thane_Display Auto
ObjectReference Property TT_Hold_ThaneYes Auto
ObjectReference Property TT_Hold_ThaneNo Auto

ReferenceAlias Property TT_CoinDisplay Auto
ObjectReference Property TT_CoinHeadsRef Auto 
ObjectReference Property TT_CoinTailsRef Auto
 
ReferenceAlias Property TT_NPCBossCardsDisplay Auto
;====================================================================

ObjectReference Property TT_DisplayBookCardsChestRef Auto 
ObjectReference Property TT_CheckedRef Auto 
ObjectReference Property TT_UnCheckedRef Auto 
ObjectReference Property TT_UnCheckedMinusRef Auto 

ReferenceAlias[] Property TT_DisplayBookCardAliasArray Auto ;alias's display as checked [X] in book if they have the card. 
ReferenceAlias Property TT_DisplayBookCardsAlias Auto ;the card tracker book alias
MiscObject Property TT_zDisplayAelaMisc auto 
MiscObject Property TT_zDisplayMudcrabMisc auto
Book Property TT_CardsDisplaybook Auto

ObjectReference Property TT_PlayerMarkerRef Auto ;marker in game interface cell
ObjectReference Property TT_PlayerCardsChest Auto ;contains the cards the player currently has
ObjectReference Property TT_WinnerChestA Auto ;used for end game, player chooses 1 card if they win.

TT_PlayerCardsChestScript Property TT_PlayerChestScript Auto
TT_WinnersChestScript Property TT_ScoreScript auto 

Static Property XMarker Auto
ObjectReference Property PreviousLocation Auto Hidden
ObjectReference Property OpponentPreviousLocation Auto Hidden

ObjectReference Property TT_EndGameTakeCardDisplay Auto ;Used to display which cards are taken by opponent at end game.

ObjectReference Property CurrentPlayerActCard Auto Hidden ;disabled hand card
ObjectReference Property CurrentPlayerStatCard Auto Hidden ;enabled selected hand card

ObjectReference[] Property TT_PlayerHandMarkers Auto Hidden ;markers to place player hand card activators at 
ObjectReference[] Property TT_PlayerHandMarkersB Auto Hidden ;markers to place player hand card statics at for displaying selected card. 
ObjectReference[] Property TT_PlayerHandActivators Auto Hidden ;Player's card hand activators, used for choosing card to place 
ObjectReference[] Property TT_PlayerHandStatics Auto Hidden ;Player's card hand statics, used for highlighting selected card
Formlist Property TT_PlacedPlayerHandActiCards Auto

Static Property TT_MudCrabCard Auto ;actually a blank card with a double back. used for closed display
ObjectReference[] Property TT_OpponentHandMarkers Auto Hidden ;markers to place oppenent hand card Static's at 
ObjectReference[] Property TT_OpponentHandStatics Auto Hidden ;Opponent's card hand statics, used for display 
Int Property OpponentsSelectedCard Auto Hidden ;current opponent card selected

Formlist Property TT_PlayerHandMarkers_FL Auto ;used to fill TT_PlayerHandMarkers OnInit
Formlist Property TT_PlayerHandMarkersB_FL Auto ;used to fill TT_PlayerHandMarkersB OnInit
Formlist Property TT_OpponentHandMarkers_FL Auto ;used to fill TT_OpponentHandMarkers OnInit

MiscObject Property Gold001 Auto

ObjectReference Property TT_PlayerCoin Auto 
ObjectReference Property TT_OpponentCoin Auto 

Int Property CardPackMinCards = 3 Auto Hidden 
Int Property CardPackMaxCards = 5 Auto Hidden
Message Property TT_CardPackMinCardsMsg Auto
Message Property TT_CardPackMaxCardsMsg Auto

Message Property TT_SetGoldInjectAmountMsg Auto
Message Property TT_SetPreferedBetAmountMsg Auto
Message Property TT_SetBetConfirmMsg Auto
Message Property TT_SetBetMsg Auto
MagicEffect Property TT_BetAddGoldCheckFX Auto 
Spell Property TT_BetAddGoldCheckSpell Auto 
GlobalVariable Property TT_BetMinus10 Auto
GlobalVariable Property TT_BetMinus100 Auto
GlobalVariable Property TT_BetPlus10 Auto
GlobalVariable Property TT_BetPlus100 Auto
GlobalVariable Property TT_OpponentGold auto

Int Property BetAmount Auto Hidden
Int Property PreferedBetAmount = 50 Auto Hidden
Int Property GoldInjectAmount = 300 Auto Hidden

GlobalVariable Property TT_OfferServiceRestrict Auto ;if set to 1, triple triad dialogue doesn't show up for NPC's that are offering services 
Message Property TT_OfferServiceRestrictMsg Auto
ReferenceAlias Property TT_OfferServiceRestrictDisplayAlias Auto

GlobalVariable Property TT_BuyCardsDialogueGv Auto
Message Property TT_BuyBackCardsMsg Auto 
ReferenceAlias Property TT_BuyBackCardsAlias Auto 

Message Property SetCardPackMethodsMsg Auto 
ReferenceAlias Property TT_VendorCardPackAutoDisplay Auto 
ReferenceAlias Property TT_NPCCardPackAutoDisplay Auto 
ObjectReference Property TT_CardPackAuto Auto 
ObjectReference Property TT_CardPackMenu Auto 

;these are used to visualize coin flips
ObjectReference Property TT_CoinRefMarker Auto
ObjectReference[] Property TT_0_CoinFlipPositions Auto 
ObjectReference[] Property TT_1_CoinFlipPositions Auto 
ObjectReference[] Property TT_2_CoinFlipPositions Auto 
ObjectReference[] Property TT_3_CoinFlipPositions Auto 
ObjectReference[] Property TT_CoinFlipPositions Auto ;position 4 
ObjectReference[] Property TT_5_CoinFlipPositions Auto 
ObjectReference[] Property TT_6_CoinFlipPositions Auto 
ObjectReference[] Property TT_7_CoinFlipPositions Auto 
ObjectReference[] Property TT_8_CoinFlipPositions Auto 

;;used to display score===========================
ObjectReference[] Property TT_PlayerNumbers Auto 
ObjectReference[] Property TT_OpponentNumbers Auto 
Int Property PreviousPlayerScore Auto Hidden
Int Property PreviousOpponentScore Auto Hidden
;===================================================

ObjectReference[] Property TT_BoardMarkers Auto Hidden ;board activator refs
ObjectReference[] Property TT_PlayerBoardCards Auto Hidden ;static player card refs 
ObjectReference[] Property TT_OpponentBoardCards Auto Hidden ;Static opponent card refs
MiscObject[] Property TT_BoardMiscCards Auto Hidden ;Stores misc cards for their stats
TT_Skyrim_CardScript[] Property BoardCardScripts Auto Hidden ;misc card scripts, used to easily access TT_BoardMiscCards scripts 

Formlist Property TT_BoardCardRefs Auto ;board activator refs, used to fill TT_BoardMarkers oninit

Formlist Property TT_CardLevelsLists Auto ;Formlist of the 10 card level formlists

Quest property MQ305 Auto
VoiceType Property MaleUniqueCicero Auto ;
Formlist Property TT_UniqueCardHolders Auto ;base actor forms that have unique character cards
Formlist Property TT_UniqueCards Auto ;Unique character cards
Formlist Property TT_UniqueCardsB Auto 
Formlist Property TT_UniqueCardsC Auto
FormList Property TT_UniqueModCards Auto
;Unique character cardsB, initially empty. It's filled onInit with the above list 
;so they can be removed later with RemoveAddedForm(Form apForm) 

Formlist Property TT_AllCardsMiscListByValue Auto
Formlist Property TT_AllCardsActivatorList Auto ;all Activator player cards
Formlist Property TT_AllCardsMiscList Auto ;all Misc player cards
Formlist Property TT_AllModCardsMiscList Auto ;All extra misc cards added by separate esps.
Formlist Property TT_AllCardsList Auto ;all static player cards
Formlist Property TT_AllCardsListB Auto ;all static opponent cards
Formlist Property TT_PlayersCurrentCards Auto ;tracks players current cards for the random rule
GlobalVariable Property TT_PlayerCardCount Auto 
MiscObject[] Property TT_PlayerCardsArrayB Auto Hidden;	Included by TTTT_v1
MiscObject[] Property TT_PlayerCardsArray Auto Hidden 
MiscObject[] Property TT_OpponentCardsArray Auto Hidden
Miscobject[] Property TT_OpponentCardsArrayB Auto Hidden
Formlist Property TT_OpponentCards Auto ;empty list -
Formlist Property TT_OpponentCardsB Auto ;empty list

Formlist Property TT_ListsToPullFrom Auto 
;empty list, filled with 3 - 4 leveled card lists to choose opponent card hand  

Sound Property TT_SelectCard Auto 
Sound Property TT_CardFlip Auto
Sound Property TT_PlaceCard Auto
Sound Property TT_Combo Auto
Sound Property TT_Plus_Same Auto
Sound Property TT_CoinFlipHit Auto 
Sound Property TT_CoinFlip Auto 
Sound PRoperty TT_WinGameSound Auto

Message Property TT_WaitTurnMsg Auto 
Message Property TT_ChooseCardFirstMsg Auto
Message Property TT_OnlyTripleTriadCardsMsg Auto
Message Property TT_OnlyOneUniqueCardmsg Auto
Message Property TT_CardCountMsg Auto
Message Property TT_CardNotRecognizedMsg Auto
Message PRoperty TT_5CardsChosenMsg Auto
Message Property TT_NoCardsPlaceCoinMsg Auto
Message Property TT_GameOverNoCoinMsg Auto

Message Property TT_InstalledMsg Auto
Message Property TT_SettingUpBoardMsg Auto
Message Property TT_Choose5CardsMsg Auto
Message Property TT_NotEnoughCardsChosenMsg Auto
Message Property TT_YouStartMsg Auto
Message Property TT_ThinkingMsg Auto
Message Property TT_PlusMsg Auto
Message Property TT_SameMsg Auto
Message Property TT_ComboMsg Auto
Message Property TT_YourTurnMsg Auto
Message Property TT_TieGameDirectMsg Auto
Message Property TT_TieGameMsg Auto
Message Property TT_WinMsg Auto
Message Property TT_WinDirectMsg Auto
Message Property TT_LoseMsg Auto
Message Property TT_NotEnoughCardsMsg Auto 

Message Property TT_PlayAgain Auto
Message Property TT_ConfigMsg Auto 
Message Property TT_AutoTransferMsg Auto 
Message Property TT_NPCBossCardsMsg Auto 

Message Property TT_SetRules Auto
Message Property TT_SetLocationRules Auto
Message Property TT_SetTradeRules Auto
Message Property TT_OpponentStartsMsg Auto
Message Property TT_OpponentTossesCoin Auto
Message Property TT_DisplayRules Auto
Message Property TT_HeadsOrTails Auto 

Spell Property TT_PreventWeaponDrawSpell Auto
Spell Property TT_PreventExtraActorsCloak Auto
Spell Property TT_UniqueCardRewardSpell Auto
;TOP Excluded by TTTT_v1
;LeveledItem Property LItemMiscVendorLockpicks75 Auto ;use all, chance none = 25
;LeveledItem Property DLC2LootBanditRandom Auto ;Use all, chance none = 25, 
;LeveledItem Property LootBanditRandom Auto ;Use All, chance none = 25, 
;LeveledItem Property LootBanditRandomWizard Auto ;Use All, Chance none = 15,
;LeveledItem Property LootForswornRandom Auto ;Use All, Chance none = 25,
;LeveledItem Property LootWarlockRandom Auto ;Use All, Chance none = 25,
;LeveledItem Property LootVampireRandom Auto ;Use All, Chance none = 25,
;LeveledItem Property LootSilverHandRandom Auto ;Use All, Chance none = 25,

;LeveledItem Property TT_NPCCardPackBook_L Auto ;added to loot lists oninit. Chance none = 50
;LeveledItem Property TT_CardPack_L auto ;added to vendor list on init Chance none = 50
;LeveledItem Property TT_RuleBook_L auto ;added to vendor list on init. Chance none = 50
;LeveledItem Property TT_BoardMisc_L auto ;added to vendor list on init. Chance none = 50

;MiscObject Property TT_CardPack Auto ;No longer used, light used instead so can be equipped.
;Light Property TT_CardPackTorch Auto ;Player card pack, added to city vendors directly oninit

;Book Property TT_RuleBook Auto ;Rules explained, added to city vendors directly oninit
;MiscObject Property TT_BoardMisc Auto ;No longer used, light used instead for favorite and equip
;Light Property TT_BoardTorch Auto ;game board, added to city vendors directly oninit
;END Excluded by TTTT_v1
;Triple Triad dialogue is disabled if player doesn't have a board.

;used for TradeCards(), triggered from dialogue ====
faction property TT_BuySellCardsFaction Auto 
ObjectReference Property TT_CardVendorChestRef Auto 
ReferenceAlias Property TT_VendorPlayerAlias Auto 
{"force player to this alias when trading cards. Keeps cards on NPC's person rather than vendor chest."}
TT_VendorPlayerAliasScript Property VendorPlayerAliasScript Auto
Formlist Property TT_VendorLists Auto
KeyWord Property TT_Card_KWD Auto
Perk Property TT_BuySellCardsPerk Auto 
;=====================================================

Int[] property CardLevelGoldValues auto Hidden ;used to save and determine card levels

Bool Property TransferCards = True Auto Hidden
Bool Property TransferCardsSave Auto Hidden 
Bool Property VendorCardPackAuto = False Auto Hidden
Bool Property NPCCardPackAuto = True Auto Hidden

Bool Property OpponentHasTT_CardToGet Auto Hidden
Bool Property PlayerHasTT_CardToGet Auto Hidden
Bool Property OpponentsTurn Auto Hidden 
Bool Property GameActive = False Auto Hidden
Bool Property FirstPersonCheck Auto Hidden
Float Property PlayerSpeed Auto Hidden

Int Property CardsPlaced Auto Hidden
Int Property CardsTaken = 0 Auto Hidden ;used for endgame, tracks how many cards the player has taken from opponent 
Bool Property GiftMenuOpen = false Auto Hidden
Bool Property EndGameCheck = false Auto Hidden
Bool Property CancelGame = false Auto Hidden

Int Property RandomGameRules = 0 Auto Hidden 
;0 Never randomize 
;1 Only randomize if hold isn't found 
;2 Randomize when hold isn't found and you're not thane of the hold 
;3 Randmize always 

Bool Property HoldRulesToggle = True Auto Hidden
Bool Property Rule_Same Auto Hidden 
Bool Property Rule_Plus Auto Hidden 
Bool Property Rule_CoinToss Auto Hidden
Bool Property Rule_Combo Auto Hidden 
Bool Property Rule_Open Auto Hidden 
Bool Property Rule_Random = false Auto Hidden
Int Property TradeRules = 0 Auto Hidden 
Bool Property NPCBossCards Auto Hidden

Bool[] Property Holds_Rule_Same Auto Hidden 
Bool[] Property Holds_Rule_Plus Auto Hidden 
Bool[] Property Holds_Rule_CoinToss Auto Hidden
Bool[] Property Holds_Rule_Combo Auto Hidden 
Bool[] Property Holds_Rule_Open Auto Hidden 
Bool[] Property Holds_Rule_Random Auto Hidden
Int[] Property Holds_TradeRules Auto Hidden

;0 = One, take only one card
;1 = Direct, you get all the cards you captured and lose all the cards you conceded during play.
;2 = Diff, the amount of cards you get or lose equals the difference in score. So, if score is 6-4 you get 2 cards. 
;3 = All, Winner takes all the cards from the opponent's hand.

Formlist Property TT_HoldLocations Auto ;fills HoldLocations onInit
Location[] Property HoldLocations Auto Hidden ;the 9 holds, used for determining rules
FavorJarlsMakeFriendsScript Property ThaneScript Auto ;used to determine if player is thane of above holds.

Int Property WinnerCardAmount = 1 Auto Hidden
Bool PlayerStarts ;used for end game score. 

;ObjectReference Property TT_CoinHeads Auto 
;ObjectReference Property TT_CoinTails Auto 
GlobalVariable Property TT_Flips Auto

Event OnInit()
    RegisterForSingleUpdate(1)
    ;RegisterForKey(56) ;l alt
EndEvent

Event OnUpdate() 
    Install_TT()
EndEvent

Function Install_TT()
    
    Wait(1)
    
    
    TT_PlayerHandMarkers = New ObjectReference[5]
    TT_PlayerHandMarkersB = New ObjectReference[5]
    TT_PlayerHandActivators = New ObjectReference[5]
    TT_OpponentHandMarkers = New ObjectReference[5]
    TT_OpponentHandStatics = New ObjectReference[5]
    TT_PlayerHandStatics = New ObjectReference[5]
    
    HoldLocations = New Location[9]
    
    Int Ma = TT_UniqueCards.GetSize()
    While Ma > 0
       Ma -= 1
       TT_UniqueCardsB.AddForm(TT_UniqueCards.GetAt(Ma))
    EndWhile
    
    Int Ia = -1
    While Ia < 4
        Ia += 1
        TT_PlayerHandMarkers[Ia] = TT_PlayerHandMarkers_FL.GetAt(Ia) as ObjectReference
        TT_PlayerHandMarkersB[Ia] = TT_PlayerHandMarkersB_FL.GetAt(Ia) as ObjectReference
        TT_OpponentHandMarkers[Ia] = TT_OpponentHandMarkers_FL.GetAt(Ia) as ObjectReference
    EndWhile
	
    BoardCardScripts = New TT_Skyrim_CardScript[9]
    TT_BoardMiscCards = New MiscObject[9]
    TT_PlayerBoardCards = New ObjectReference[9]
    TT_OpponentBoardCards = New ObjectReference[9]
    TT_BoardMarkers = New ObjectReference[9]
    
    Int I = -1
    While I < 8
        I += 1
        TT_BoardMarkers[I] = TT_BoardCardRefs.GetAt(I) as ObjectReference
        HoldLocations[I] = TT_HoldLocations.GetAt(I) as Location
    EndWhile
    
    InitalizeHoldRules()
    SaveCardGoldValues()
;TOP Excluded by TTTT_v1
;   LItemMiscVendorLockpicks75.AddForm(TT_RuleBook_L, 1, 1) ;use all, chance none = 25
;   LItemMiscVendorLockpicks75.AddForm(TT_BoardMisc_L, 1, 1) ;use all, chance none = 25
;   LItemMiscVendorLockpicks75.AddForm(TT_CardPack_L, 1, 1) ;use all, chance none = 25
;   DLC2LootBanditRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use all, chance none = 25, 
;   LootBanditRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, chance none = 25, 
;   LootBanditRandomWizard.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, Chance none = 15,
;   LootForswornRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, Chance none = 25,
;   LootWarlockRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, Chance none = 25,
;   LootVampireRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, Chance none = 25,
;   LootSilverHandRandom.AddForm(TT_NPCCardPackBook_L, 1, 1) ;Use All, Chance none = 25,
;END Excluded by TTTT_v1 
    TT_RuleSameDisplay.ForceRefTo(TT_RuleSameUnCheckedRef)
    TT_RulePlusDisplay.ForceRefTo(TT_RulePlusUnCheckedRef)
    TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossUnCheckedRef)
    TT_RuleComboDisplay.ForceRefTo(TT_RuleComboUnCheckedRef)
    TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenUnCheckedRef)
    TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomUnCheckedRef)
    TT_RuleTransferDisplay.ForceRefTo(TT_RuleTransferCheckedRef)
    TT_RuleHoldsDisplay.ForceRefTo(TT_RuleHoldsCheckedRef)
    TT_TradeRule_Display.ForceRefTo(TT_TradeRule_0)
;TOP Excluded by TTTT_v1
;   Int M = CityVendors.Length
;   While M > 0
;       M -= 1
;       CityVendors[M].AddItem(TT_CardPack, 1)
;       CityVendors[M].AddItem(TT_RuleBook, 1)
;       CityVendors[M].AddItem(TT_BoardMisc, 1)
;   Endwhile
;END Excluded by TTTT_v1
    Wait(0.1)
    ;Debug.Notification("Triple Triad Installed")
    TT_InstalledMsg.Show()
    
    ;for testing 
    ;PlayerRef.AddItem(TT_CardPack, 4)
    ;PlayerRef.AddItem(TT_RuleBook, 1)
    ;PlayerRef.AddItem(TT_BoardMisc, 1)
    ;
    ;PlayerRef.SetAv("SpeedMult", 150)
    ;Wait(0.1)
    ;PlayerRef.ModAv("InventoryWeight", -0.1)
    ;PlayerRef.ModAv("InventoryWeight", 0.1)
    ;Debug.Trace("Triple Triad Installed")
    ;RegisterForKey(56) ;L alt
    ;PlayerRef.MoveTo(TT_PlayerMarkerRef)
    
EndFunction 

Function InitalizeHoldRules()
    Holds_Rule_Same = New Bool[10]
    Holds_Rule_Plus = New Bool[10]
    Holds_Rule_CoinToss = New bool[10]
    Holds_Rule_Combo = New Bool[10]
    Holds_Rule_Open = New Bool[10]
    Holds_Rule_Random = New Bool[10]
    Holds_TradeRules = New Int[10]
    
    ; EastMarch \ windhelm
    Holds_Rule_Same[0] = 0
    Holds_Rule_Plus[0] = 1
    Holds_Rule_CoinToss[0] = 0
    Holds_Rule_Combo[0] = 1
    Holds_Rule_Open[0] = 0
    Holds_Rule_Random[0] = 1 
    Holds_TradeRules[0] = 1
    
    ; Falkreath
    Holds_Rule_Same[1] = 1
    Holds_Rule_Plus[1] = 0
    Holds_Rule_CoinToss[1] = 1
    Holds_Rule_Combo[1] = 0
    Holds_Rule_Open[1] = 1
    Holds_Rule_Random[1] = 0 
    Holds_TradeRules[1] = 2
    
    ; Haafingar \ solitude
    Holds_Rule_Same[2] = 1
    Holds_Rule_Plus[2] = 1
    Holds_Rule_CoinToss[2] = 0
    Holds_Rule_Combo[2] = 1
    Holds_Rule_Open[2] = 1
    Holds_Rule_Random[2] = 0
    Holds_TradeRules[2] = 3
    
    ; Hjallmarch \ morthal
    Holds_Rule_Same[3] = 0
    Holds_Rule_Plus[3] = 0
    Holds_Rule_CoinToss[3] = 1
    Holds_Rule_Combo[3] = 0
    Holds_Rule_Open[3] = 1
    Holds_Rule_Random[3] = 1
    Holds_TradeRules[3] = 1
    
    ; The Pale \ dawnstar
    Holds_Rule_Same[4] = 1
    Holds_Rule_Plus[4] = 0
    Holds_Rule_CoinToss[4] = 0
    Holds_Rule_Combo[4] = 1
    Holds_Rule_Open[4] = 1
    Holds_Rule_Random[4] = 0 
    Holds_TradeRules[4] = 2
    
    ; The Reach \ Markarth
    Holds_Rule_Same[5] = 1
    Holds_Rule_Plus[5] = 1
    Holds_Rule_CoinToss[5] = 1
    Holds_Rule_Combo[5] = 0
    Holds_Rule_Open[5] = 0
    Holds_Rule_Random[5] = 0
    Holds_TradeRules[5] = 0
    
    ; The Rift \ riften
    Holds_Rule_Same[6] = 1
    Holds_Rule_Plus[6] = 1
    Holds_Rule_CoinToss[6] = 1
    Holds_Rule_Combo[6] = 1
    Holds_Rule_Open[6] = 0
    Holds_Rule_Random[6] = 1 
    Holds_TradeRules[6] = 3
    
    ; Whiterun
    Holds_Rule_Same[7] = 0
    Holds_Rule_Plus[7] = 0
    Holds_Rule_CoinToss[7] = 0
    Holds_Rule_Combo[7] = 0
    Holds_Rule_Open[7] = 0
    Holds_Rule_Random[7] = 0
    Holds_TradeRules[7] = 0
    
    ; Winterhold
    Holds_Rule_Same[8] = 1
    Holds_Rule_Plus[8] = 1
    Holds_Rule_CoinToss[8] = 0
    Holds_Rule_Combo[8] = 1
    Holds_Rule_Open[8] = 0
    Holds_Rule_Random[8] = 0
    Holds_TradeRules[8] = 2
    
    ; Player Preference
    Holds_Rule_Same[9] = 0
    Holds_Rule_Plus[9] = 0
    Holds_Rule_CoinToss[9] = 0
    Holds_Rule_Combo[9] = 0
    Holds_Rule_Open[9] = 0
    Holds_Rule_Random[9] = 0
    Holds_TradeRules[9] = 0
EndFunction 

Function TradeCards(Actor akActor) ;used from dialogue option in TT_VendorQuest
    If akActor 
        VendorPlayerAliasScript.CurrentBarterActor = akActor ;sets actor in VendorPlayerAliasScript. Keeps cards on their person rather than in the chest. 
        PlayerRef.AddPerk(TT_BuySellCardsPerk) ;double buy prices
        VendorPlayerAliasScript.akForceRefTo(PlayerRef) 
        
        Int I = TT_VendorLists.GetSize() 
        While I > 0 
            I -= 1 
            Formlist akList = TT_VendorLists.GetAt(I) as Formlist
            If akList
                akList.AddForm(TT_Card_KWD) ;add keywords to generic vendor lists, so normal vendors can buy / sell triple triad cards.
            Endif 
        EndWhile 
        
        akActor.AddToFaction(TT_BuySellCardsFaction) ;if the actor isn't a normal vendor, this allows them to only buy / sell triple triad cards.
            
        ;Debug.Notification(akActor.GetFactionRank(TT_BuySellCardsFaction))
        
        akActor.ShowBarterMenu() ;start trading with actor
        
        Wait(1) ;this waits till done trading
        
        While akActor.IsInDialogueWithPlayer() ;failsafe in case skyrim souls is installed, waits till player is done talking to actor. 
            Wait(1)
        EndWhile
        
        VendorPlayerAliasScript.akClear()
        
        akActor.RemoveFromFaction(TT_BuySellCardsFaction)
        
        PlayerRef.RemovePerk(TT_BuySellCardsPerk)
        
        I = TT_VendorLists.GetSize() 
        While I > 0 
            I -= 1 
            Formlist akList = TT_VendorLists.GetAt(I) as Formlist
            If akList
                akList.RemoveAddedForm(TT_Card_KWD) ;remove keyword from generic vendor lists.
            Endif 
        EndWhile 
        
        VendorPlayerAliasScript.CurrentBarterActor = None
        ;Debug.Notification("TT Done Trading")
    Endif 
Endfunction

Function AddRandomCardsToPlayerChest()
    Int M = 10
    Formlist List0 = TT_CardLevelsLists.GetAt(0) As Formlist 
    Formlist List1 = TT_CardLevelsLists.GetAt(1) As Formlist 
    While M > 0
        M -= 1
        Int R = RandomInt(0, 1)
        If R == 0
            TT_PlayerCardsChest.AddItem(List0.GetAt(M), 1)
        Else 
            TT_PlayerCardsChest.AddItem(List1.GetAt(M), 1)
        Endif 
    EndWhile 
    
    ;Debug.Notification("Cards Added")
    ;Wait(1) 
    ;TT_PlayerCardsChest.Activate(PlayerRef)
    ;Wait(1)
EndFunction

Function AddRandomCardsToRef(ObjectReference akRef, Int Amount, Int minList = 0, Int MaxList = 9)
    Int I = 0
    While I < Amount 
        I += 1 
        Formlist CardList = TT_CardLevelsLists.GetAt(RandomInt(minList, MaxList)) as formlist
        Form Card = CardList.GetAt(RandomInt(0, CardList.GetSize() - 1)) 
        akRef.AddItem(Card, 1)
    EndWhile
EndFunction

Function SaveCardGoldValues()
    CardLevelGoldValues = New Int[10] 
   
    CardLevelGoldValues[0] = (TT_CardLevelsLists.GetAt(0) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[1] = (TT_CardLevelsLists.GetAt(1) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[2] = (TT_CardLevelsLists.GetAt(2) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[3] = (TT_CardLevelsLists.GetAt(3) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[4] = (TT_CardLevelsLists.GetAt(4) as formlist).GetAt(0).GetGoldValue() 
    CardLevelGoldValues[5] = (TT_CardLevelsLists.GetAt(5) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[6] = (TT_CardLevelsLists.GetAt(6) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[7] = (TT_CardLevelsLists.GetAt(7) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[8] = (TT_CardLevelsLists.GetAt(8) as formlist).GetAt(0).GetGoldValue()
    CardLevelGoldValues[9] = (TT_CardLevelsLists.GetAt(9) as formlist).GetAt(0).GetGoldValue() 
    
    ;String GoldValues
    ;Int I = -1
    ;While I < 9
    ;    I += 1
    ;    GoldValues += ("\n" + CardLevelGoldValues[I])
    ;EndWhile 
    ;
    ;Debug.MessageBox(GoldValues)
        
EndFunction

Function StartGame()
    CancelGame = False
    ;Debug.MessageBox("Start Game")
    TransferCardsSave = TransferCards 
    PlayerHasTT_CardToGet = False
    GameActive = True
    PlayerSpeed = PlayerRef.GetBaseAv("SpeedMult") 
    OpponentPreviousLocation = Opponent.PlaceAtMe(XMarker)
    PreviousLocation = PlayerRef.PlaceAtMe(XMarker)
    ;TT_PlayerChestScript.GoToState("GameActive")
;TOP Excluded by TTTT_v1
;   If PlayerRef.GetAnimationVariableBool("IsFirstPerson")
;       FirstPersonCheck = true 
;   Else 
;       Game.ForceFirstPerson()
;       FirstPersonCheck = false 
;   Endif 
;END Excluded by TTTT_v1
    ;Wait(0.2)
    ;PlayerRef.SetRestrained()
    
    SetINIBool("bShowCompass:Interface", False)
    Wait(0.2)
    PlayerRef.MoveTo(TT_PlayerMarkerRef)
;TOP Included by TTTT_v1
    If PlayerRef.GetAnimationVariableBool("IsFirstPerson")
        FirstPersonCheck = True 
    Else 
        Game.ForceFirstPerson()
        FirstPersonCheck = False 
    Endif 
	TT_NativeFunctions.SetFOV(90.0)
;END Included by TTTT_v1
    Wait(0.2)
    Game.ShowFirstPersonGeometry(false)
    PlayerRef.SetAv("SpeedMult", 0.1)
    ;disables player movement. Can't use DisablePlayerControls because that disables crosshair and activation hud.
    Wait(0.1)
    PlayerRef.ModAv("InventoryWeight", -0.1)
    Game.SetInChargen(true, true, true) ;prevent save and wait
    TT_OpponentAlias.ForceRefTo(Opponent)
    SetGameRules()
    Wait(0.1)
    If TT_DisplayRules.Show() == 0
        PlayerRef.AddSpell(TT_PreventWeaponDrawSpell, false)
        PlayerRef.AddSpell(TT_PreventExtraActorsCloak, false)
        SetUpBoard()
    Else 
        EndGameC()
    Endif
EndFunction 

;ReferenceAlias Property TT_Holds_Display Auto
;ObjectReference[] Property TT_HoldDisplayRefs Auto
;ReferenceAlias Property TT_Thane_Display Auto
;ObjectReference Property TT_Hold_ThaneYes Auto
;ObjectReference Property TT_Hold_ThaneNo Auto

Function SetGameRules()
    Int Hold
    
        If PreviousLocation.IsInLocation(HoldLocations[0])
            ;Debug.MessageBox("EastMarch")
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[0])
            If thaneScript.EastmarchImpGetOutofJail > 0 || thaneScript.EastmarchSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 0
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[1])
            ;Debug.MessageBox("Falkreath") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[1])
            
            If thaneScript.FalkreathImpGetOutofJail > 0 || thaneScript.FalkreathSonsGetOutofJail > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
                ;Debug.MessageBox("Player is thane of Falkreath")
            Else 
                Hold = 1
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
                ;Debug.MessageBox("Player is not thane of Falkreath")
            Endif 
            Wait(0.1)
        ElseIf PreviousLocation.IsInLocation(HoldLocations[2])
            ;Debug.MessageBox("Haafingar") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[2])
            
            If thaneScript.HaafingarImpGetOutofJail > 0 || thaneScript.HaafingarSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 2
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[3])
            ;Debug.MessageBox("Hjallmarch") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[3])
            
            If thaneScript.HjaalmarchImpGetOutofJail > 0 || thaneScript.HjaalmarchSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 3
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[4])
            ;Debug.MessageBox("Pale") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[4])
            
            If thaneScript.PaleImpGetOutofJail > 0 || thaneScript.PaleSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 4
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[5])
            ;Debug.MessageBox("Reach") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[5])
            
            If thaneScript.ReachImpGetOutofJail > 0 || thaneScript.ReachSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 5
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[6])
            ;Debug.MessageBox("Rift") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[6])
            
            If thaneScript.RiftImpGetOutofJail > 0 || thaneScript.RiftSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 6
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[7])
            ;Debug.MessageBox("Whiterun") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[7])
            
            If thaneScript.WhiterunImpGetOutofJail > 0 || thaneScript.WhiterunSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 7
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        ElseIf PreviousLocation.IsInLocation(HoldLocations[8])
            ;Debug.MessageBox("Winterhold") 
            Wait(0.1)
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[8])
            
            If thaneScript.WinterholdImpGetOutofJail > 0 || thaneScript.WinterholdSonsGetOutofJail  > 0
                Hold = 9
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneYes)
            Else 
                Hold = 8
                TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            Endif 
        Else 
            TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[9])
            TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
            ;Debug.MessageBox("Hold not detected")
            Hold = 9
        Endif
    
    ;Debug.MessageBox("Hold is " + Hold)
    Wait(0.1)
    
    ;RandomGameRules
    ;0 Never randomize 
    ;1 Only randomize if hold isn't found 
    ;2 Randomize when hold isn't found and you're not thane of the hold 
    ;3 Randmize always 
    
    Bool SetrandomRules = False
    If RandomGameRules == 3 
        SetrandomRules = True
    Elseif RandomGameRules == 2 && TT_Thane_Display.GetRef() == TT_Hold_ThaneNo
        SetrandomRules = True
    ElseIf RandomGameRules == 1 && Hold == 9 
        SetrandomRules = True 
    Endif
    
    If HoldRulesToggle == False && SetrandomRules == False
        ;Debug.MessageBox("Hold rules not enabled")
        TT_Holds_Display.ForceRefTo(TT_HoldDisplayRefs[10])
        TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
        Hold = 9
    Endif
    
    If SetrandomRules == False
        Rule_Same = Holds_Rule_Same[Hold]
        Rule_Plus = Holds_Rule_Plus[Hold]
        Rule_CoinToss = Holds_Rule_CoinToss[Hold]
        Rule_Combo = Holds_Rule_Combo[Hold]
        Rule_Open = Holds_Rule_Open[Hold]
        Rule_Random = Holds_Rule_Random[Hold]
        TradeRules = Holds_TradeRules[Hold]
    Else 
        TT_Holds_Display.ForceRefTo(TT_HoldDisplayRandom)
        TT_Thane_Display.ForceRefTo(TT_Hold_ThaneNo)
       
        Rule_Same = RandomInt(0, 1) as bool
        Rule_Plus = RandomInt(0, 1) as bool
        Rule_CoinToss = RandomInt(0, 1) as bool
        
        If Rule_Same == 1 || Rule_Plus == 1
            Rule_Combo = RandomInt(0, 1) as bool
        Else 
            Rule_Combo = 0
        Endif
        
        Rule_Open = RandomInt(0, 1) as bool
        Rule_Random = RandomInt(0, 1) as bool
        TradeRules = RandomInt(0, 3)
    Endif
    
    ;Debug.MessageBox("Random = " + Rule_Same + " " + Rule_Plus + " " + Rule_Combo + " " + Rule_open + " " + Rule_Random + " " + TradeRules \
    ;+ "\n  Script = " + HoldRulesScripts[Hold].H_Rule_Same + " " + HoldRulesScripts[Hold].H_Rule_Plus + " " \
    ;+ HoldRulesScripts[Hold].H_Rule_Combo + " " + HoldRulesScripts[Hold].H_Rule_Open + " " \
    ;+ HoldRulesScripts[Hold].H_Rule_Random + " " + HoldRulesScripts[Hold].H_TradeRules)
    Wait(0.1)
    
    SetGameRulesDisplay()
EndFunction

Function SetGameRulesDisplay()
    If Rule_Same == False 
        TT_RuleSameDisplay.ForceRefTo(TT_RuleSameUnCheckedRef)
    Else
        TT_RuleSameDisplay.ForceRefTo(TT_RuleSameCheckedRef)
    Endif 
    
    If Rule_Plus == False 
        TT_RulePlusDisplay.ForceRefTo(TT_RulePlusUnCheckedRef)
    Else
        TT_RulePlusDisplay.ForceRefTo(TT_RulePlusCheckedRef)
    Endif 
    
    If Rule_CoinToss == False 
        TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossUnCheckedRef)
    Else
        TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossCheckedRef)
    Endif 
    
    If Rule_Combo == False 
        TT_RuleComboDisplay.ForceRefTo(TT_RuleComboUnCheckedRef)
    Else
        TT_RuleComboDisplay.ForceRefTo(TT_RuleComboCheckedRef)
    Endif 
    
    If Rule_Open == False 
        TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenUnCheckedRef)
    Else
        TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenCheckedRef)
    Endif 
    
    If Rule_Random == False 
        TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomUnCheckedRef)
    Else
        TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomCheckedRef)
    Endif 
   
    If TradeRules == 0
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_0)
        
    Elseif TradeRules == 1
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_1)
        
    Elseif  TradeRules == 2
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_2)
        
    Elseif  TradeRules == 3
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_3)
    Endif 
EndFunction

Function SetUpBoard()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell()
        Return
    Endif 
    
    CancelGame = False
    ClearBoard()
    ;Debug.Notification("Setting up board.")
    TT_SettingUpBoardMsg.Show()
    Int Max = 11 
    While Max > 0 
        Max -= 1
        TT_PlayerNumbers[Max].Disable()
        TT_OpponentNumbers[Max].Disable()
    EndWhile 
    
    TT_PlayerNumbers[5].Enable()
    TT_OpponentNumbers[5].Enable()
    ;Debug.Notification("Setting Up Board")
    Wait(0.2)
    ;ClearBoard()
    ;Wait(0.2)
    CardsPlaced = 0
    EndGameCheck = false
    OpponentsTurn = True
    OpponentHasTT_CardToGet = False
    
    TT_PlayerChestScript.CardCount = 0
    TT_ListsToPullFrom.Revert()
    TT_OpponentCards.Revert()
    TT_OpponentCardsB.Revert()
    TT_PlacedPlayerHandActiCards.Revert()
    
    TT_OpponentCardsArray = New MiscObject[5] 
    TT_OpponentCardsArrayB = New MiscObject[5] 
;TOP Included by TTTT_v1
	TT_PlayerCardsArrayB = New MiscObject[5]
	Int j = 0
	While j < 5
		TT_PlayerCardsArrayB[j] = TT_PlayerCardsArray[j]
		j += 1
	EndWhile
;END Included by TTTT_v1
    TT_PlayerCardsArray = New MiscObject[5]
	
    If Rule_CoinToss == True 
        TT_PlayerCoin.Enable()
        TT_OpponentCoin.Enable() 
       ; Debug.MessageBox("Coin toss enabled")
    ;Else 
    ;    Debug.MessageBox("Coin toss Disabled")
    Endif 
    
    Wait(0.1)
    
    Int I = -1 
    While I < 8 ;
        I += 1 
        BoardCardScripts[I] = none
    EndWhile  
    
    ;TT_ListsToPullFrom = TT_AllCardsMiscList ;FOR TESTING =================================
    ;Wait(1) 
    
    ActorBase OpponentBase = Opponent.GetBaseObject() as ActorBase
    Int OpponentCardCount = 0
    Int Level = Opponent.GetLevel()
    
    int Startindex 
    
    If Level <= 15
        Startindex = 0
    elseif Level < 20
        Startindex = 1
    elseif Level < 25
        Startindex = 2
    elseif Level < 30
        Startindex = 3
    elseif Level < 35
        Startindex = 4
    elseif Level < 40
        Startindex = 5
    elseif Level < 45
        Startindex = 6
    Else
        Startindex = 7
    Endif 
    
    
    If TT_UniqueCardHolders.HasForm(OpponentBase)
        Int Index = TT_UniqueCardHolders.Find(OpponentBase)
        If Index > 26 ;there are 3 cicero actors at the end of the list. This accounts for them.
            Index = 26 
        Endif
        
        MiscObject Card = TT_UniqueCards.GetAt(Index) as MiscObject
        If TT_UniqueCardsB.HasForm(Card)
            TT_OpponentCardsArray[0] = Card
            TT_OpponentCards.AddForm(Card)
            
            If Index == 20 ;esbern 
                If MQ305.IsCompleted()
                    MiscObject DragonBornCard = TT_UniqueCards.GetAt(24) as MiscObject
                    TT_OpponentCards.AddForm(DragonBornCard)
                    TT_OpponentCardsArray[1] = DragonBornCard
                    OpponentCardCount += 1
                Endif
            Endif
                
            OpponentCardCount += 1
            Wait(0.1)
        Endif 
        
        StartIndex += 2 
        
    Elseif OpponentBase.IsEssential()
        StartIndex += 1
    Endif
    
    Wait(0.1)
    If StartIndex > 7
        StartIndex = 7
    Endif
    
    ObjectReference CardToGet = TT_CardToGet.GetReference()
    If PlayerRef.GetItemCount(CardToGet) > 0
        PlayerRef.RemoveItem(CardToGet, 1, true, TT_CardFetchChestRef)
        PlayerHasTT_CardToGet = True
    Elseif TT_PlayerCardsChest.GetItemCount(CardToGet) > 0
        TT_PlayerCardsChest.RemoveItem(CardToGet, 1, true, TT_CardFetchChestRef)
        PlayerHasTT_CardToGet = True
        
    ElseIf Opponent.GetItemCount(CardToGet) > 0
        OpponentHasTT_CardToGet = true 
        Opponent.RemoveItem(CardToGet, 1, true, TT_CardFetchChestRef) 
        Int EmptySlot = TT_OpponentCardsArray.Find(None)
        TT_OpponentCardsArray[EmptySlot] = CardToGet.GetBaseObject() as MiscObject
        TT_OpponentCards.AddForm(CardToGet.GetBaseObject())
        OpponentCardCount += 1
    Endif 
    
    If Opponent.GetItemCount(TT_UniqueModCards) > 0
        Int Mf = TT_UniqueModCards.GetSize() 
        While Mf > 0 
            Mf -= 1
            MiscObject Card = TT_UniqueModCards.GetAt(Mf) as MiscObject
            If Opponent.GetItemCount(Card) > 0 
                Int EmptySlot = TT_OpponentCardsArray.Find(None)
                If EmptySlot > -1 && OpponentCardCount < 5
                    TT_OpponentCardsArray[EmptySlot] = Card
                    TT_OpponentCards.AddForm(card)
                    OpponentCardCount += 1
                Endif 
            Endif 
        EndWhile 
    Endif
    
    Int Mx = 10
    Int Count = 0
    While Mx > 0 && OpponentCardCount < 5
        ;Checks if opponent has any TT cards and adds them to hand. Searches higher level cards first
        Mx -= 1
        Formlist Cardlist = TT_CardLevelsLists.GetAt(Mx) as Formlist 
        If Opponent.GetItemCount(Cardlist) > 0
            Int Mxa = Cardlist.GetSize() 
            While Mxa > 0 && Count < 5
                Mxa -= 1
                MiscObject Card = Cardlist.GetAt(Mxa) as MiscObject
                If Opponent.GetItemCount(Card) > 0 && TT_OpponentCardsArray.Find(Card) == -1 \
                    && TT_OpponentCards.HasForm(Card) == False && OpponentCardCount < 5
                    OpponentCardCount += 1
                    
                    Int EmptySlot = TT_OpponentCardsArray.Find(None)
                    TT_OpponentCardsArray[EmptySlot] = Card
                    TT_OpponentCards.AddForm(card)
                Endif 
            Endwhile 
        Endif
    Endwhile 
    
    Wait(0.2)
    
    ;Int Level = PlayerRef.GetLevel() 
    
    Wait(0.1)
    
    If Startindex == 7
        Int Id = 5
        
        While Id < 9
            Id += 1
            TT_ListsToPullFrom.AddForm(TT_CardLevelsLists.GetAt(Id))
        EndWhile
    Elseif StartIndex == 0
        TT_ListsToPullFrom.AddForm(TT_CardLevelsLists.GetAt(0))
        TT_ListsToPullFrom.AddForm(TT_CardLevelsLists.GetAt(1))
    Else 
        Int Id = (Startindex - 2)
        Int MEnd = (Startindex + 1)
        While Id < MEnd
            Id += 1
            TT_ListsToPullFrom.AddForm(TT_CardLevelsLists.GetAt(Id))
        EndWhile
    Endif
    
    Wait(0.3)
    Int M = TT_ListsToPullFrom.GetSize()
    While M > 0
        M -= 1
        Formlist CardList = TT_ListsToPullFrom.GetAt(M) as formlist
        Int Ma = CardList.GetSize()
        While Ma > 0
            Ma -= 1
            TT_OpponentCardsB.AddForm(CardList.GetAt(Ma)) ;adds card forms from 3 - 4 lists for opponent to choose from 
        EndWhile
    EndWhile
    
    Wait(0.2)
    
    Int Mc = (TT_OpponentCardsB.GetSize() - 1)
    
    While OpponentCardCount < 5 ;add 5 unique cards to opponent list
        MiscObject RandomCard = TT_OpponentCardsB.GetAt(RandomInt(0, Mc)) as MiscObject
        If TT_OpponentCards.HasForm(RandomCard) == False
            OpponentCardCount += 1
            TT_OpponentCardsB.RemoveAddedForm(RandomCard)
            Wait(0.1)
            Int EmptySlot = TT_OpponentCardsArray.Find(None)
            TT_OpponentCardsArray[EmptySlot] = RandomCard
            TT_OpponentCards.AddForm(RandomCard)
            Mc -= 1
        EndIf
    EndWhile
               
    Wait(0.2)
    TT_OpponentCardsB.Revert()
    
    If Rule_Open == False
        Int Md = -1
        While Md < 4
            Md += 1
            MiscObject Card = TT_OpponentCardsArray[Md]
            TT_OpponentHandStatics[Md] = TT_OpponentHandMarkers[Md].PlaceAtMe(TT_MudCrabCard, 1, 0, 1)
            ;Wait(0.2)
        EndWhile
    Else 
        Int Md = -1
        While Md < 4
            Md += 1
            MiscObject Card = TT_OpponentCardsArray[Md]
            If (Card As TT_Skyrim_ModCardScript) 
                TT_OpponentHandStatics[Md] = TT_OpponentHandMarkers[Md].PlaceAtMe((Card As TT_Skyrim_ModCardScript).StaticCard_B, 1, 0, 1)
            Else
                Int Index = TT_AllCardsMiscList.Find(Card)
                TT_OpponentHandStatics[Md] = TT_OpponentHandMarkers[Md].PlaceAtMe(TT_AllCardsListB.GetAt(Index), 1, 0, 1)
            Endif
        EndWhile
    Endif
    
    BetAmount = 0
    
    If Opponent.HasSpell(TT_BetAddGoldCheckSpell) == false 
        Opponent.AddSpell(TT_BetAddGoldCheckSpell) ;spell wears off after 48 game hours 
        If Opponent.GetItemCount(Gold001) < GoldInjectAmount 
            Opponent.AddItem(Gold001, GoldInjectAmount) ;inject gold to opponent for betting with 
        Endif 
    Endif 
    
    Wait(0.1) 
    Int PlayerGold = PlayerRef.GetItemCount(Gold001)
    Int OpponentGold = Opponent.GetItemCount(Gold001)
    ;Debug.Notification("Opponent gold = " + OpponentGold)
    TT_OpponentGold.SetValue(OpponentGold) ;used in message conditions in the ck.
    
    If PlayerGold >= 10 && OpponentGold >= 10 && PreferedBetAmount > 0
    
        If TT_SetBetConfirmMsg.Show() == 0
           
            If PlayerGold >= PreferedBetAmount && OpponentGold >= PreferedBetAmount
                BetAmount = PreferedBetAmount
            Elseif PlayerGold <= OpponentGold
                BetAmount = PlayerGold 
            Else 
                BetAmount = OpponentGold
            Endif 
            
            If BetAmount != 500 && BetAmount != 400 && BetAmount != 300 && BetAmount != 200 && BetAmount != 100 && BetAmount != 10
                ;makes bet amount only multiples of 10
                Float BetAmountB = (BetAmount as float)
                If BetAmountB > 400 
                    BetAmountB -= 400
                Elseif BetAmountB > 300 
                    BetAmountB -= 300
                Elseif BetAmountB > 200
                    BetAmountB -= 200
                Elseif BetAmountB > 100
                    BetAmountB -= 100
                Endif
                    
                Float TenCheck = ((BetAmountB) / 10.0)
                Float TenCheckDiff = ((TenCheck - (Math.Floor(TenCheck) as float)) * 10)
                
                ;Debug.MessageBox("BetAmount = " + BetAmount + "\n TenCheck = " + TenCheck + \
                ;"\n TenCheckDiff = " + TenCheckDiff)
                ;Wait(0.1)
                
                Float NewBetAmount = (BetAmount as float) - TenCheckDiff
                ;Debug.MessageBox("NewBetAmount = " + NewBetAmount)
                ;Wait(0.1)
                BetAmount = NewBetAmount as int
            Endif
            
            Wait(0.1)
            TT_BetPlus100.SetValue(BetAmount + 100);	Excluded by TTTT_v1: TT_BetMinus10.SetValue(BetAmount - 10)
            TT_BetPlus10.SetValue(BetAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(BetAmount - 100)
            TT_BetMinus100.SetValue(BetAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(BetAmount + 10)
            TT_BetMinus10.SetValue(BetAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(BetAmount + 100)
            
            SetBet()
        Else 
            
            ContinueGame()
        Endif
    Else 
        ContinueGame()
    Endif
Endfunction

Function SetBet() 
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell()
        Return
    Endif 
    
    Int Button = TT_SetBetMsg.Show(BetAmount)
    If Button == 0 
        ContinueGame();		Excluded by TTTT_v1: BetAmount -= 10 
    Elseif Button == 1
        BetAmount += 100;	Excluded by TTTT_v1: BetAmount -= 100 
    Elseif Button == 2
        BetAmount += 10
    Elseif Button == 3
        BetAmount -= 100;	Excluded by TTTT_v1: BetAmount += 100 
    Elseif Button == 4
        BetAmount -= 10;	Excluded by TTTT_v1: ContinueGame()
    Endif
    
    If Button > 0
        TT_BetPlus100.SetValue(BetAmount + 100);	Excluded by TTTT_v1: TT_BetMinus10.SetValue(BetAmount - 10) ; these globals are used in the message conditions
        TT_BetPlus10.SetValue(BetAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(BetAmount - 100)
        TT_BetMinus100.SetValue(BetAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(BetAmount + 10)
        TT_BetMinus10.SetValue(BetAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(BetAmount + 100)
        SetBet()
    Endif 
    
EndFunction
    
Function ContinueGame()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    If Rule_Random == 0
        TT_PlayerChestScript.GoToState("GameActive")
;TOP Excluded by TTTT_v1
        ;Debug.MessageBox("Choose five cards, one at a time.")
;       TT_Choose5CardsMsg.Show()
;       Wait(0.1) 
;       PlayerChoosesCards() 
;END Excluded by TTTT_v1
;TOP Included by TTTT_v1
		Int cards = 0
		Int j = 0
		While j < 5
			If TT_PlayerCardsArrayB[j] != None
				cards += 1
			EndIf
			j += 1
		EndWhile
		
		Int choice = 1
		If cards > 0
			;Debug.MessageBox("Reuse cards from previous hand?")
			choice = (Game.GetFormFromFile(0x801, "Triple Triad Tamriel.esp") as Message).Show()
		EndIf
		
		If choice == 1
			;Debug.MessageBox("Choose 5 cards, one at a time.")
			TT_Choose5CardsMsg.Show()
		EndIf
        Wait(0.1)
        PlayerChoosesCards(cards < 5, choice)
;END Included by TTTT_v1
    Else 
        ChooseRandomPlayerCards() 
    Endif
Endfunction 

Function PlayerChoosesCards(Bool isMissingCards = True, Bool changeAllCards = True);	 Included by TTTT_v1
    Wait(0.1)
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
;TOP Excluded by TTTT_v1
;    TT_PlayerCardsChest.Activate(PlayerRef)
;    Wait(1)
;END Excluded by TTTT_v1
;TOP Included by TTTT_v1
	If !changeAllCards
		Int Ix = 0
		While Ix < 5
			If TT_PlayerCardsArrayB[Ix] != None
				TT_PlayerCardsChest.RemoveItem(TT_PlayerCardsArrayB[Ix], 1, True, PlayerRef)
				Wait(0.2)
			EndIf
			Ix += 1
		EndWhile
	EndIf
	
	If isMissingCards
		TT_PlayerCardsChest.Activate(PlayerRef)
		Wait(1)
	EndIf
;END Included by TTTT_v1
    If TT_PlayerChestScript.CardCount < 5
        ; Wait(0.5)
        ;Debug.Notification("Only " + TT_PlayerChestScript.CardCount + " cards chosen. Choose 5")
        TT_NotEnoughCardsChosenMsg.Show(TT_PlayerChestScript.CardCount)
        PlayerChoosesCards()
    Else
        ;Debug.MessageBox("Chest PlayerChoosesCardsB")
        Int Iy = -1
        While Iy < 4
            Iy += 1
            TT_PlaceCard.Play(PlayerRef)
            TT_PlayerHandActivators[Iy].Enable()
            Wait(0.2)
        EndWhile
        
        Wait(0.5)
        
        Int Iz = -1
        While Iz < 4
            Iz += 1
            TT_PlaceCard.Play(PlayerRef)
            TT_OpponentHandStatics[Iz].Enable()
            Wait(0.2)
        EndWhile
        Wait(0.5)
        PlayerChoosesCardsB()
    Endif
EndFunction

Function ChooseRandomPlayerCards() 
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    Wait(0.2)
    TT_PlayerChestScript.GoToState("Busy")
    Int M = (TT_PlayersCurrentCards.GetSize() - 1)
    Int I = -1
    While I < 4
        MiscObject MiscCard = TT_PlayersCurrentCards.GetAt(RandomInt(0, M)) as MiscObject
        
        If TT_PlayerCardsChest.GetItemCount(MiscCard) > 0
            I += 1
            TT_PlayerCardsChest.RemoveItem(MiscCard, 1)
            TT_PlayerCardsArray[I] = MiscCard
            ;Int EmptySlot = TT_PlayerHandActivators.Find(None) 
            Int CardIndex = TT_AllCardsMiscList.Find(MiscCard) 
            
            If CardIndex > -1
                TT_PlayerHandActivators[I] \
                = TT_PlayerHandMarkers[I].PlaceAtMe(TT_AllCardsActivatorList.GetAt(CardIndex), 1, 0, 1)
                
                TT_PlayerHandStatics[I] \
                = TT_PlayerHandMarkersB[I].PlaceAtMe(TT_AllCardsList.GetAt(CardIndex), 1, 0, 1)
                
            Elseif (MiscCard as TT_Skyrim_ModCardScript)
                TT_PlayerHandActivators[I] \
                = TT_PlayerHandMarkers[I].PlaceAtMe((MiscCard as TT_Skyrim_ModCardScript).ActivatorCard, 1, 0, 1)
                
                TT_PlayerHandStatics[I] \
                = TT_PlayerHandMarkersB[I].PlaceAtMe((MiscCard as TT_Skyrim_ModCardScript).StaticCard, 1, 0, 1)
            Endif 
        Endif
    EndWhile 
    
    Wait(0.2) 
    
    Int Ia = -1
    While Ia < 4
        Ia += 1
        TT_PlaceCard.Play(PlayerRef)
        TT_PlayerHandActivators[Ia].Enable()
        Wait(0.2)
    EndWhile
    
    Wait(0.5)
    
    Int Iz = -1
    While Iz < 4
        Iz += 1
        TT_PlaceCard.Play(PlayerRef)
        TT_OpponentHandStatics[Iz].Enable()
        Wait(0.2)
    EndWhile
    ;TT_PlayerChestScript.GoToState("GameActive")
    PlayerChoosesCardsB() 
EndFunction

Function PlayerChoosesCardsB()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif
    ;Debug.MessageBox("PlayerChoosesCardsB")
    Wait(0.1)
    
    TT_PlayerChestScript.GoToState("Busy")
    
    If Rule_Random == 0
        Int M = 5 
        While M > 0
            M -= 1
            Form miscCard = TT_PlayerCardsArray[M]
            PlayerRef.RemoveItem(miscCard, 1, true, TT_PlayerCardsChest)
        EndWhile
    Else 
        AddPlayerCardsBack()
    Endif
    
    Wait(0.1)
    TT_CoinFlipPositions
    ObjectReference Coin
    
    TT_PlayerChestScript.GoToState("GameNotActive")
    
    ;Int HeadsOrTails = TT_HeadsOrTails.Show()
    Wait(0.1)
    
    If RandomInt(0, 1) == 1 ;heads result
        TT_CoinDisplay.ForceRefTo(TT_CoinHeadsRef)
        Int I = 0
        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
        Wait(0.5) 
        Coin.setMotionType(4)
        Wait(0.2)
        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
        Coin.MoveTo(TT_CoinFlipPositions[0])
        While I < 4
            I += 1
            If I == 4
                Coin.TranslateToRef(TT_CoinFlipPositions[5], 65)
                Sound.StopInstance(CoinFlipS)
                TT_CoinFlipHit.Play(PlayerRef)
            Else 
                Coin.TranslateToRef(TT_CoinFlipPositions[I], 65)
            Endif 
            
            Wait(0.05)
        EndWhile
        
        Wait(2)
        Coin.Disable()
        Coin.Delete()
        Coin = None
        
        ;Debug.MessageBox("You start.")
        TT_YouStartMsg.Show()
        OpponentsTurn = False
        PlayerStarts = True
          
    Else ;Tails result
        TT_CoinDisplay.ForceRefTo(TT_CoinTailsRef)
        Int I = 0
        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
        Wait(0.1) 
        Coin.setMotionType(4)
        Wait(0.2)
        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
        Coin.MoveTo(TT_CoinFlipPositions[0])
        While I < 5
            I += 1
            If I == 5
                Coin.TranslateToRef(TT_CoinFlipPositions[6], 65)
                Sound.StopInstance(CoinFlipS)
                TT_CoinFlipHit.Play(PlayerRef)
            Else 
                Coin.TranslateToRef(TT_CoinFlipPositions[I], 65)
            Endif 
            
            Wait(0.05)
        EndWhile
        
        Wait(2)
        Coin.Disable()
        Coin.Delete()
        Coin = None
        
        TT_OpponentStartsMsg.Show()
        OpponentPlacesCard()
        PlayerStarts = False
    Endif
    
EndFunction

Function OpponentPlacesCard()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    OpponentsTurn = True 
    ;Debug.MessageBox("Opponent Places Card")
    
    Int PositionToUse = -1
    MiscObject CardToPlace = None
    
    Int CardsCanFlip = 0
    Int Position = RandomInt(0, 8)
    
    Wait(0.1) 
    
    If CardsPlaced > 0
        ; Native AI evaluation -- replaces the nested While loops + Wait(0.1) calls.
        ; Evaluates all 9x5 possibilities in microseconds instead of ~4.5 seconds.
        TT_NativeFunctions.ResetBoard()
        Int Ia = 0
        While Ia < 9
            If TT_BoardMiscCards[Ia] != None
                TT_NativeFunctions.SetBoardCard(Ia, BoardCardScripts[Ia].Top, \
                    BoardCardScripts[Ia].Right, BoardCardScripts[Ia].Bottom, \
                    BoardCardScripts[Ia].Left, TT_PlayerBoardCards[Ia].IsEnabled())
            EndIf
            Ia += 1
        EndWhile
        Int OpHandSize = TT_OpponentCards.GetSize()
        Int Ib = 0
        While Ib < OpHandSize
            TT_Skyrim_CardScript cs = (TT_OpponentCards.GetAt(Ib) as MiscObject) as TT_Skyrim_CardScript
            TT_NativeFunctions.SetHandCard(Ib, cs.Top, cs.Right, cs.Bottom, cs.Left)
            Ib += 1
        EndWhile
        If CardsPlaced < 8
            TT_ThinkingMsg.Show()
        EndIf
        Int[] bestMove = TT_NativeFunctions.FindBestMove(OpHandSize, Rule_Same, Rule_Plus, Rule_Combo)
        PositionToUse = bestMove[0]
        CardToPlace = TT_OpponentCards.GetAt(bestMove[1]) as MiscObject
        CardsCanFlip = bestMove[2]
        Wait(0.5)
    Endif
    
    If Rule_CoinToss == True && TT_OpponentCoin.IsEnabled()
         
        If CardsPlaced >= 6
            Int[] CurentScore = GetScore()
            ;Wait(0.1)
            ;Debug.MessageBox("Score Is " + CurentScore[0] + " to " + CurentScore[1])
            Wait(0.1)
            If CurentScore[0] > CurentScore[1] ;if player is winning
                If RandomInt(1, 4) == 1
                    TT_OpponentTossesCoin.Show()
                    Wait(1)
                    TT_OpponentCoin.Disable()
                    CoinToss() 
                    Return 
                Endif 
            Endif
        Endif 
    EndIf 
    
    Wait(0.1)
    
    If CardsPlaced == 0
        Wait(0.4)
        Int Mx = (TT_OpponentCards.GetSize() - 1)
        CardToPlace = TT_OpponentCards.GetAt(RandomInt(0, Mx)) as MiscObject 
        PositionToUse = RandomInt(0, 8)
    
    ElseIf CardToPlace == None
        Int Mx = (TT_OpponentCards.GetSize() - 1)
        If Mx > 0
            CardToPlace = TT_OpponentCards.GetAt(RandomInt(0, Mx)) as MiscObject 
        Else 
            CardToPlace = TT_OpponentCards.GetAt(0) as MiscObject
        Endif
        
        Int Mxx = RandomInt(0, 8)
        Int Ca = 0
        While Ca < 9
            Ca += 1
            If TT_BoardMarkers[Mxx].IsEnabled()
                PositionToUse = Mxx
                Ca = 9
            Endif 
            
            Mxx += 1
            If Mxx >= 9
                Mxx = 0
            Endif 
        EndWhile
    Endif
    
    Wait(1)
    Int DisplayIndex = TT_OpponentCardsArray.Find(CardToPlace)
    TT_OpponentHandStatics[DisplayIndex].Disable()
    
    If CardsPlaced > 7
        Wait(1)
    Endif
    
    If CardsPlaced < 9
        PlaceCard(PositionToUse, CardToPlace, 1, False, False)
        TT_OpponentCards.RemoveAddedForm(CardToPlace)
    Endif 
        
    Wait(0.1)
    
    If CardsPlaced >= 9
        Wait(2)
        EndGame()
    Endif
    ;used to get a "T" on the board for a screenshot.
    ;PlaceCard(ForceScreenShot, CardToPlace, 1, False, False)
    ;If ForceScreenShot == 1
    ;    ForceScreenShot = 4
    ;EndIf
    ;Debug.MessageBox("Opponent Places Card \n Position = " + PositionToUse + "\n Card = " + CardToPlace.GetName())
    
   
Endfunction
  
;Int ForceScreenShot = 1

Float LastComboTime = 1.0

Int Function PlaceCard(Int Position, MiscObject CardToPlace, bool Owner, bool ComboPlace, Bool CheckPosition)
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return 0
    Endif 
    
    If CheckPosition == True
            
        TT_Skyrim_CardScript PositionScript = CardToPlace as TT_Skyrim_CardScript
        
        Int Top = PositionScript.Top
        Int Left = PositionScript.Left
        Int Right = PositionScript.Right
        Int Bottom = PositionScript.Bottom
        
       
        Int TopP = (Position - 3)
        Int LeftP = (Position - 1)
        Int RightP = (Position + 1)
        Int BottomP = (Position + 3)
     
        If TopP >= 0
          
        Endif 
        
        If LeftP >= 0 && LeftP != 2 && LeftP != 5
            
        Endif 
        
        If RightP <= 8 && RightP != 3 && RightP != 6
          
        Endif 
        
        If BottomP <= 8
           
        Endif 
            
        Bool FlipTop = False
        Bool FlipLeft = False
        Bool FlipRight = False
        Bool FlipBottom = False
        Bool SameCheck = False 
        Bool PlusCheck = False
        
        If Rule_Same == True
            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \ 
            && TT_BoardMiscCards[BottomP] != None && BottomP <= 8
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Bottom == BoardCardScripts[BottomP].Top 
                        FlipRight = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[LeftP] != None \
            && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[LeftP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[LeftP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Bottom == BoardCardScripts[BottomP].Top && Left == BoardCardScripts[LeftP].Right 
                        FlipLeft = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif  

            If TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[LeftP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[LeftP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Left == BoardCardScripts[LeftP].Right && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipLeft = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[TopP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[TopP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Bottom == BoardCardScripts[BottomP].Top && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipRight = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Left == BoardCardScripts[LeftP].Right 
                        FlipLeft = True
                        FlipRight = True
                        SameCheck = True
                    Endif
                Endif 
            Endif  
        Endif 

        If Rule_Plus == True

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \ 
            && TT_BoardMiscCards[BottomP] != None && BottomP <= 8
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Bottom + BoardCardScripts[BottomP].Top)
                        FlipRight = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[LeftP] != None \
            && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[BottomP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[BottomP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Bottom + BoardCardScripts[BottomP].Top) == (Left + BoardCardScripts[LeftP].Right)
                        FlipLeft = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif  

            If TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[TopP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[TopP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Left + BoardCardScripts[LeftP].Right) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipLeft = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipRight = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[BottomP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[BottomP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Bottom + BoardCardScripts[BottomP].Top) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Left + BoardCardScripts[LeftP].Right)
                        FlipLeft = True
                        FlipRight = True
                        PlusCheck = True
                    Endif
                Endif
            Endif  
        Endif
        
        If Rule_Combo == True
            If PlusCheck == True || SameCheck == True
                Return 5
            Endif 
        Endif  
            
        Int CardsCanFlip = 0
        
        If FlipTop == True 
            CardsCanFlip += 1
        Endif
        
        If FlipLeft == True 
            CardsCanFlip += 1
        Endif
        
        If FlipRight == True 
            CardsCanFlip += 1
        Endif
        
        If FlipBottom == True 
            CardsCanFlip += 1
        Endif
        
        If CanFlipTopCard(Position, owner, CardToPlace) && FlipTop == False && TT_BoardMiscCards[TopP] != None
            CardsCanFlip += 1
        Endif 
        
        If CanFlipLeftCard(Position, owner, CardToPlace) && FlipLeft == False && TT_BoardMiscCards[LeftP] != None
            CardsCanFlip += 1
        Endif 
        
        If CanFlipRightCard(Position, owner, CardToPlace) && FlipRight == False && TT_BoardMiscCards[RightP] != None
            CardsCanFlip += 1
        Endif 
        
        If CanFlipBottomCard(Position, owner, CardToPlace) && FlipBottom == False && TT_BoardMiscCards[BottomP] != None
            CardsCanFlip += 1
        Endif 
            
        Return CardsCanFlip
        
    ElseIf ComboPlace == False
        Int CardIndex = TT_AllCardsMiscList.Find(CardToPlace)
        ;Wait(0.1)
        ;Debug.notification("Place Card")
        CardsPlaced += 1
        TT_Skyrim_ModCardScript ModCardScript = CardToPlace as TT_Skyrim_ModCardScript
        
        If TT_PlayerBoardCards[Position] == None
            If ModCardScript != None
                TT_PlayerBoardCards[Position] = TT_BoardMarkers[Position].PlaceAtMe(ModCardScript.StaticCard, 1, 0, 1)
                TT_OpponentBoardCards[Position] = TT_BoardMarkers[Position].PlaceAtMe(ModCardScript.StaticCard_B, 1, 0, 1)
            Else
                TT_PlayerBoardCards[Position] = TT_BoardMarkers[Position].PlaceAtMe(TT_AllCardsList.GetAt(CardIndex), 1, 0, 1)
                TT_OpponentBoardCards[Position] = TT_BoardMarkers[Position].PlaceAtMe(TT_AllCardsListB.GetAt(CardIndex), 1, 0, 1)
            Endif 
        Endif
        
        If TT_BoardMiscCards[Position] == None
            TT_BoardMiscCards[Position] = CardToPlace
            BoardCardScripts[Position] = (CardToPlace as TT_Skyrim_CardScript)
        EndIf
        
        TT_BoardMarkers[Position].Disable()
        
        ;Wait(0.1)

        If Owner == 0
            TT_PlaceCard.Play(PlayerRef)
            TT_PlayerBoardCards[Position].Enable()
        Else 
            TT_PlaceCard.Play(PlayerRef)
            TT_OpponentBoardCards[Position].Enable()
        Endif 
            
        TT_Skyrim_CardScript PositionScript = CardToPlace as TT_Skyrim_CardScript
        
        Int Top = PositionScript.Top
        Int Left = PositionScript.Left
        Int Right = PositionScript.Right
        Int Bottom = PositionScript.Bottom

        Int TopP = (Position - 3)
        Int LeftP = (Position - 1)
        Int RightP = (Position + 1)
        Int BottomP = (Position + 3)
   
        ;If Owner == 0
        ;   ; Debug.MessageBox(CardToPlace.GetName() + "\n" + " "+ Top + "\n" + Left + "  " + Right + "\n" + Bottom) 
        ;    Debug.MessageBox(CardToPlace.GetName() + " Right = " + Right + " " + TT_BoardMiscCards[RightP].GetName() \
        ;    + " Left = " + BoardCardScripts[RightP].Left + " " \
        ;    + CardToPlace.GetName() + " Bottom = " + Bottom + " " + TT_BoardMiscCards[BottomP].GetName() \
        ;    + " Top = " + BoardCardScripts[RightP].Top)
        ;    Wait(1)
        ;Endif
        
        Bool FlipTop = False
        Bool FlipLeft = False
        Bool FlipRight = False
        Bool FlipBottom = False
        Bool SameCheck = False 
        Bool PlusCheck = False
        
        If Rule_Same == True
            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \ 
            && TT_BoardMiscCards[BottomP] != None && BottomP <= 8
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Bottom == BoardCardScripts[BottomP].Top 
                        FlipRight = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[LeftP] != None \
            && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[LeftP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[LeftP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Bottom == BoardCardScripts[BottomP].Top && Left == BoardCardScripts[LeftP].Right 
                        FlipLeft = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif  

            If TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[LeftP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[LeftP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Left == BoardCardScripts[LeftP].Right && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipLeft = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[TopP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[TopP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Bottom == BoardCardScripts[BottomP].Top && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipBottom = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Top == BoardCardScripts[TopP].Bottom 
                        FlipTop = True
                        FlipRight = True
                        SameCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If Right == BoardCardScripts[RightP].Left && Left == BoardCardScripts[LeftP].Right 
                        FlipLeft = True
                        FlipRight = True
                        SameCheck = True
                    Endif
                Endif 
            Endif  
        Endif 

        If Rule_Plus == True

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \ 
            && TT_BoardMiscCards[BottomP] != None && BottomP <= 8
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[BottomP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[BottomP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Bottom + BoardCardScripts[BottomP].Top)
                        FlipRight = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[LeftP] != None \
            && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[BottomP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[BottomP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Bottom + BoardCardScripts[BottomP].Top) == (Left + BoardCardScripts[LeftP].Right)
                        FlipLeft = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif  

            If TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[TopP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[TopP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Left + BoardCardScripts[LeftP].Right) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipLeft = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipRight = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[BottomP] != None && BottomP <= 8 && TT_BoardMiscCards[TopP] != None && TopP >= 0
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[BottomP].IsEnabled() && TT_OpponentBoardCards[TopP].IsEnabled()
                    Continue = True    
                ElseIf Owner == 1 && TT_PlayerBoardCards[BottomP].IsEnabled() && TT_PlayerBoardCards[TopP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Bottom + BoardCardScripts[BottomP].Top) == (Top + BoardCardScripts[TopP].Bottom)
                        FlipTop = True
                        FlipBottom = True
                        PlusCheck = True
                    Endif
                Endif 
            Endif 

            If TT_BoardMiscCards[RightP] != None && RightP <= 8 && RightP != 3 && RightP != 6 \
            && TT_BoardMiscCards[LeftP] != None && LeftP >= 0 && LeftP != 2 && LeftP != 5
                Bool Continue = False
                
                If Owner == 0 && TT_OpponentBoardCards[RightP].IsEnabled() && TT_OpponentBoardCards[LeftP].IsEnabled()
                    Continue = True
                ElseIf Owner == 1 && TT_PlayerBoardCards[RightP].IsEnabled() && TT_PlayerBoardCards[LeftP].IsEnabled()
                    Continue = True
                Endif
                
                If Continue == True
                    If (Right + BoardCardScripts[RightP].Left) == (Left + BoardCardScripts[LeftP].Right)
                        FlipLeft = True
                        FlipRight = True
                        PlusCheck = True
                    Endif
                Endif
            Endif  
        Endif
        
        If PlusCheck == True 
            ;Debug.Notification("Plus!")
            TT_PlusMsg.Show()
        Endif 
        
        If SameCheck == True 
            ;Debug.Notification("Same!")
            TT_SameMsg.Show()
        Endif
        
        Wait(0.3)
        
        If FlipTop == True 
            FlipCard(TopP, Owner, Rule_Combo)
        Endif 
        
        If FlipLeft == True 
            FlipCard(LeftP, Owner, Rule_Combo)
        Endif 
        
        If FlipRight == True 
            FlipCard(RightP, Owner, Rule_Combo)
        Endif 
        
        If FlipBottom == True 
            FlipCard(BottomP, Owner, Rule_Combo)
        Endif 
        
        If Pluscheck == True || SameCheck == True
            TT_Plus_Same.Play(PlayerRef)
        Endif
       
        If CanFlipTopCard(Position, owner, CardToPlace) && FlipTop == False && TT_BoardMiscCards[TopP] != None
            FlipCard(TopP, Owner, 0)
        Endif 
        
        If CanFlipLeftCard(Position, owner, CardToPlace) && FlipLeft == False && TT_BoardMiscCards[LeftP] != None
            FlipCard(LeftP, Owner, 0)
        Endif 
        
        If CanFlipRightCard(Position, owner, CardToPlace) && FlipRight == False && TT_BoardMiscCards[RightP] != None
            FlipCard(RightP, Owner, 0)
        Endif 
        
        If CanFlipBottomCard(Position, owner, CardToPlace) && FlipBottom == False && TT_BoardMiscCards[BottomP] != None
            FlipCard(BottomP, Owner, 0)
        Endif 
        
        ;If CardsPlaced >= 9
            ;Wait(1)
            ;EndGame()
        If CardsPlaced < 9
            TT_ScoreScript.StartDisplayScore()
            If Owner == 1
                OpponentsTurn = False 
            Else 
                OpponentPlacesCard()
            Endif
        Endif
    Else 
        Int TopP = (Position - 3)
        Int LeftP = (Position - 1)
        Int RightP = (Position + 1)
        Int BottomP = (Position + 3)
        
        Bool FlipCheck = False
        
        If CanFlipTopCard(Position, owner, CardToPlace) && TT_BoardMiscCards[TopP] != None
            FlipCard(TopP, Owner, 0)
            FlipCheck = True
        Endif 

        If CanFlipLeftCard(Position, owner, CardToPlace) && TT_BoardMiscCards[LeftP] != None
            FlipCard(LeftP, Owner, 0)
            FlipCheck = True
        Endif 

        If CanFlipRightCard(Position, owner, CardToPlace) && TT_BoardMiscCards[RightP] != None
            FlipCard(RightP, Owner, 0)
            FlipCheck = True
        Endif 

        If CanFlipBottomCard(Position, owner, CardToPlace) && TT_BoardMiscCards[BottomP] != None
            FlipCard(BottomP, Owner, 0)
            FlipCheck = True
        Endif 
        
        Float Time = GetCurrentRealTime()
        If FlipCheck == True 
            If (Time - LastComboTime) > 5
                TT_Combo.Play(PlayerRef)
                ;Debug.Notification("Combo!")
                TT_ComboMsg.Show()
                LastComboTime = Time
            Endif
        Endif
    Endif
    
   
EndFunction

;ObjectReference[] Property TT_CoinFlipPositions Auto ;position 4 
;ObjectReference[] Property TT_5_CoinFlipPositions Auto 
;

Function CoinToss() 
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    Int Position = RandomInt(0, 8) 
    
    Wait(0.1)
        
    Bool akOwner 
    If TT_PlayerBoardCards[Position].IsEnabled()
        akOwner = 1
    Else 
        akOwner = 0
    Endif 
    
    If Position == 0
        FlipCardFromCoinToss(TT_0_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 1
        FlipCardFromCoinToss(TT_1_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 2
        FlipCardFromCoinToss(TT_2_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 3
        FlipCardFromCoinToss(TT_3_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 4
        FlipCardFromCoinToss(TT_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 5
        FlipCardFromCoinToss(TT_5_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 6
        FlipCardFromCoinToss(TT_6_CoinFlipPositions, akOwner, Position) 
    Elseif  Position == 7
        FlipCardFromCoinToss(TT_7_CoinFlipPositions, akOwner, Position) 
    Else
        FlipCardFromCoinToss(TT_8_CoinFlipPositions, akOwner, Position) 
    Endif    
EndFunction

Function FlipCardFromCoinToss(ObjectReference[] CoinFlipArray, Bool akOwner, Int akPosition)
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    Wait(0.1)
    ObjectReference Coin
    
    If akPosition == 4
        Int I = 0
        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
        Wait(0.4) 
        Coin.setMotionType(4)
        Wait(0.2)
        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
        Wait(0.01)
        Coin.MoveTo(TT_CoinFlipPositions[0])
        While I < 4
            I += 1
            If I == 4
                Coin.TranslateToRef(TT_CoinFlipPositions[5], 75)
                Sound.StopInstance(CoinFlipS)
                TT_CoinFlipHit.Play(PlayerRef)
                If TT_BoardMarkers[akPosition].IsEnabled() == False
                    FlipCard(akPosition, akOwner, True)
                Endif
            Else 
                Coin.TranslateToRef(TT_CoinFlipPositions[I], 75)
            Endif 
            
            Wait(0.05)
        EndWhile
        
        Wait(2)
        
        Coin.Disable()
        Coin.MoveTo(TT_CoinRefMarker)
        Coin.Delete()
        Coin = None
    Else
        Int I = -1
        Int M = (CoinFlipArray.Length - 1)
        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
        Wait(0.4) 
        Coin.setMotionType(4)
        Wait(0.2)
        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
        Wait(0.01)
        Coin.MoveTo(TT_CoinFlipPositions[0])
        While I < M
            I += 1
            If I >= M
                Coin.TranslateToRef(CoinFlipArray[I], 75)
                Sound.StopInstance(CoinFlipS)
                TT_CoinFlipHit.Play(PlayerRef)
                If TT_BoardMarkers[akPosition].IsEnabled() == False
                    FlipCard(akPosition, akOwner, True)
                Endif
            Else 
                Coin.TranslateToRef(CoinFlipArray[I], 75)
            Endif 
            
            Wait(0.05)
        EndWhile
        
        Wait(2)
        
        Coin.Disable()
        Coin.MoveTo(TT_CoinRefMarker)
        Coin.Delete()
        Coin = None
    Endif
    
    TT_ScoreScript.StartDisplayScore() 
    
    If OpponentsTurn == False
        OpponentPlacesCard()
    Else 
        OpponentsTurn = False 
        ;Debug.Notification("Your turn.")
        TT_YourTurnMsg.Show()
    Endif
EndFunction

Function FlipCard(Int CardPosition, Bool akOwner, Bool Combo) 
    ;Debug.Notification("Flip Card " + Card + " " + akOwner)
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    TT_CardFlip.Play(PlayerRef)
    
    If akOwner == 0
        TT_PlayerBoardCards[CardPosition].Enable()
        TT_OpponentBoardCards[CardPosition].Disable()
    Else 
        TT_OpponentBoardCards[CardPosition].Enable()
        TT_PlayerBoardCards[CardPosition].Disable()
    Endif
    
    If Combo == True 
        PlaceCard(CardPosition, TT_BoardMiscCards[CardPosition], akOwner, True, False)
    Endif
        
EndFunction

Bool Function CanFlipRightCard(Int CardPosition, Bool akOwner, MiscObject Card)
    Int Index = CardPosition + 1
    
    If akOwner == 1 
        If TT_PlayerBoardCards[Index].IsEnabled() && Index != 3 && Index != 6 && Index <= 8 \
            && TT_BoardMiscCards[Index] != None
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
            
            If CardScriptRef.Right > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Left
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Else 
        If TT_OpponentBoardCards[Index].IsEnabled()  && Index != 3 && Index != 6 && Index <= 8 \
            && TT_BoardMiscCards[Index] != None
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
            
            If CardScriptRef.Right > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Left
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Endif
EndFunction


Bool Function CanFlipLeftCard(Int CardPosition, Bool akOwner, MiscObject Card)
    Int Index = CardPosition - 1

    If akOwner == 1
        If TT_PlayerBoardCards[Index].IsEnabled() && Index != 2 && Index != 5 && Index >= 0 \
            && TT_BoardMiscCards[Index] != None
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
           
            If  CardScriptRef.Left > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Right
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return false 
        Endif 
    Else 
        If TT_OpponentBoardCards[Index].IsEnabled()  && Index != 2 && Index != 5 && Index >= 0 \
            && TT_BoardMiscCards[Index] != None
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
           
            If CardScriptRef.Left > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Right
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return false 
        Endif 
    Endif
EndFunction

Bool Function CanFlipTopCard(Int CardPosition, Bool akOwner, MiscObject Card)
    Int Index = CardPosition - 3
        
    If akOwner == 1
        If TT_PlayerBoardCards[Index].IsEnabled() && TT_BoardMiscCards[Index] != None && Index >= 0
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
                   
            If Index >= 0 && CardScriptRef.Top > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Bottom
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Else 
        If TT_OpponentBoardCards[Index].IsEnabled() && TT_BoardMiscCards[Index] != None && Index >= 0
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
                   
            If Index >= 0 && CardScriptRef.Top > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Bottom
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Endif
EndFunction

Bool Function CanFlipBottomCard(Int CardPosition, Bool akOwner, MiscObject Card)
    Int Index = CardPosition + 3
            
    If akOwner == 1
        If TT_PlayerBoardCards[Index].IsEnabled()  && TT_BoardMiscCards[Index] != None && Index <= 8
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
            
            If Index <= 8 && CardScriptRef.Bottom > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Top
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Else 
        If TT_OpponentBoardCards[Index].IsEnabled() && TT_BoardMiscCards[Index] != None && Index <= 8
            
            TT_Skyrim_CardScript CardScriptRef = Card as TT_Skyrim_CardScript
            
            If Index <= 8 && CardScriptRef.Bottom > (TT_BoardMiscCards[Index] as TT_Skyrim_CardScript).Top
                Return True 
            Else 
                Return False 
            Endif 
        Else 
            Return False 
        Endif 
    Endif
EndFunction

Int[] Function GetScore()
    Int[] CurrentScore = New Int[2]
   
    Int PlayerScore = 0
    Int OpponentScore = 0
    Int M = 5 
    While M > 0
        M -= 1
        If TT_PlayerHandActivators[M].IsEnabled()
            PlayerScore += 1
        Endif 
        
        If TT_OpponentHandStatics[M].IsEnabled() 
            OpponentScore += 1
        Endif 
    EndWhile 
    
    Int Ma = 9 
    While Ma > 0
        Ma -= 1 
        If TT_PlayerBoardCards[Ma].IsEnabled()
            PlayerScore += 1
        Elseif TT_OpponentBoardCards[Ma].IsEnabled() 
            OpponentScore += 1
        EndIf 
    EndWhile
    
    Wait(0.1)
    CurrentScore[0] = PlayerScore
    CurrentScore[1] = OpponentScore
    Return CurrentScore
EndFunction

Function EndGame()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    TT_PlayerChestScript.GoToState("Busy")
    ;Debug.MessageBox("End Game")
    EndGameCheck = true
    TT_WinnerChestA.RemoveAllItems()
    CardsTaken = 0
    Int[] Score = GetScore()
    TT_ScoreScript.DisplayScore()
    Wait(0.2)
    
    If Score[0] == Score[1]
        Wait(0.1)
        if TradeRules == 1 ;Direct
            ;Debug.MessageBox("Tie game. Direct trade in effect.")
            TT_TieGameDirectMsg.Show()
            Wait(0.1)
            DirectTrade()
        Else 
            ;Debug.MessageBox("Tie game")
            TT_TieGameMsg.Show()
            EndGameB()
        Endif
    Elseif Score[0] > Score[1]
        If BetAmount > 0 
            Opponent.RemoveItem(Gold001, BetAmount)
            PlayerRef.AddItem(Gold001, BetAmount)
        Endif
        
        If TradeRules == 0 || TradeRules == 2 
            If TradeRules == 0
                WinnerCardAmount = 1
            Else 
                WinnerCardAmount = (Score[0] - Score[1]) / 2;	Included by TTTT_v1
            Endif 
            
            If WinnerCardAmount > 5
                WinnerCardAmount = 5
            Endif
            
            SetUpForGiftMenu()
            ;Debug.MessageBox("Score is " + Score[0] + " to " + Score[1] + \
            ;"\n You win! Take " + WinnerCardAmount +  " of your opponent's cards")
            TT_WinGameSound.Play(PlayerRef)
            TT_WinMsg.Show((Score[0]), (Score[1]), (WinnerCardAmount))
            
            GiftMenuOpen = True
            TransferCards = True
            Wait(0.2) 
            Opponent.ShowGiftMenu(false, TT_OpponentCards, true, false)
            Wait(0.1)
            If OpponentHasTT_CardToGet == true 
                ObjectReference CardToGet = TT_CardToGet.GetReference()
                Form CardToGetBase = CardToGet.GetBaseObject()
                If Opponent.GetItemCount(CardToGetBase) == 0
                    TT_CardFetchChestRef.RemoveItem(CardToGet, 1, true, playerRef)
                    TT_PlayerCardsChest.RemoveItem(CardToGetBase, 1)
                    OpponentHasTT_CardToGet = false
                Endif 
            Endif
                    
            Opponent.RemoveItem(TT_OpponentCards, 1)
            GiftMenuOpen = False
            TransferCards = False
            EndgameB()
        Elseif TradeRules == 1 ;Direct
            ;Debug.MessageBox("You win! Direct trade rule in effect.") 
            TT_WinGameSound.Play(PlayerRef)
            TT_WinDirectMsg.Show()
            Wait(0.5)
            DirectTrade()
            
        Else ;All 
            TT_WinGameSound.Play(PlayerRef)
            ReEnableCardHandDisplays()
            TransferCards = true
            If Rule_Open == false 
                Int Mc = 5
                While Mc > 0
                    Mc -= 1
                    MiscObject Card = TT_OpponentCardsArray[Mc]
                    TT_PlaceCard.Play(PlayerRef)
                    TT_OpponentHandStatics[Mc].Disable()
                    Wait(0.5)
                    PlayerRef.AddItem(Card, 1)
                EndWhile 
            Else 
                Int Mc = 5
                While Mc > 0
                    Mc -= 1
                    MiscObject Card = TT_OpponentCardsArray[Mc]
                    TT_PlaceCard.Play(PlayerRef)
                    TT_OpponentHandStatics[Mc].Disable()
                    Int CardListIndex = TT_AllCardsMiscList.Find(Card) 
                    TT_Skyrim_ModCardScript ModCardScript = Card as TT_Skyrim_ModCardScript
                    ObjectReference DisplayCard
                    
                    If ModCardScript != None
                        DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(ModCardScript.StaticCard, 1, 0, 1)
                    Elseif CardListIndex > -1
                        DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(TT_AllCardsList.GetAt(CardListIndex), 1, 0, 1)
                    Endif
                    
                    Wait(0.5) 
                    DisplayCard.Enable() 
                    Wait(0.5)
                    PlayerRef.AddItem(Card, 1)
                    DisplayCard.Disable()
                    DisplayCard.Delete()
                    DisplayCard =None
                EndWhile 
            Endif
            
            Wait(0.1) 
            If OpponentHasTT_CardToGet == true 
                ObjectReference CardToGet = TT_CardToGet.GetReference()
                Form CardToGetBase = CardToGet.GetBaseObject()
                If Opponent.GetItemCount(CardToGetBase) == 0
                    TT_CardFetchChestRef.RemoveItem(CardToGet, 1, true, playerRef)
                    TT_PlayerCardsChest.RemoveItem(CardToGetBase, 1)
                    OpponentHasTT_CardToGet = false
                Endif 
            Endif
            
            EndgameB()
        Endif
    Elseif Score[0] < Score[1]
        If BetAmount > 0 
            Opponent.AddItem(Gold001, BetAmount)
            PlayerRef.RemoveItem(Gold001, BetAmount)
        Endif 
        
        TransferCards = False
        ;Debug.MessageBox("Score is " + Score[0] + " to " + Score[1] + "\n You lose")
        TT_LoseMsg.Show(Score[0], Score[1])
        
        If TradeRules == 0 || TradeRules == 2 
            ReEnableCardHandDisplays()
            
            If TradeRules == 0
                WinnerCardAmount = 1
            Else 
                WinnerCardAmount = (Score[1] - Score[0]) / 2;	Included by TTTT_v1
            Endif 
            
            If WinnerCardAmount > 5
                WinnerCardAmount = 5
            Endif
            
            Wait(0.5)
        
            Int I = 0 
            Int Index = RandomInt(0, 4)
            While I < WinnerCardAmount
                I += 1
                MiscObject CardToTakeBase = TT_PlayerCardsArray[Index]
                Int CardListIndex = TT_AllCardsMiscList.Find(CardToTakeBase) 
                TT_Skyrim_ModCardScript ModCardScript = CardToTakeBase as TT_Skyrim_ModCardScript
                ObjectReference DisplayCard
                
                If ModCardScript != None
                    DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(ModCardScript.StaticCard, 1, 0, 1)
                Elseif CardListIndex > -1
                    DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(TT_AllCardsList.GetAt(CardListIndex), 1, 0, 1)
                Endif
                
                TT_PlaceCard.Play(PlayerRef)
                TT_PlayerHandActivators[Index].Disable()
                Wait(0.5) 
                DisplayCard.Enable() 
               
                If PlayerRef.GetItemCount(CardToTakeBase) > 0
                    PlayerRef.RemoveItem(CardToTakeBase, 1)
                    Wait(0.5)
                    Opponent.AddItem(CardToTakeBase, 1)
                Else 
                    TT_PlayerCardsChest.RemoveItem(CardToTakeBase, 1, True, PlayerRef)
                    Wait(0.5)
                    PlayerRef.RemoveItem(CardToTakeBase, 1, False)
                    Opponent.AddItem(CardToTakeBase, 1)
                Endif 
				TT_PlayerCardsArray[Index] = None;	Included by TTTT_v1
                DisplayCard.Disable() 
                DisplayCard.Delete() 
                DisplayCard = None
                
                Index += 1
                Wait(0.1)
                If Index >= 5
                    Index = 0
                Endif
                ;Debug.MessageBox("Card to take is " + CardToTakeBase.GetName())
                Wait(0.1)
            EndWhile
    
            Wait(1) 
            EndGameB()
        Elseif TradeRules == 1
            DirectTrade()
        Else ;All
            ReEnableCardHandDisplays()
            
            Int Mv = -1
            While Mv < 4
                Mv += 1
                Wait(0.1)
                MiscObject CardMisc = TT_PlayerCardsArray[Mv]
                Int CardListIndex = TT_AllCardsMiscList.Find(CardMisc) 
                TT_Skyrim_ModCardScript ModCardScript = CardMisc as TT_Skyrim_ModCardScript
                ObjectReference DisplayCard
                
                If ModCardScript != None
                    DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(ModCardScript.StaticCard, 1, 0, 1)
                Elseif CardListIndex > -1
                    DisplayCard = TT_EndGameTakeCardDisplay.PlaceAtMe(TT_AllCardsList.GetAt(CardListIndex), 1, 0, 1)
                Endif
                
                TT_PlaceCard.Play(PlayerRef)
                TT_PlayerHandActivators[Mv].Disable()
                Wait(0.7) 
                DisplayCard.Enable() 
                
                If PlayerRef.GetItemCount(CardMisc) > 0
                    Wait(0.7)
                    PlayerRef.RemoveItem(CardMisc, 1)
                    Opponent.AddItem(CardMisc, 1)
                    
                Else 
                    TT_PlayerCardsChest.RemoveItem(CardMisc, 1, True, PlayerRef)
                    Wait(0.7)
                    PlayerRef.RemoveItem(CardMisc, 1)
                    Opponent.AddItem(CardMisc, 1)
                Endif 
                TT_PlayerCardsArray[Mv] = None;	Included by TTTT_v1
                DisplayCard.Disable() 
                DisplayCard.Delete() 
                DisplayCard = None
                Wait(0.7)
                TT_PlayerHandActivators[Mv].Disable()
            EndWhile 
            Wait(0.1)
            EndGameB()
        Endif
    Endif 
EndFunction

Function ReEnableCardHandDisplays() 
    
    ;Debug.MessageBox("Re-enable Hand displays")
    Wait(0.1)
    Int I = -1
    While I < 8
        I += 1
        ;TT_PlaceCard.Play(PlayerRef)
        TT_PlayerBoardCards[I].Disable()
        TT_OpponentBoardCards[I].Disable() 
        Wait(0.1)
    EndWhile 
    
    Int Ia = -1 
    While Ia < 4
        Ia += 1
        ;TT_PlaceCard.Play(PlayerRef)
        TT_PlayerHandActivators[Ia].Enable()
        Wait(0.1)
    EndWhile 
    
    Int Ib = -1 
    While Ib < 4
        Ib += 1
        ;TT_PlaceCard.Play(PlayerRef)
        TT_OpponentHandStatics[Ib].Enable()
        Wait(0.1)
    EndWhile 
EndFunction
        
Function AddPlayerCardsBack()
    Int M = 5
    While M > 0
        M -= 1
        MiscObject Card = TT_PlayerCardsArray[M]
        TT_PlayerCardsChest.AddItem(Card, 1)
    EndWhile
    
    Wait(1)
EndFunction

Function SetUpForGiftMenu()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    TT_OpponentCards.Revert()
    
    Wait(1)
    
    Int Ma = 5
    While Ma > 0
        Ma -= 1
        MiscObject Card = TT_OpponentCardsArray[Ma]
        TT_OpponentCards.AddForm(Card)
        Int Count = Opponent.GetItemCount(Card) 
        If Count > 1 
            Opponent.RemoveItem(Card, (Count - 1), True, TT_WinnerChestA)
        Elseif Count == 0
            Opponent.AddItem(Card, 1)
        Endif 
    EndWhile
EndFunction


Function DirectTrade()
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    ObjectReference CardToGet = TT_CardToGet.GetReference()
    Form CardToGetBase = CardToGet.GetBaseObject()
    
    MiscObject[] PlayerCards = New MiscObject[5]
   
    Int M = 5 
    While M > 0
        M -= 1
        PlayerCards[M] = TT_PlayerCardsArray[M]
        TT_PlayerCardsChest.Removeitem(TT_PlayerCardsArray[M], 1)
        Opponent.RemoveItem(TT_OpponentCardsArray[M], 1)
    EndWhile
    
    TransferCards = true 
    Int Mb;	Included by TTTT_v1
    Int Ma = 9
    While Ma > 0
        Ma -= 1
        MiscObject Card 
        Static PlayerStaticCard = TT_PlayerBoardCards[Ma].GetBaseObject() as Static
        Int CardIndex = TT_AllCardsList.Find(PlayerStaticCard)
        If CardIndex > -1
            Card = TT_AllCardsMiscList.GetAt(CardIndex) as MiscObject
        Else 
            Mb = 5;	Excluded by TTTT_v1:	Int Mb = 5 
            While Mb > 0
                Mb -= 1
                TT_Skyrim_ModCardScript PlayerModCardScript = TT_PlayerCardsArray[Mb] as TT_Skyrim_ModCardScript
                TT_Skyrim_ModCardScript OpponentModCardScript = TT_OpponentCardsArray[Mb] as TT_Skyrim_ModCardScript
                
                If PlayerModCardScript != none
                    If PlayerModCardScript.StaticCard == PlayerStaticCard 
                        Card = TT_PlayerCardsArray[Mb]
                    Endif 
                Elseif OpponentModCardScript != none 
                    If OpponentModCardScript.StaticCard == PlayerStaticCard 
                        Card = TT_OpponentCardsArray[Mb]
                    Endif 
                Endif
            EndWhile 
        Endif
                
        If TT_PlayerBoardCards[Ma].IsEnabled()
            
            If OpponentHasTT_CardToGet == True
                If TT_OpponentCardsArray.Find(Card) > -1
                    TT_CardFetchChestRef.RemoveItem(CardToGet, 1, true, playerRef)
                    OpponentHasTT_CardToGet = false 
                Endif 
            Else
                PlayerRef.Additem(Card, 1)
                TT_PlayerBoardCards[Ma].Disable()
            Endif
        Else
            Int PlayerCardIndex = PlayerCards.Find(Card)
            If PlayerCardIndex > -1 ;if 
                Opponent.AddItem(Card, 1)
                PlayerCards[PlayerCardIndex] = None
				TT_PlayerCardsArray[Mb] = None;	Included by TTTT_v1
            Endif
            TT_OpponentBoardCards[Ma].Disable()
        Endif 
        Wait(0.4)
    EndWhile
    
    Int Ia = -1 
    While Ia < 4
        Ia += 1
        ;TT_PlaceCard.Play(PlayerRef)
        If TT_PlayerHandActivators[Ia].IsEnabled()
            PlayerRef.AddItem(TT_PlayerCardsArray[Ia], 1)
            TT_PlayerHandActivators[Ia].Disable()
        Endif
        ;Wait(0.1)
    EndWhile 
  
    Wait(0.1)
    EndgameB()
EndFunction

Function EndGameB()
    TT_PlayerChestScript.GoToState("GameNotActive")
    
    If CancelGame == True || PlayerRef.GetParentCell() != TT_WinnerChestA.GetParentCell() 
        Return
    Endif 
    
    ObjectReference CardToGet = TT_CardToGet.GetReference()
    If OpponentHasTT_CardToGet == True 
        TT_CardFetchChestRef.RemoveItem(CardToGet, 1, False, Opponent)
    Endif 
    
    ;Debug.MessageBox("End Game B")
    
    Wait(0.1)
    TransferCards = False
    EndGameCheck = False
    
    ClearBoard()
    Wait(1)
    
    If TT_PlayAgain.Show() == 0
        Int CardCount = TT_PlayerCardsChest.GetItemCount(TT_AllCardsMiscList)
        Int CardCountB = TT_PlayerCardsChest.GetItemCount(TT_AllModCardsMiscList)
;TOP Excluded by TTTT_v1
;       TT_AllModCardsMiscList should have all cards added by the original mod and 
;       those added by separate esps. CardCount is a backup for people who already 
;       had Triple Triad installed and are updating to version 3.0
;END Excluded by TTTT_v1
        Wait(0.1)
        If  CardCount >= 5 || CardCountB >= 5
            SetUpBoard()
        Else 
            ;Debug.MessageBox("You don't have enough cards.")
            TT_NotEnoughCardsMsg.Show()
            Wait(0.5)
            EndGameC()
        Endif 
    Else 
        EndGameC() 
    Endif 
EndFunction 

Function EndGameC()
    PlayerRef.RemoveSpell(TT_PreventWeaponDrawSpell)
    PlayerRef.RemoveSpell(TT_PreventExtraActorsCloak)
    ObjectReference CardToGet = TT_CardToGet.GetReference()
    If PlayerHasTT_CardToGet == True
        TT_CardFetchChestRef.RemoveItem(CardToGet, 1, False, PlayerRef)
    Endif
        
    GameActive = false
    TransferCards = TransferCardsSave
    PlayerRef.MoveTo(PreviousLocation)
    
    If Opponent.GetDistance(OpponentPreviousLocation) > 300
        Opponent.MoveTo(OpponentPreviousLocation)
    Endif
   
    Game.ShowFirstPersonGeometry(True)
    Wait(1)
    SetINIBool("bShowCompass:Interface", True)
;TOP Included by TTTT_v1
	TT_NativeFunctions.ResetFOV()
;TOP Included by TTTT_v1
    If FirstPersonCheck == false
        Game.ForceThirdPerson()
    EndIf
    
    TT_PlayerChestScript.GoToState("GameNotActive")
    PlayerRef.SetAv("SpeedMult", PlayerSpeed)
    PlayerRef.ModAv("InventoryWeight", 0.1)
    Game.SetInChargen(false, false, false) ;enable save and wait
    PreviousLocation.Disable()
    PreviousLocation.Delete()
    PreviousLocation = none
    
    Opponent.Say(TT_TripleTriadCardGameQuestGoodbye)
    SetCardTrackerBookDisplays()
    ClearBoard()
    Wait(1)
    Opponent = None
    Int I = 0 
    While I < 50
        I += 1
        Actor akActor = Game.FindRandomActorFromRef(TT_WinnerChestA, 1000) 
        If akActor != None && akActor != PlayerRef && akActor.GetParentCell() == TT_WinnerChestA.GetParentCell()
            akActor.MoveTo(OpponentPreviousLocation)
        Elseif akActor == None
            I = 150
        Endif 
    EndWhile
            
    OpponentPreviousLocation.Disable()
    OpponentPreviousLocation.Delete()
    OpponentPreviousLocation = none
    
    Wait(3.0)
    TT_OpponentAlias.Clear()
EndFunction 

Function ClearBoard()
    Int I = -1
    While I < 8 
        I += 1
        Wait(0.1)
        TT_PlayerBoardCards[I].Disable()
        TT_PlayerBoardCards[I].Delete()
        
        TT_OpponentBoardCards[I].Disable()
        TT_OpponentBoardCards[I].Delete()
    
        TT_PlayerBoardCards[I] = None
        TT_OpponentBoardCards[I] = None
        TT_BoardMiscCards[I] = None
        BoardCardScripts[I] = None
        TT_BoardMarkers[I].Enable()
    EndWhile 
    
    Int Ia = -1
    While Ia < 4
        Ia += 1
        TT_PlayerHandActivators[Ia].Disable()
        TT_PlayerHandActivators[Ia].Delete()
        
        TT_PlayerHandStatics[Ia].Disable()
        TT_PlayerHandStatics[Ia].Delete()
        
        TT_OpponentHandStatics[Ia].Disable()
        TT_OpponentHandStatics[Ia].Delete()
        
        TT_PlayerHandActivators[Ia] = None
        TT_PlayerHandStatics[Ia] = None
        TT_OpponentHandStatics[Ia] = None
    EndWhile
    
    TT_PlayerCoin.Disable()
    TT_OpponentCoin.Disable()
    
    TT_PlacedPlayerHandActiCards.Revert()
    
    ;Debug.Notification("Board Cleared")
EndFunction

Function SetPlayerRulesDisplay()
    If Holds_Rule_Same[9] == False 
        TT_RuleSameDisplay.ForceRefTo(TT_RuleSameUnCheckedRef)
    Else
        TT_RuleSameDisplay.ForceRefTo(TT_RuleSameCheckedRef)
    Endif 
    
    
    If Holds_Rule_Plus[9] == False 
        TT_RulePlusDisplay.ForceRefTo(TT_RulePlusUnCheckedRef)
    Else
        TT_RulePlusDisplay.ForceRefTo(TT_RulePlusCheckedRef)
    Endif 
    
    If Holds_Rule_CoinToss[9] == False 
        TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossUnCheckedRef)
    Else
        TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossCheckedRef)
    Endif 
    
    If Holds_Rule_Combo[9] == False 
        TT_RuleComboDisplay.ForceRefTo(TT_RuleComboUnCheckedRef)
    Else
        TT_RuleComboDisplay.ForceRefTo(TT_RuleComboCheckedRef)
    Endif 
    
    If Holds_Rule_Open[9] == False 
        TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenUnCheckedRef)
    Else
        TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenCheckedRef)
    Endif 
    
    If Holds_Rule_Random[9] == False 
        TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomUnCheckedRef)
    Else
        TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomCheckedRef)
    Endif 
   
    If Holds_TradeRules[9] == 0
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_0)
        
    Elseif Holds_TradeRules[9] == 1
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_1)
        
    Elseif  Holds_TradeRules[9] == 2
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_2)
        
    Elseif  Holds_TradeRules[9] == 3
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_3)
    Endif 
EndFunction

Message Property TT_MainMenuMsg Auto
Message Property TT_DebugMenuMsg Auto

Function SetRules() 
    Int Button = TT_MainMenuMsg.Show()
    
    If Button == 0
        SetRulesA()
    Elseif Button == 1 
        ConfigMenu() 
    Elseif Button == 2 
        DebugMenu()
    Endif
EndFunction

Function DebugMenu() 
    Int Button = TT_DebugMenuMsg.Show()
    If Button == 0 
        SetRules()
    Elseif Button == 1 
        SetINIBool("bShowCompass:Interface", True)
    Elseif Button == 2
        SetINIBool("bShowCompass:Interface", False)
    Elseif Button == 3
        CancelGame = True
        Wait(2.5)
        CancelGame = False
        Wait(1)
        SetUpBoard()
    Elseif Button == 4
        CancelGame = True
        ClearBoard() 
        Wait(1)
        EndGameC()
    Endif
    
    If Button >= 1 && Button <= 2
        DebugMenu()
    Endif
EndFunction

Function SetRulesA() 
    Int Button = TT_SetRules.Show()
    
    
    If Button == 0
        SetRules()
    ElseIf Button == 1
        LocationRules()
    ElseIf Button == 2
        If Holds_Rule_Same[9] == True 
            Holds_Rule_Same[9] = False 
            TT_RuleSameDisplay.ForceRefTo(TT_RuleSameUnCheckedRef)
        Else 
            Holds_Rule_Same[9] = True 
            TT_RuleSameDisplay.ForceRefTo(TT_RuleSameCheckedRef)
        Endif 
    ElseIf Button == 3
        If Holds_Rule_Plus[9] == True 
            Holds_Rule_Plus[9] = False 
            TT_RulePlusDisplay.ForceRefTo(TT_RulePlusUnCheckedRef)
        Else 
            Holds_Rule_Plus[9] = True 
            TT_RulePlusDisplay.ForceRefTo(TT_RulePlusCheckedRef)
        Endif 
    ElseIf Button == 4
        If Holds_Rule_CoinToss[9] == True 
            Holds_Rule_CoinToss[9] = False 
            TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossUnCheckedRef)
        Else 
            Holds_Rule_CoinToss[9] = True 
            TT_RuleCoinTossDisplay.ForceRefTo(TT_RuleCoinTossCheckedRef)
        Endif 
    
    ElseIf Button == 5
        If Holds_Rule_Combo[9] == True 
            Holds_Rule_Combo[9] = False 
            TT_RuleComboDisplay.ForceRefTo(TT_RuleComboUnCheckedRef)
        Else 
            Holds_Rule_Combo[9] = True 
            TT_RuleComboDisplay.ForceRefTo(TT_RuleComboCheckedRef)
        Endif 
    ElseIf Button == 6
        If Holds_Rule_Open[9] == True 
            Holds_Rule_Open[9] = False 
            TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenUnCheckedRef)
        Else 
            Holds_Rule_Open[9] = True 
            TT_RuleOpenDisplay.ForceRefTo(TT_RuleOpenCheckedRef)
        Endif 
    ElseIf Button == 7
        If Holds_Rule_Random[9] == True 
            Holds_Rule_Random[9] = False 
            TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomUnCheckedRef)
        Else 
            Holds_Rule_Random[9] = True 
            TT_RuleRandomDisplay.ForceRefTo(TT_RuleRandomCheckedRef)
        Endif 
    
    ElseIf Button == 8
        SetTradeRules()
    Endif
    
    If Button < 8 && Button > 1
        Wait(0.1)
        SetRulesA()
    Endif 
    
EndFunction

Function LocationRules()
        Int Button = TT_SetLocationRules.Show(RandomGameRules) 
        If Button == 0 
            SetRulesA()
        Elseif Button == 1
            If HoldRulesToggle == True 
                HoldRulesToggle = False 
                TT_RuleHoldsDisplay.ForceRefTo(TT_RuleHoldsUnCheckedRef)
            Else 
                HoldRulesToggle = True 
                TT_RuleHoldsDisplay.ForceRefTo(TT_RuleHoldsCheckedRef)
            Endif 
            LocationRules()
        Elseif Button == 2
            If RandomGameRules == 3
                RandomGameRules = 0
            Else 
                RandomGameRules += 1
            Endif 
            LocationRules()
        Endif
EndFunction

;0 = One, take only one card
;1 = Direct, you get all the cards you captured and lose all the cards you conceded during play.
;2 = Diff, the amount of cards you get or lose equals the difference in score. So, if score is 6-4 you get 2 cards. 
;3 = All, Winner takes all the cards from the opponent's hand.

Function SetTradeRules()
    Int Button = TT_SetTradeRules.Show() 
    If Button == 0 
        Holds_TradeRules[9] = 0
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_0)
        
    ElseIf Button == 1
        Holds_TradeRules[9] = 1
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_1)
        
    ElseIf Button == 2 
        Holds_TradeRules[9] = 2
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_2)
        
    ElseIf Button == 3 
        Holds_TradeRules[9] = 3
        TT_TradeRule_Display.ForceRefTo(TT_TradeRule_3)
    Endif
        
    SetRulesA()
   
EndFunction

;GlobalVariable Property TT_OfferServiceRestrict Auto ;if set to 1, triple triad dialogue doesn't show up for NPC's that are offering services 
;Message Property TT_OfferServiceRestrictMsg Auto
;ReferenceAlias Property TT_OfferServiceRestrictDisplayAlias Auto

Function ConfigMenu() 
    If TT_BuyBackCardsAlias.GetReference() == None 
        If TT_BuyCardsDialogueGv.GetValue() == 1
            TT_BuyBackCardsAlias.ForceRefTo(TT_CheckedRef)
        Else 
            TT_BuyBackCardsAlias.ForceRefTo(TT_UnCheckedRef)
        Endif 
    Endif 
    
    Int Button = TT_ConfigMsg.Show(GoldInjectAmount, PreferedBetAmount) 
    If Button == 0 
        SetRules()
        
    Elseif Button == 1
        Int ButtonB = TT_AutoTransferMsg.Show() 
        If ButtonB == 0
            TransferCards = True 
            ;Debug.Notification("Auto Transfer Enabled")
            TT_RuleTransferDisplay.ForceRefTo(TT_RuleTransferCheckedRef)
        Else 
            TransferCards = False 
            ;Debug.Notification("Auto Transfer Disabled")
            TT_RuleTransferDisplay.ForceRefTo(TT_RuleTransferUnCheckedRef)
        Endif 
        
        ConfigMenu()
        
    Elseif Button == 2
        Int ButtonB = TT_NPCBossCardsMsg.Show()
        If ButtonB == 0
            NPCBossCards = true 
            
            TT_NPCBossCardsDisplay.ForceRefTo(TT_CheckedRef)
            ConfigMenu()
            AddUniqueCardsToLists()
        Else 
            NPCBossCards = False 
            
            TT_NPCBossCardsDisplay.ForceRefTo(TT_UnCheckedRef)
            ConfigMenu()
            RemoveUniqueCardsFromLists() 
        Endif 
    Elseif Button == 3
        Int ButtonB = TT_OfferServiceRestrictMsg.Show()
        If ButtonB == 0
            TT_OfferServiceRestrict.SetValue(1)
            TT_OfferServiceRestrictDisplayAlias.ForceRefTo(TT_CheckedRef)
        Else 
            TT_OfferServiceRestrict.SetValue(0)
            TT_OfferServiceRestrictDisplayAlias.ForceRefTo(TT_UnCheckedRef)
        Endif 
        
        ConfigMenu()
    Elseif Button == 4 
        Int ButtonB = TT_BuyBackCardsMsg.Show()
        If ButtonB == 0
            TT_BuyCardsDialogueGv.SetValue(1)
            TT_BuyBackCardsAlias.ForceRefTo(TT_CheckedRef)
        Else 
            TT_BuyCardsDialogueGv.SetValue(0)
            TT_BuyBackCardsAlias.ForceRefTo(TT_UnCheckedRef)
        Endif 
        
        ConfigMenu()
    Elseif Button == 5
        TT_BetPlus100.SetValue(GoldInjectAmount + 100);		Excluded by TTTT_v1: TT_BetMinus10.SetValue(GoldInjectAmount - 10) ;setting these globals restrict message buttons
        TT_BetPlus10.SetValue(GoldInjectAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(GoldInjectAmount - 100)
        TT_BetMinus100.SetValue(GoldInjectAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(GoldInjectAmount + 10)
        TT_BetMinus10.SetValue(GoldInjectAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(GoldInjectAmount + 100)
        SetGoldInjectAmount() 
        
    Elseif Button == 6
        TT_BetPlus100.SetValue(PreferedBetAmount + 100);	Excluded by TTTT_v1: TT_BetMinus10.SetValue(PreferedBetAmount - 10)
        TT_BetPlus10.SetValue(PreferedBetAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(PreferedBetAmount - 100)
        TT_BetMinus100.SetValue(PreferedBetAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(PreferedBetAmount + 10)
        TT_BetMinus10.SetValue(PreferedBetAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(PreferedBetAmount + 100)
        SetPreferedBetAmount() 
        
    Elseif Button == 7
        SetCardPackMethods()
        
    Endif 
EndFunction 

;Bool Property VendorCardPackAuto Auto
;Bool Property NPCCardPackAuto Auto

Function SetCardPackMethods()
    Int Button = SetCardPackMethodsMsg.Show(CardPackMinCards, CardPackMaxCards) 
    If Button == 0
        ConfigMenu()
    
    ElseIf Button == 1
        If VendorCardPackAuto == False 
            VendorCardPackAuto = True
            TT_VendorCardPackAutoDisplay.ForceRefTo(TT_CardPackAuto) 
        Else  
            VendorCardPackAuto = False
            TT_VendorCardPackAutoDisplay.ForceRefTo(TT_CardPackMenu) 
        Endif 
        SetCardPackMethods()
        
    Elseif Button == 2
        If NPCCardPackAuto == False
           NPCCardPackAuto = True 
            TT_NPCCardPackAutoDisplay.ForceRefTo(TT_CardPackAuto) 
        Else  
            NPCCardPackAuto = False
            TT_NPCCardPackAutoDisplay.ForceRefTo(TT_CardPackMenu) 
        Endif 
        SetCardPackMethods()
    Elseif Button == 3
        MinCards()
    Elseif Button == 4 
        MaxCards()
    Endif
            
EndFunction

Function MinCards()
    Int Button = TT_CardPackMinCardsMsg.Show(CardPackMinCards)
    If Button == 0
        SetCardPackMethods()
    Elseif Button == 1
        CardPackMinCards -= 1
    Elseif Button == 2
        CardPackMinCards += 1 
    Endif 
    
    If CardPackMinCards < 0 
        CardPackMinCards = 0
    Elseif CardPackMinCards > 20 
        CardPackMinCards = 20
    EndIf
    
    If CardPackMaxCards < CardPackMinCards
        CardPackMaxCards = CardPackMinCards
    Endif 
    
    If Button >= 1 && Button <= 2
        MinCards()
    Endif
        
EndFunction 

Function MaxCards() 
    Int Button = TT_CardPackMaxCardsMsg.Show(CardPackMaxCards)
    If Button == 0
        SetCardPackMethods()
    Elseif Button == 1
        CardPackMaxCards -= 1
    Elseif Button == 2
        CardPackMaxCards += 1 
    Endif 
    
    If CardPackMaxCards < 1
        CardPackMaxCards = 1
    Elseif  CardPackMaxCards > 20 
        CardPackMaxCards = 20
    Endif
    
    If CardPackMinCards > CardPackMaxCards
        CardPackMinCards = CardPackMaxCards
    Endif 
    
    If Button >= 1 && Button <= 2
        MaxCards()
    Endif
    
EndFunction

Function SetGoldInjectAmount()
    Int Button = TT_SetGoldInjectAmountMsg.Show(GoldInjectAmount)
    If Button == 0
        ConfigMenu()
    ElseIf Button == 1
        GoldInjectAmount += 100;	Excluded by TTTT_v1: GoldInjectAmount -= 10 
    Elseif Button == 2
        GoldInjectAmount += 10;		Excluded by TTTT_v1: GoldInjectAmount -= 100
    Elseif Button == 3
        GoldInjectAmount -= 100;	Excluded by TTTT_v1: GoldInjectAmount += 10
    Elseif Button == 4
        GoldInjectAmount -= 10;		Excluded by TTTT_v1: GoldInjectAmount += 100
    Endif
    
    If Button < 5 && Button > 0
        TT_BetPlus100.SetValue(GoldInjectAmount + 100);		Excluded by TTTT_v1: TT_BetMinus10.SetValue(GoldInjectAmount - 10)
        TT_BetPlus10.SetValue(GoldInjectAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(GoldInjectAmount - 100)
        TT_BetMinus100.SetValue(GoldInjectAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(GoldInjectAmount + 10)
        TT_BetMinus10.SetValue(GoldInjectAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(GoldInjectAmount + 100)
        SetGoldInjectAmount()
    Endif 
    
EndFunction

Function SetPreferedBetAmount()
    Int Button = TT_SetPreferedBetAmountMsg.Show(PreferedBetAmount)
    If Button == 0
        ConfigMenu()
    ElseIf Button == 1
        PreferedBetAmount += 100;	Excluded by TTTT_v1: PreferedBetAmount -= 10
    Elseif Button == 2
        PreferedBetAmount += 10;	Excluded by TTTT_v1: PreferedBetAmount -= 100
    Elseif Button == 3
        PreferedBetAmount -= 100;	Excluded by TTTT_v1: PreferedBetAmount += 10
    Elseif Button == 4
        PreferedBetAmount -= 10;	Excluded by TTTT_v1: PreferedBetAmount += 100
    Endif
    
    If Button < 5 && Button > 0
        TT_BetPlus100.SetValue(PreferedBetAmount + 100);	Excluded by TTTT_v1: TT_BetMinus10.SetValue(PreferedBetAmount - 10)
        TT_BetPlus10.SetValue(PreferedBetAmount + 10);		Excluded by TTTT_v1: TT_BetMinus100.SetValue(PreferedBetAmount - 100)
        TT_BetMinus100.SetValue(PreferedBetAmount - 100);	Excluded by TTTT_v1: TT_BetPlus10.SetValue(PreferedBetAmount + 10)
        TT_BetMinus10.SetValue(PreferedBetAmount - 10);		Excluded by TTTT_v1: TT_BetPlus100.SetValue(PreferedBetAmount + 100)
        SetPreferedBetAmount()
    Endif 
      
EndFunction

Function AddUniqueCardsToLists()
    Int M = TT_UniqueCardsC.GetSize()
    While M > 0 
        M -= 1
        Form Card = TT_UniqueCardsC.GetAt(M)
        Int GoldValue = Card.GetGoldValue()
        Int Index = 9
        If GoldValue == 80 
            Index = 7
        Elseif GoldValue == 90 
            Index = 8
        Endif
        
        (TT_CardLevelsLists.GetAt(Index) as FormList).AddForm(Card)
    EndWhile
EndFunction

Function RemoveUniqueCardsFromLists() 
    Int M = TT_UniqueCardsC.GetSize()
    Formlist List0 = (TT_CardLevelsLists.GetAt(0) as FormList)
    Formlist List1 = (TT_CardLevelsLists.GetAt(1) as FormList)
    Formlist List2 = (TT_CardLevelsLists.GetAt(2) as FormList)
    Formlist List3 = (TT_CardLevelsLists.GetAt(3) as FormList)
    Formlist List4 = (TT_CardLevelsLists.GetAt(4) as FormList)
    Formlist List5 = (TT_CardLevelsLists.GetAt(5) as FormList)
    Formlist List6 = (TT_CardLevelsLists.GetAt(6) as FormList)
    Formlist List7 = (TT_CardLevelsLists.GetAt(7) as FormList)
    Formlist List8 = (TT_CardLevelsLists.GetAt(8) as FormList)
    Formlist List9 = (TT_CardLevelsLists.GetAt(9) as FormList)
    
    While M > 0 
        M -= 1 
        Form Card = TT_UniqueCardsC.GetAt(M)
        List0.RemoveAddedForm(Card)
        List1.RemoveAddedForm(Card)
        List2.RemoveAddedForm(Card)
        List3.RemoveAddedForm(Card)
        List4.RemoveAddedForm(Card)
        List5.RemoveAddedForm(Card)
        List6.RemoveAddedForm(Card)
        List7.RemoveAddedForm(Card)
        List8.RemoveAddedForm(Card)
        List9.RemoveAddedForm(Card)
    EndWhile
EndFunction

function SetCardTrackerBookDisplays()

	objectReference check
	int i = 0
	
    while i < TT_AllCardsMiscListByValue.GetSize()
	
        form Card = TT_AllCardsMiscListByValue.GetAt(i)
		
        if TT_PlayerCardsChest.GetItemCount(Card) > 0
			check = TT_CheckedRef
        elseIf TT_DisplayBookCardAliasArray[i].GetRef() == TT_CheckedRef
			check = TT_UnCheckedMinusRef
        else
            check = TT_UnCheckedRef
        endIf
		
		TT_DisplayBookCardAliasArray[i].ForceRefTo(check)
        i += 1
		
    endWhile

endFunction

Function AddDisplayBookToPlayer()
    ObjectReference DisplayBook = TT_PlayerCardsChest.PlaceAtme(TT_CardsDisplaybook, 1, 1)
    Wait(1) 
    TT_DisplayBookCardsAlias.ForceRefTo(DisplayBook) 
    Wait(1)
    
    PlayerRef.AddItem(TT_DisplayBookCardsAlias.GetRef())
EndFunction


;for Testing ===========================================================================
;Function PrintCardSums() 
;    Debug.Notification("Start Print")
;    Debug.OpenUserLog("TT_Log")
;    Int M = TT_AllCardsMiscListByValue.GetSize() 
;    While M > 0
;        M -= 1
;        MiscObject Card = TT_AllCardsMiscListByValue.GetAt(M) as MiscObject
;        TT_Skyrim_CardScript CardScript = Card as TT_Skyrim_CardScript
;        Int Sum = (CardScript.Top + CardScript.Left + CardScript.Right + CardScript.Bottom)
;        Debug.TraceUser("TT_Log", (Card.GetName() + ": Value = " + Card.GetGoldValue() + " Sum = " + Sum))
;    EndWhile 
;    
;    Debug.MessageBox("Done Printing")
;EndFunction

;Int TestRules = 0
;
;Event OnKeyDown(Int keyCode)
;    If TestRules == 0 || TestRules == 1
;        TestSameRule()
;    Else 
;        TestPlusRule()
;    Endif
;EndEvent 
;
;Function TestSameRule()
;    
;    ClearBoard()
;    Wait(1)
;    If TestRules == 0
;        Rule_Same = True 
;        Rule_Plus = False 
;        Rule_Combo = False 
;        
;        Wait(1)
;        PlaceCard(3, (TT_AllCardsMiscList.GetAt(1) as MiscObject), 1, 0, 0) 
;        PlaceCard(1, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(2, (TT_AllCardsMiscList.GetAt(85) as MiscObject), 1, 0, 0)
;        PlaceCard(6, (TT_AllCardsMiscList.GetAt(52) as MiscObject), 1, 0, 0)
;        PlaceCard(5, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(7, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;       
;        ;Debug.MessageBox("Placing Last Same Card") 
;        Wait(1)
;        PlaceCard(0, (TT_AllCardsMiscList.GetAt(100) as MiscObject), 0, 0, 0)
;        TestRules += 1 
;    Else 
;        Rule_Same = True 
;        Rule_Plus = False 
;        Rule_Combo = True 
;        
;        Wait(1)
;        PlaceCard(3, (TT_AllCardsMiscList.GetAt(1) as MiscObject), 1, 0, 0)
;        PlaceCard(1, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(2, (TT_AllCardsMiscList.GetAt(85) as MiscObject), 1, 0, 0)
;        PlaceCard(6, (TT_AllCardsMiscList.GetAt(52) as MiscObject), 1, 0, 0)
;        PlaceCard(5, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(7, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;       
;        ;Debug.MessageBox("Placing Last Same Combo Card") 
;        Wait(1)
;        PlaceCard(0, (TT_AllCardsMiscList.GetAt(100) as MiscObject), 0, 0, 0)
;        TestRules += 1 
;    Endif
;EndFunction 
;
;Function TestPlusRule()
;    ClearBoard()
;    If TestRules == 2 
;        ClearBoard()
;        Rule_Same = False 
;        Rule_Plus = True 
;        Rule_Combo = False 
;        
;        Wait(1)
;        
;        PlaceCard(3, (TT_AllCardsMiscList.GetAt(50) as MiscObject), 1, 0, 0)
;        PlaceCard(1, (TT_AllCardsMiscList.GetAt(23) as MiscObject), 1, 0, 0)
;        PlaceCard(2, (TT_AllCardsMiscList.GetAt(45) as MiscObject), 1, 0, 0)
;        PlaceCard(6, (TT_AllCardsMiscList.GetAt(66) as MiscObject), 1, 0, 0)
;        PlaceCard(5, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(7, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        
;        ;Debug.MessageBox("Placing Last Plus Card") 
;        Wait(1)
;        PlaceCard(0, (TT_AllCardsMiscList.GetAt(98) as MiscObject), 0, 0, 0)
;        TestRules += 1
;    Else 
;        Rule_Same = False 
;        Rule_Plus = True 
;        Rule_Combo = True
;         
;        Wait(1)
;        
;        PlaceCard(3, (TT_AllCardsMiscList.GetAt(50) as MiscObject), 1, 0, 0)
;        PlaceCard(1, (TT_AllCardsMiscList.GetAt(23) as MiscObject), 1, 0, 0)
;        PlaceCard(2, (TT_AllCardsMiscList.GetAt(45) as MiscObject), 1, 0, 0)
;        PlaceCard(6, (TT_AllCardsMiscList.GetAt(66) as MiscObject), 1, 0, 0)
;        PlaceCard(5, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        PlaceCard(7, (TT_AllCardsMiscList.GetAt(41) as MiscObject), 1, 0, 0)
;        
;        ;Debug.MessageBox("Placing Last Plus Combo Card") 
;        Wait(1)
;        PlaceCard(0, (TT_AllCardsMiscList.GetAt(98) as MiscObject), 0, 0, 0)
;        TestRules = 0 
;    Endif
;    
;EndFunction
    
;ObjectReference CardMisc
;ObjectReference CardActi
;ObjectReference CardStat
;ObjectReference CardStatB
;Int Test = 0
;
;Function TestCards()
;    If Test == 0
;        Debug.MessageBox("Number of cell refs: " + PlayerRef.GetparentCell().GetNumRefs())
;    Endif
;    
;    CardMisc.Disable()
;    CardMisc.Delete()
;    CardMisc = none
;    
;    CardActi.Disable()
;    CardActi.Delete()
;    CardActi = none
;    
;    CardStat.Disable()
;    CardStat.Delete()
;    CardStat = none
;    
;    CardStatB.Disable()
;    CardStatB.Delete()
;    CardStatB = none
;    
;    CardMisc = PlayerRef.PlaceAtMe(TT_AllCardsMiscList.GetAt(Test), 1, 0, 1)
;    CardActi = TT_PlayerHandMarkers[0].PlaceAtMe(TT_AllCardsActivatorList.GetAt(Test), 1)
;    CardStat = TT_BoardMarkers[0].PlaceAtMe(TT_AllCardsList.GetAt(Test), 1)
;    CardStatB = TT_BoardMarkers[1].PlaceAtMe(TT_AllCardsListB.GetAt(Test), 1)
;    TT_Skyrim_CardScript CardScript = CardMisc as TT_Skyrim_CardScript
;    
;    Wait(2)
;    Debug.MessageBox("Index: " + Test + "\n" +  CardScript.Top + "\n" + CardScript.Left + "  " \
;    + CardScript.Right + "\n" + CardScript.Bottom) 
;    
;    Test += 1
;    If Test >= TT_AllCardsList.GetSize()
;        Test = 0
;    Endif
;EndFunction

;Event OnKeyDown(Int keyCode) 
;    TestCardsB()
;EndEvent
;
;ObjectReference CardStat
;ObjectReference CardStatB
;ObjectReference CardStatC
;
;Int TestCardsBInt = 0
;
;Function TestCardsB()
;    CardStat.Disable()
;    CardStat.Delete()
;    CardStat = none
;    
;    CardStatB.Disable()
;    CardStatB.Delete()
;    CardStatB = none
;    
;    CardStatC.Disable()
;    CardStatC.Delete()
;    CardStatC = none
;        
;    If TestCardsBInt == 0
;       
;        CardStat  = TT_BoardMarkers[0].PlaceAtMe(TT_AllCardsList.GetAt(12), 1) ;bristleback
;        CardStatB = TT_BoardMarkers[1].PlaceAtMe(TT_AllCardsListB.GetAt(39), 1) ;flame atronach
;        CardStatC = TT_BoardMarkers[3].PlaceAtMe(TT_AllCardsListB.GetAt(96), 1) ;Werebear 
;    ElseIf TestCardsBInt == 1
;        
;        CardStat  = TT_BoardMarkers[0].PlaceAtMe(TT_AllCardsList.GetAt(100), 1) ;Wolf
;        CardStatB = TT_BoardMarkers[1].PlaceAtMe(TT_AllCardsListB.GetAt(41), 1) ;Fox
;        CardStatC = TT_BoardMarkers[3].PlaceAtMe(TT_AllCardsListB.GetAt(1), 1) ;Albino Spider 
;    Else 
;         
;        CardStat  = TT_BoardMarkers[0].PlaceAtMe(TT_AllCardsList.GetAt(98), 1) ;Wisp
;        CardStatB = TT_BoardMarkers[1].PlaceAtMe(TT_AllCardsListB.GetAt(23), 1) ;Dragon Priest
;        CardStatC = TT_BoardMarkers[3].PlaceAtMe(TT_AllCardsListB.GetAt(50), 1) ;hagraven 
;    Endif
;    
;    ;Wait(5)
;    TestCardsBInt += 1 
;    If TestCardsBInt > 2
;        TestCardsBInt = 0
;    Endif
;EndFunction

;Event OnKeyDown(Int keyCode) 
;    TestCoinFlip()
;    
;EndEvent
;
;Bool HeadsTails
;
;Function TestCoinFlip()
;    HeadsTails = !HeadsTails
;    ObjectReference Coin
;    Int HeadsOrTails = TT_HeadsOrTails.Show()
;    
;    Wait(0.1)
;    
;    If HeadsTails == 1
;        TT_CoinDisplay.ForceRefTo(TT_CoinHeadsRef)
;        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
;        Wait(0.5) 
;        Coin.setMotionType(4, TRUE)
;        Wait(0.2)
;        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
;        Coin.MoveTo(TT_CoinFlipPositions[0])
;        Int I = 0
;        While I < 4
;            I += 1
;            If I == 4
;                Coin.TranslateToRef(TT_CoinFlipPositions[5], 50)
;                Sound.StopInstance(CoinFlipS)
;                TT_CoinFlipHit.Play(PlayerRef)
;            Else 
;                Coin.TranslateToRef(TT_CoinFlipPositions[I], 50)
;            Endif 
;            
;            Wait(0.05)
;        EndWhile
;        
;        Wait(2)
;        Coin.Disable()
;        Coin.Delete()
;        Coin = None
;        
;        If HeadsOrTails == 0
;            Debug.MessageBox("Heads. You start.")
;            OpponentsTurn = False
;            PlayerStarts = True
;        Else 
;            TT_OpponentStartsMsg.Show()
;            ;OpponentPlacesCard()
;            ;PlayerStarts = False
;        Endif
;    Else 
;        TT_CoinDisplay.ForceRefTo(TT_CoinTailsRef)
;        Coin = PlayerRef.PlaceAtMe(Gold001, 1) 
;        Wait(0.1) 
;        Coin.setMotionType(4, TRUE)
;        Wait(0.1)
;        Int CoinFlipS = TT_CoinFlip.Play(PlayerRef)
;        Coin.MoveTo(TT_CoinFlipPositions[0])
;        Int I = 0
;        While I < 5
;            I += 1
;            If I == 5
;                Coin.TranslateToRef(TT_CoinFlipPositions[6], 50)
;                Sound.StopInstance(CoinFlipS)
;                TT_CoinFlipHit.Play(PlayerRef)
;            Else 
;                Coin.TranslateToRef(TT_CoinFlipPositions[I], 50)
;            Endif 
;            
;            Wait(0.05)
;        EndWhile
;        
;        Wait(2)
;        Coin.Disable()
;        Coin.Delete()
;        Coin = None
;        If HeadsOrTails == 1
;            Debug.MessageBox("Tails. You start.")
;            OpponentsTurn = False
;            PlayerStarts = True
;        Else 
;            TT_OpponentStartsMsg.Show()
;            ;OpponentPlacesCard()
;            ;PlayerStarts = False
;        Endif
;    Endif
;    
;EndFunction


;Event OnKeyDown(Int keyCode)
;    Debug.Notification("Key Down")
;    TestScoreDisplay()
;EndEvent
;
;Int TestScore = 0
;
;Function TestScoreDisplay()
;    Int Previous = TestScore - 1
;    If Previous == -1
;        Previous = 10
;    Endif
;    
;    TT_PlayerNumbers[Previous].Disable()
;    TT_OpponentNumbers[Previous].Disable()
;    
;    TT_PlayerNumbers[TestScore].Enable()
;    TT_OpponentNumbers[TestScore].Enable()
;    
;    TestScore += 1
;    If TestScore > 10
;        TestScore = 0
;    Endif 
;    
;EndFunction 

;Bool PlaceCardsTest = false
;
;Event OnKeyDown(Int keyCode) 
;    Debug.Notification("Key down")
;    If PlaceCardsTest == True
;        CoinTossTest()
;    Else 
;        PlaceCardsTest = true
;        PlaceRandomCardsForTesting()
;    Endif
;Endevent 
;
;Function PlaceRandomCardsForTesting()
;    Int M = 9 
;    While M > 0
;        M -= 1
;        MiscObject Card = TT_AllCardsMiscList.GetAt(RandomInt(0, 100)) as MiscObject
;        Bool Owner = RandomInt(0, 1) as bool 
;        PlaceCard(M, Card, Owner, false, false)
;        CardsPlaced -= 1
;        Wait(0.2)
;    EndWhile
;EndFunction
;
;Int TestPosition = 0
;
;Function CoinTossTest() 
;    
;    Bool akOwner 
;    If TT_PlayerBoardCards[TestPosition].IsEnabled()
;        akOwner = 1
;    Else 
;        akOwner = 0
;    Endif 
;    Wait(0.1)
;    If TestPosition == 0
;        FlipCardFromCoinToss(TT_0_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 1
;        FlipCardFromCoinToss(TT_1_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 2
;        FlipCardFromCoinToss(TT_2_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 3
;        FlipCardFromCoinToss(TT_3_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 4
;        FlipCardFromCoinToss(TT_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 5
;        FlipCardFromCoinToss(TT_5_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 6
;        FlipCardFromCoinToss(TT_6_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 7
;        FlipCardFromCoinToss(TT_7_CoinFlipPositions, akOwner, TestPosition) 
;    Elseif  TestPosition == 8
;        FlipCardFromCoinToss(TT_8_CoinFlipPositions, akOwner, TestPosition) 
;    Endif    
;    
;    TestPosition += 1
;    If TestPosition >= 9
;        ;Rule_Combo = !Rule_Combo
;        PlaceCardsTest = False
;        Testposition = 0
;        Wait(3)
;        ClearBoard()
;    Endif
;EndFunction

;Event OnKeyDown(Int keyCode)
;    Actor akActor = ConsoleUtil.GetSelectedReference() as Actor 
;    If akActor.GetItemCount(TT_AllCardsMiscList) == 0 ;for testing
;        AddRandomCardsToRef(akActor, 10)
;    Endif
;        
;    If PlayerRef.GetItemCount(Gold001) < 5000
;        PlayerRef.AddItem(Gold001, 5000)
;    Endif
;    TradeCards(akActor)
;EndEvent
