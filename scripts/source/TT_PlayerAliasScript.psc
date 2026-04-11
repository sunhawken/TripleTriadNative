Scriptname TT_PlayerAliasScript extends ReferenceAlias 

TT_Skyrim_QuestScript Property TT_Script Auto 
Formlist Property TT_PlayersCurrentCards Auto 
Formlist Property TT_CardLevelsLists Auto ;Formlist of the 10 card levels lists
Formlist Property TT_UniqueCards Auto ;Unique character cards
Formlist Property TT_UniqueCardsB Auto ;Unique character cards
Formlist Property TT_UniqueCardsC Auto ;Tracks unique cards the player recieves
Formlist Property TT_UniqueModCards Auto
Formlist property TT_AllModCardsMiscList Auto
Formlist Property TT_AllCardsMiscList Auto ;all Misc player cards
Formlist Property TT_CardPackSavesList Auto ;Stores ObjectReference cards
formlist Property TT_AllMiscCardBuySellList Auto ;used with the TT_BuySellCardsFaction vendor faction

Spell Property TT_GunbladeAbility Auto 
Weapon Property TT_Gunblade Auto

Actor Property PlayerRef Auto 
ObjectReference Property TT_PlayerCardsChest Auto ;contains the cards the player currently has
ObjectReference Property TT_WinnerChestA Auto ;
ReferenceAlias Property TT_CardToGet Auto
Book Property TT_RuleBook auto
Message Property TT_SetRulesConfirm Auto 

Actor Property TT_FaelanRef Auto
Quest Property TT_FaelanStartQuest Auto

GlobalVariable Property TT_Flips Auto
MiscObject Property TT_BoardMisc Auto 
Light Property TT_BoardTorch Auto
MiscObject Property TT_CardPack Auto 
MiscObject Property TT_NPCCardPack Auto
MiscObject Property TT_CardPackSaves Auto ;Stores 5 cards to open later on ObjectReference
Light Property TT_NPCCardPackTorch Auto
Light Property TT_CardPackTorch Auto

ReferenceAlias Property TT_DisplayBookCardsAlias Auto ;the card tracker book alias
;Armor CurrentCurraiss

Event OnInit()
    AddInventoryEventFilter(TT_AllCardsMiscList)
    AddInventoryEventFilter(TT_AllModCardsMiscList)
    AddInventoryEventFilter(TT_BoardMisc)
    AddInventoryEventFilter(TT_CardPack)
    AddInventoryEventFilter(TT_CardPackTorch)
    AddInventoryEventFilter(TT_NPCCardPack)
    AddInventoryEventFilter(TT_NPCCardPackTorch)
    
    OnPlayerLoadGame() 
    ;Utility.Wait(1)
    ;Debug.MessageBox("TT Player Alias init")
    ;RegisterForKey(42) ;l shift 
    ;RegisterForKey(56) ;L alt
EndEvent 

Event OnPlayerLoadGame() 
    
    AddInventoryEventFilter(TT_AllCardsMiscList)
    AddInventoryEventFilter(TT_AllModCardsMiscList)
    AddInventoryEventFilter(TT_BoardMisc)
    AddInventoryEventFilter(TT_CardPack)
    AddInventoryEventFilter(TT_CardPackTorch)
    AddInventoryEventFilter(TT_NPCCardPack)
    AddInventoryEventFilter(TT_NPCCardPackTorch)
   
    TT_Script.SetCardTrackerBookDisplays() 
    
    Int UniqueCardCount = (PlayerRef.GetItemCount(TT_UniqueCards) + TT_PlayerCardsChest.GetItemCount(TT_UniqueCards) \
    + PlayerRef.GetItemCount(TT_UniqueModCards) + TT_PlayerCardsChest.GetItemCount(TT_UniqueModCards))

    If UniqueCardCount >= 5 && TT_PlayersCurrentCards.GetSize() >= 20 && TT_FaelanStartQuest.IsRunning() == False
       TT_FaelanStartQuest.Start() 
    Endif
   
    ;Debug.messageBox("Mod card list size = " + TT_AllModCardsMiscList.GetSize() + \
    ;"\n" + TT_AllModCardsMiscList.GetAt(100).GetName())

    ;RegisterForKey(56) ;L alt
    ;Utility.Wait(1)
    ;TT_FaelanRef.MoveTo(PlayerRef)
