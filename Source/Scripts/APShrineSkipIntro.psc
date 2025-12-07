Scriptname APShrineSkipIntro extends ObjectReference  

Message Property ConfirmationMsg Auto

APMessengerUtil Property MessengerUtil Auto

Event OnActivate(ObjectReference akActionRef)
    int choice = ConfirmationMsg.Show()
    If choice == 0
        return
    EndIf
    MessengerUtil.SkipKeepEntrance(true)
EndEvent
