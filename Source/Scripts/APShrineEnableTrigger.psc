Scriptname APShrineEnableTrigger extends ObjectReference  

ObjectReference Property ShrineExterior  Auto  

ObjectReference Property ShrineStartCell  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	; ShrineStartCell.DisableNoWait()
	; ShrineExterior.Disable()
EndEvent