EndEvent

;Event OnKeyDown(Int keyCode)
;    Debug.MessageBox("Number of cell Items = " + TT_WinnerChestA.GetParentCell().GetNumRefs())
;EndEvent

;Event OnKeyDown(Int keyCode) 
;    Debug.MessageBox("Av = " + PlayerRef.GetAv("SpeedMult") + "\n BaseAv = " + PlayerRef.GetBaseAv("SpeedMult"))
;    
;    ;TT_FaelanRef.EvaluatePackage()
;EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    If akBaseItem == TT_BoardMisc
        PlayerRef.RemoveItem(TT_BoardMisc, aiItemCount, true)
        PlayerRef.AddItem(TT_BoardTorch, aiItemCount, true) 
    Elseif akBaseItem == TT_CardPack && TT_Script.VendorCardPackAuto == False
        PlayerRef.RemoveItem(TT_CardPack, aiItemCount, true)
        PlayerRef.AddItem(TT_CardPackTorch, aiItemCount, true) 
;TOP Included by TTTT_v1
    Elseif akBaseItem == TT_NPCCardPack && !TT_Script.NPCCardPackAuto
        PlayerRef.RemoveItem(TT_NPCCardPack, aiItemCount, true)
        PlayerRef.AddItem(TT_NPCCardPackTorch, aiItemCount, true) 
    Endif
