Scriptname TT_PlayerCardsChestScript extends ObjectReference 

TT_Skyrim_QuestScript property TT_Script Auto 
Formlist Property TT_AllCardsMiscList Auto ;all Misc player cards
Formlist Property TT_PlayerCards Auto  ;empty list
Formlist Property TT_AllCardsActivatorList Auto ;all Activator player cards
Formlist Property TT_AllCardsList Auto
Formlist Property TT_PlayersCurrentCards Auto
Formlist Property TT_AllModCardsMiscList Auto
Actor Property PlayerRef Auto
GlobalVariable Property TT_PlayerCardCount Auto

Int Property CardCount = 0 Auto 

;Event OnInit()
;    Debug.MessageBox("TT Chest Script Init")
;EndEvent

Auto State GameNotActive
    ;Event OnInit()
    ;    Debug.MessageBox("TT Chest Script Init")
    ;EndEvent
        
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)    
        If TT_AllCardsMiscList.HasForm(akBaseItem) && TT_PlayersCurrentCards.HasForm(akBaseItem) == False
            TT_PlayersCurrentCards.AddForm(akBaseItem)
            Int I = TT_Script.TT_AllCardsMiscListByValue.Find(akBaseItem)
            TT_Script.TT_DisplayBookCardAliasArray[I].ForceRefTo(TT_Script.TT_CheckedRef)
            
        Elseif TT_AllModCardsMiscList.HasForm(akBaseItem) && TT_PlayersCurrentCards.HasForm(akBaseItem) == False
            TT_PlayersCurrentCards.AddForm(akBaseItem)
            
        Elseif TT_AllCardsMiscList.HasForm(akBaseItem) == False && TT_AllModCardsMiscList.HasForm(akBaseItem) == False
            Self.RemoveItem(akBaseItem, aiItemCount, true, akSourceContainer)
            TT_Script.TT_OnlyTripleTriadCardsMsg.Show()
        Endif 
    EndEvent
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        If TT_AllCardsMiscList.HasForm(akBaseItem) || TT_AllModCardsMiscList.HasForm(akBaseItem)
            If Self.GetItemCount(akBaseItem) == 0
                TT_PlayersCurrentCards.RemoveAddedForm(akBaseItem)
                Int I = TT_Script.TT_AllCardsMiscListByValue.Find(akBaseItem)
                If I > -1
                    TT_Script.TT_DisplayBookCardAliasArray[I].ForceRefTo(TT_Script.TT_UnCheckedMinusRef)
                Endif
            Endif 
        Endif
        ;Debug.Notification("Remove, game not active")
    EndEvent
EndState

State GameActive
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        ;Debug.Notification("Remove card game active " + Cardcount)
        If (akDestContainer as Actor) == PlayerRef
            If TT_AllCardsMiscList.HasForm(akBaseItem) || TT_AllModCardsMiscList.HasForm(akBaseItem)
                
                Int Index = TT_Script.TT_PlayerCardsArray.Find(akBaseItem as MiscObject)
                If Index > -1 && akBaseItem.GetGoldValue() >= 80; Excluded by TTTT_v1 >= TT_Script.CardLevelGoldValues[7]
                   
                    ;Debug.MessageBox("You can only have one of those in your hand")
                    TT_Script.TT_OnlyOneUniqueCardmsg.Show()
                    PlayerRef.RemoveItem(akBaseItem, 1, true) 
                    Self.AddItem(akBaseItem, 1)
                    
                ElseIf CardCount < 5
                    CardCount += 1 
                    Int EmptySlot = TT_Script.TT_PlayerCardsArray.Find(None)
                    MiscObject Card = akBaseItem as MiscObject
                    TT_Script.TT_PlayerCardsArray[EmptySlot] = Card
                    
                    Int CardIndex = TT_AllCardsMiscList.Find(akBaseItem) 
                    
                    If CardIndex > -1
                        TT_Script.TT_PlayerHandActivators[EmptySlot] \
                        = TT_Script.TT_PlayerHandMarkers[EmptySlot].PlaceAtMe(TT_AllCardsActivatorList.GetAt(CardIndex), 1, 0, 1)
                        
                        TT_Script.TT_PlayerHandStatics[EmptySlot] \
                        = TT_Script.TT_PlayerHandMarkersB[EmptySlot].PlaceAtMe(TT_AllCardsList.GetAt(CardIndex), 1, 0, 1)
                        TT_Script.TT_CardCountMsg.Show(CardCount as float)
                        
                    Elseif (Card as TT_Skyrim_ModCardScript)
                        TT_Script.TT_PlayerHandActivators[EmptySlot] \
                        = TT_Script.TT_PlayerHandMarkers[EmptySlot].PlaceAtMe((Card as TT_Skyrim_ModCardScript).ActivatorCard, 1, 0, 1)
                        
                        TT_Script.TT_PlayerHandStatics[EmptySlot] \
                        = TT_Script.TT_PlayerHandMarkersB[EmptySlot].PlaceAtMe((Card as TT_Skyrim_ModCardScript).StaticCard, 1, 0, 1)
                        TT_Script.TT_CardCountMsg.Show(CardCount as float)
                    Else 
                        CardCount -= 1
                        ;Debug.Notification("Card Not Recognized")
                        TT_Script.TT_CardNotRecognizedMsg.Show()
                    Endif
                Else 
                    PlayerRef.RemoveItem(akBaseItem, 1, true, Self)
                    ;Self.AddItem(akBaseItem, 1)
                    ;Debug.MessageBox("5 cards already chosen. Close the menu to continue.")
                    TT_Script.TT_5CardsChosenMsg.Show()
                Endif
                
            Endif  
        Endif
    EndEvent 
    
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)    
        If TT_AllCardsMiscList.HasForm(akBaseItem) == false && TT_AllModCardsMiscList.HasForm(akBaseItem) == False 
            Self.RemoveItem(akBaseItem, aiItemCount, true, akSourceContainer)
            ;Debug.Notification("You can only store Triple Triad cards here.")
            TT_Script.TT_OnlyTripleTriadCardsMsg.Show()
        Elseif (akSourceContainer as Actor) == PlayerRef
            Int Index = TT_Script.TT_PlayerCardsArray.Find(akBaseItem as MiscObject)
            If Index > -1
               CardCount -= 1 
               TT_Script.TT_PlayerCardsArray[Index] = none 
               
               TT_Script.TT_PlayerHandActivators[Index].Disable()
               TT_Script.TT_PlayerHandActivators[Index].Delete()
               
               TT_Script.TT_PlayerHandStatics[Index].Disable()
               TT_Script.TT_PlayerHandStatics[Index].Delete()
               
               TT_Script.TT_PlayerHandActivators[Index] = None
               TT_Script.TT_PlayerHandStatics[Index] = None
               TT_Script.TT_CardCountMsg.Show(CardCount as float)
            Endif 
        Endif
    EndEvent
EndState

State Busy 
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    EndEvent
    
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)    
    EndEvent 
EndState