;END Included by TTTT_v1
    If TT_UniqueCardsB.HasForm(akBaseItem) || TT_UniqueModCards.HasForm(akBaseItem)
       
        TT_UniqueCardsB.RemoveAddedForm(akBaseItem)
        If TT_Script.NPCBossCards == True
            Int GoldValue = akBaseItem.GetGoldValue()
            Int Index = 9
            If GoldValue == 80 
                Index = 7
            Elseif GoldValue == 90 
                Index = 8
            Endif
            
            (TT_CardLevelsLists.GetAt(Index) as FormList).AddForm(akBaseItem)
        Endif 
        
        TT_UniqueCardsC.AddForm(akBaseItem)
    Endif 
    
    If TT_Script.GiftMenuOpen == True && akSourceContainer == TT_Script.Opponent
       TT_Script.CardsTaken += 1
       If TT_Script.CardsTaken >= TT_Script.WinnerCardAmount
           Game.DisablePlayerControls()
           Game.EnablePlayerControls()
           Int M = 5
           While M > 0
               M -= 1
               TT_Script.Opponent.RemoveItem(TT_Script.TT_OpponentCards.GetAt(M), 100)
           Endwhile 
       Endif
       
    Endif
   
    If TT_AllCardsMiscList.HasForm(akBaseItem) || TT_AllModCardsMiscList.HasForm(akBaseItem)
        ;Debug.Notification("Card added")
        If TT_Script.TransferCards == True && akSourceContainer != TT_PlayerCardsChest \
        && PlayerRef.GetItemCount(TT_BoardTorch) > 0
            ;Debug.Notification("Tranfer Card")
            PlayerRef.RemoveItem(akBaseItem, aiItemCount, True, TT_PlayerCardsChest) 
        Endif 
    EndIf
   
 
    If akBaseItem == TT_NPCCardPack || akBaseItem == TT_NPCCardPackTorch
        ConvertPackToCards(akSourceContainer as Actor, aiItemCount)
        
    Elseif akBaseItem == TT_CardPack || akBaseItem == TT_CardPackTorch
        If TT_Script.VendorCardPackAuto == True
            Int Index = 0 
            While Index < aiItemCount
                Index += 1
                PlayerRef.UnEquipItem(TT_CardPackTorch, false, true)
                
                MiscObject[] TT_CardPackArray = New MiscObject[22]
                
                Int I = 0
                Int MaxCards = GetMaxCards(True); Included by TTTT_v1
               
                While I < MaxCards
                    If I == 0
                        Float R = Utility.RandomInt(0, 100) 
                        If R < 5
                            TT_CardPackArray[I] = FindRandomCardRare()
                        Elseif R <= 15
                            TT_CardPackArray[I] = FindRandomCardUncommon()
                        Else 
                            TT_CardPackArray[I] = FindRandomCard()
                        Endif
                        I += 1
                        
                    Elseif I == 1
                        Float R = Utility.RandomInt(0, 100) 
                        if R <= 15
                            MiscObject RandomCard = FindRandomCardUncommon()
                            If TT_CardPackArray.Find(RandomCard) == -1 
                                ;Utility.Wait(0.1)
                                TT_CardPackArray[I] = RandomCard
                                I += 1
                            Endif 
                        Else 
                            MiscObject RandomCard = FindRandomCard()
                            If TT_CardPackArray.Find(RandomCard) == -1 
                                ;Utility.Wait(0.1)
                                TT_CardPackArray[I] = RandomCard
                                I += 1
                            Endif 
                        Endif 
                    Else
                        MiscObject RandomCard = FindRandomCard()
                        ;If TT_CardPackArray.Find(RandomCard) == -1 
                            
                            ;Utility.Wait(0.1)
                            TT_CardPackArray[I] = RandomCard
                            I += 1
                            
                        ;Endif
                    Endif 
                EndWhile
                
                While MaxCards > 0
                    MaxCards -= 1
                    PlayerRef.AddItem(TT_CardPackArray[MaxCards], 1)
                EndWhile 
                
                PlayerRef.RemoveItem(TT_CardPack, 1, True)
                PlayerRef.RemoveItem(TT_CardPackTorch, 1, true)
            Endwhile
        Endif
    Endif
EndEvent 

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    ;Debug.Notification("TT Object Equipped")
    If akBaseObject == TT_BoardTorch || akBaseObject == TT_BoardMisc
        PlayerRef.UnEquipItem(TT_BoardTorch, false, true)
        Game.DisablePlayerControls()
        Utility.Wait(0.1)
        Game.EnablePlayerControls()
        Utility.Wait(0.1)
        PlayerRef.UnEquipItem(TT_BoardTorch, false, true)
        
        TT_PlayerCardsChest.Activate(PlayerRef)
        
    Elseif akBaseObject == TT_CardPack || akBaseObject == TT_CardPackTorch
        PlayerRef.UnEquipItem(TT_CardPackTorch, false, true)
        ;Debug.Notification("Card pack equipped")
        Game.DisablePlayerControls()
        ;Utility.Wait(0.5)
        Game.EnablePlayerControls()
        PlayerRef.UnEquipItem(TT_CardPackTorch, false, true)
        
        TT_WinnerChestA.RemoveAllItems()
        MiscObject[] TT_CardPackArray = New MiscObject[22]
        
        Int MaxCards = GetMaxCards(True); Included by TTTT_v1
        
        Int I = 0
        While I < MaxCards
            If I == 0
                Float R = Utility.RandomInt(0, 100) 
                If R < 5
                    TT_CardPackArray[I] = FindRandomCardRare()
                Elseif R <= 15
                    TT_CardPackArray[I] = FindRandomCardUncommon()
                Else 
                    TT_CardPackArray[I] = FindRandomCard()
                Endif
                I += 1
                
            Elseif I == 1
                Float R = Utility.RandomInt(0, 100) 
                if R <= 15
                    MiscObject RandomCard = FindRandomCardUncommon()
                    If TT_CardPackArray.Find(RandomCard) == -1 
                        ;Utility.Wait(0.1)
                        TT_CardPackArray[I] = RandomCard
                        I += 1
                    Endif 
                Else 
                    MiscObject RandomCard = FindRandomCard()
                    If TT_CardPackArray.Find(RandomCard) == -1 
                        ;Utility.Wait(0.1)
                        TT_CardPackArray[I] = RandomCard
                        I += 1
                    Endif 
                Endif 
            Else
                MiscObject RandomCard = FindRandomCard()
                ;If TT_CardPackArray.Find(RandomCard) == -1 
                    ;Utility.Wait(0.1)
                    TT_CardPackArray[I] = RandomCard
                    I += 1
                ;Endif
            Endif 
        EndWhile
        
        While MaxCards > 0
            MaxCards -= 1
            TT_WinnerChestA.AddItem(TT_CardPackArray[MaxCards], 1)
        EndWhile 
        
        Utility.Wait(0.5)
        TT_WinnerChestA.Activate(PlayerRef)
        PlayerRef.RemoveItem(TT_CardPack, 1, True)
        PlayerRef.RemoveItem(TT_CardPackTorch, 1, true)
        
    Elseif akBaseObject == TT_NPCCardPack || akBaseObject == TT_NPCCardPackTorch
        PlayerRef.UnEquipItem(TT_NPCCardPackTorch, false, true)
        ;Debug.Notification("Card pack equipped")
        Game.DisablePlayerControls()
        ;Utility.Wait(0.5)
        Game.EnablePlayerControls()
        PlayerRef.UnEquipItem(TT_NPCCardPackTorch, false, true)
        TT_WinnerChestA.RemoveAllItems()
        MiscObject[] TT_CardPackArray
        
        If TT_CardPackSavesList.GetSize() == 0
            ConvertPackToCards(None, 1)
            Int WaitAmount = 0
            While WaitAmount < 50
                Int R = Utility.RandomInt(0, 100)
                WaitAmount += 1
                ;wait a random amount 
            EndWhile
        EndIf
    
        ObjectReference TT_CardPackSave = TT_CardPackSavesList.GetAt(0) as ObjectReference
        TT_CardPackSavesScript SavesScript = TT_CardPackSave as TT_CardPackSavesScript
        Int M = SavesScript.Cards.Find(None)
        While M > 0
            M -= 1
            TT_WinnerChestA.AddItem(SavesScript.Cards[M], 1)
        EndWhile 
        Utility.Wait(0.5)
        TT_WinnerChestA.Activate(PlayerRef)
        SavesScript.Cards = None 
        TT_CardPackSavesList.RemoveAddedForm(TT_CardPackSave)
        TT_CardPackSave.Disable()
        TT_CardPackSave.Delete() 
        PlayerRef.RemoveItem(TT_NPCCardPack, 1, True)
        PlayerRef.RemoveItem(TT_NPCCardPackTorch, 1, true)
        
    ElseIf akBaseObject == TT_RuleBook 
        ;Debug.Notification("TT Info Equipped")
        If TT_SetRulesConfirm.Show() == 0 
            Game.DisablePlayerControls()
            Game.EnablePlayerControls()
            TT_Script.SetPlayerRulesDisplay()
            Utility.Wait(0.5)
            TT_Script.SetRules()
        Endif 
    Elseif akBaseObject == TT_Gunblade
        PlayerRef.AddSpell(TT_GunbladeAbility, false) 
    Endif 
EndEvent
    
Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    If akBaseObject == TT_Gunblade
        If PlayerRef.GetEquippedWeapon() != TT_Gunblade && PlayerRef.GetEquippedWeapon(True) != TT_GunBlade
            PlayerRef.RemoveSpell(TT_GunbladeAbility)
        Endif 
    Endif 
EndEvent
;TOP Included by TTTT_v1
Int Function GetMaxCards(Bool isSealed = False)
    Int MaxCards
    If TT_Script.CardPackMinCards == TT_Script.CardPackMaxCards || isSealed
        MaxCards = TT_Script.CardPackMaxCards
    Else 
        MaxCards = Utility.RandomInt(TT_Script.CardPackMinCards, TT_Script.CardPackMaxCards) 
    Endif 
;END Included by TTTT_v1
    If MaxCards > 20 ;failsafe, this shouldn't happen
        MaxCards = 20
    Endif 
    
    Return MaxCards
EndFunction

MiscObject Function FindRandomCard()
    Int R = Utility.RandomInt(0, 100)
    
    if R <= 40
        Formlist List1 = TT_CardLevelsLists.GetAt(1) As formlist 
        Int Max = (List1.GetSize() - 1)
        Return List1.GetAt(Utility.RandomInt(0, Max)) as MiscObject
    
    Else
        Formlist List0 = TT_CardLevelsLists.GetAt(0) As formlist 
        Int Max = (List0.GetSize() - 1)
        Return List0.GetAt(Utility.RandomInt(0, Max)) as MiscObject
    Endif

EndFunction
    
MiscObject Function FindRandomCardUncommon()
    Int R = Utility.RandomInt(0, 100)
    
    If R <= 20
        Formlist List4 = TT_CardLevelsLists.GetAt(4) As formlist 
        Int Max = (List4.GetSize() - 1)
        Return List4.GetAt(Utility.RandomInt(0, Max)) as MiscObject
        
    Elseif R <= 40
        Formlist List3 = TT_CardLevelsLists.GetAt(3) As formlist 
        Int Max = (List3.GetSize() - 1)
        Return List3.GetAt(Utility.RandomInt(0, Max)) as MiscObject
        
    Else
        Formlist List2 = TT_CardLevelsLists.GetAt(2) As formlist 
        Int Max = (List2.GetSize() - 1)
        Return List2.GetAt(Utility.RandomInt(0, Max)) as MiscObject
    
    Endif

EndFunction

MiscObject Function FindRandomCardRare()
  
    Int R = Utility.RandomInt(0, 100)
        
    If R <= 15
        formlist List7 = TT_CardLevelsLists.GetAt(7) As formlist 
        Int Max = List7.GetSize() - 1
        Return List7.GetAt(Utility.RandomInt(0, Max)) as MiscObject
    Elseif R <= 35
        Formlist List6 = TT_CardLevelsLists.GetAt(6) As formlist 
        Int Max = (List6.GetSize() - 1)
        Return List6.GetAt(Utility.RandomInt(0, Max)) as MiscObject   
    Else
        Formlist List5 = TT_CardLevelsLists.GetAt(5) As formlist 
        Int Max = (List5.GetSize() - 1)
        Return List5.GetAt(Utility.RandomInt(0, Max)) as MiscObject
    Endif
EndFunction  

Function CheckAndAddUniqueCardsToLists() 
    Formlist List7 = TT_CardLevelsLists.GetAt(7) as Formlist 
    Formlist List8 = TT_CardLevelsLists.GetAt(8) as Formlist 
    Formlist List9 = TT_CardLevelsLists.GetAt(9) as Formlist 
    
    If MQPaarthurnax.IsCompleted()
       Form PaarthurnaxCard = TT_UniqueCards.GetAt(23)
       If List9.HasForm(PaarthurnaxCard) == False 
           List9.AddForm(PaarthurnaxCard)
       Endif 
    Endif 


    If MQ305.IsCompleted()
       Form AlduinCard = TT_UniqueCards.GetAt(1)
       If List9.HasForm(AlduinCard) == False 
           List9.AddForm(AlduinCard)
       Endif 
    Endif 

    If DLC2Mq06.IsCompleted() 
       Form MiraakCard = TT_UniqueCards.GetAt(22)
       If List9.HasForm(MiraakCard) == False 
           List9.AddForm(MiraakCard)
       Endif
    Endif

    If DLC2dunKarstaagQST.GetStageDone(20) == true 
       Form KarstaagCard = TT_UniqueCards.GetAt(18)
       If List9.HasForm(KarstaagCard) == False 
           List9.AddForm(KarstaagCard)
       Endif
    Endif

    If DA15.IsCompleted() 
       Form SheogorathCard = TT_UniqueCards.GetAt(3)
       If List7.HasForm(SheogorathCard) == False 
           List7.AddForm(SheogorathCard)
       Endif 
    Endif

    If DLC2EbonyWarriorQuest.IsCompleted() 
       Form EbonyWarriorCard = TT_UniqueCards.GetAt(21)
       If List9.HasForm(EbonyWarriorCard) == False 
           List9.AddForm(EbonyWarriorCard)
       Endif 
    Endif

    Int M = TT_UniqueCardsDeadCheck.GetSize()
    While M > 0
        M -= 1
        Actor CurrentActor = TT_UniqueCardsActorsDeadCheck.GetAt(M) as Actor 
        If CurrentActor.IsDead() 
            Form Card = TT_UniqueCardsDeadCheck.GetAt(M) 
            Int CardValue = Card.GetGoldValue()
            Formlist CardList 
            If CardValue == 80
                CardList = TT_CardLevelsLists.GetAt(7) as Formlist
            Elseif CardValue == 90
                CardList = TT_CardLevelsLists.GetAt(8) as Formlist
            Else
                CardList = TT_CardLevelsLists.GetAt(9) as Formlist
            Endif
            
            If CardList.HasForm(Card) == false 
               CardList.AddForm(Card)
            Endif 
        Endif 
    EndWhile
EndFunction

Quest Property DLC2Mq06 Auto
Quest property MQ305 Auto
Quest Property DLC2dunKarstaagQST Auto 
Quest Property DA15 Auto 
Quest Property DLC2EbonyWarriorQuest Auto
Quest Property MQPaarthurnax Auto
Formlist Property TT_UniqueCardsDeadCheck Auto
Formlist Property TT_UniqueCardsActorsDeadCheck Auto

Function ConvertPackToCards(Actor PreviousHolder, Int akCount) 
    If TT_Script.NPCCardPackAuto == False
        ;Debug.Notification("Convert Pack To Cards")
        Int Count = (PlayerRef.GetItemCount(TT_NPCCardPack) + PlayerRef.GetItemCount(TT_NPCCardPackTorch)) - TT_CardPackSavesList.GetSize()   
        Int I = 0
        While I < Count
            I += 1
            
            ObjectReference TT_CardPackSave = TT_WinnerChestA.PlaceAtMe(TT_CardPackSaves, 1, 1, 0)
            
            Int Level
            
            If PreviousHolder != none
                Level = PreviousHolder.GetLevel()
            Else 
                Level = PlayerRef.GetLevel()
            Endif 
            
            Int MaxList 
            If Level <= 10
                MaxList = 1
            Elseif Level <= 15
                MaxList = 2
            Elseif Level <= 20
                MaxList = 3
            Elseif Level <= 25
                MaxList = 4
            Else
                MaxList = 5
            Endif
            
            TT_CardPackSavesScript SavesScript = TT_CardPackSave as TT_CardPackSavesScript
            SavesScript.InitArray() ;initialize array on cardpack save 
            
            Int CardAmount = GetMaxCards()
            Int II = 0
            While II < CardAmount
                Formlist CurrentCardList = TT_CardLevelsLists.GetAt(Utility.RandomInt(0, MaxList)) As Formlist 
                Int Max = (CurrentCardList.GetSize() - 1)
                MiscObject Card = CurrentCardList.GetAt(Utility.RandomInt(0, Max)) as MiscObject
                SavesScript.Cards[II] = Card
                II += 1
            EndWhile 
            TT_CardPackSavesList.AddForm(TT_CardPackSave)
        Endwhile
    Else 
        Int Count = akCount 
        Int I = 0
        While I < Count
            I += 1
            
            Int Level
            
            If PreviousHolder != none
                Level = PreviousHolder.GetLevel()
            Else 
                Level = PlayerRef.GetLevel()
            Endif 
            
            Int MaxList 
            If Level <= 10
                MaxList = 1
            Elseif Level <= 15
                MaxList = 2
            Elseif Level <= 20
                MaxList = 3
            Elseif Level <= 25
                MaxList = 4
            Else
                MaxList = 5
            Endif
           
            Int CardAmount = GetMaxCards()
            Int II = 0
            While II < CardAmount
                Formlist CurrentCardList = TT_CardLevelsLists.GetAt(Utility.RandomInt(0, MaxList)) As Formlist 
                Int Max = (CurrentCardList.GetSize() - 1)
                MiscObject Card = CurrentCardList.GetAt(Utility.RandomInt(0, Max)) as MiscObject
                PlayerRef.AddItem(Card)
                II += 1
            EndWhile 
            PlayerRef.RemoveItem(TT_NPCCardPack, 1, true)
            PlayerRef.RemoveItem(TT_NPCCardPackTorch, 1, true)
        Endwhile
    Endif
EndFunction 

;ReferenceAlias[] Property TT_DisplayBookCardAliasArray Auto ;alias's display as checked [X] in book if they have the card. 

;Formlist Property TT_AllCardsMiscList Auto ;all Misc player cards
;Actor Property PlayerRef Auto 
;ObjectReference Property TT_PlayerCardsChest Auto ;contains the cards the player currently has
;ObjectReference Property TT_CheckedRef Auto 
;ObjectReference Property TT_UnCheckedRef Auto
 
;Function PrintBookAliasNames() ;prints out names and alias's for the card tracker book.
;    Formlist CardsByValue = TT_Script.TT_AllCardsMiscListByValue
;    Int GoldValue = CardsByValue.GetAt(0).GetGoldValue() 
;    Bool BeforeOrAfter = False
;    Debug.OpenUserLog("TT_BookAliasNames")
;    String AliasNames = "<Alias=TT_BookTrackerAlias0000>"
;    Int I = 0
;    While I < 140 
;        I += 1
;        Form Card = CardsByValue.GetAt(I) 
;        String Name = Card.GetName()
;        Int CurrentValue = Card.GetGoldValue()
;        If CurrentValue != GoldValue 
;            AliasNames += "\n"
;            GoldValue = CurrentValue 
;            BeforeOrAfter = !BeforeOrAfter
;            Utility.Wait(0.1)
;        Endif 
;        
;        If BeforeOrAfter == False
;            If I < 10 
;                AliasNames += (("\n" + "<Alias=TT_BookTrackerAlias000" + I + ">") + " " + Name)
;            Elseif I < 100 
;                AliasNames += (("\n" + "<Alias=TT_BookTrackerAlias00" + I + ">") + " " + Name)
;            Else 
;                AliasNames += (("\n" + "<Alias=TT_BookTrackerAlias0" + I + ">") + " " + Name)
;            Endif 
;        Else 
;            If I < 10 
;                AliasNames += ("\n" + Name + " " + ("<Alias=TT_BookTrackerAlias000" + I + ">"))
;            Elseif I < 100 
;                AliasNames += ("\n" + Name + " " + ("<Alias=TT_BookTrackerAlias00" + I + ">"))
;            Else 
;                AliasNames += "\n" + (Name + " " + ("<Alias=TT_BookTrackerAlias0" + I + ">"))
;            Endif 
;        Endif
;    Endwhile 
;    
;    Utility.Wait(0.5) 
;    Debug.TraceUser("TT_BookAliasNames", AliasNames) 
;    Debug.Notification("Done printing alias names.")
;EndFunction

