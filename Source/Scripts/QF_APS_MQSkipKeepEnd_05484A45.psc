;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_APS_MQSkipKeepEnd_05484A45 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int choice = SplitMsg.Show()

APMQ101Controller.destroyHelgen()
MQ101.SetStage(200) ; 210 for imperials, 220 for stormcloaks
MQ101.SetStage(200 + choice * 10) ; 210 for imperials, 220 for stormcloaks
MQ101.SetStage(250)
MQ101.SetStage(500)
MQ101.SetStage(550)
MQ101.SetStage(700)
MQ101.SetStage(710)
MQ101.SetStage(720)
MQ101.SetStage(725)

Actor player = Game.GetPlayer()
player.MoveTo(playerTpMarker)

Utility.Wait(0.1) ; Wait for load screen

Actor companion
if (choice == 1)
companion = (MQ101 as QF_MQ101_0003372B_new).Alias_Hadvar.GetActorReference()
else
companion = (MQ101 as QF_MQ101_0003372B_new).Alias_Ralof.GetActorReference()
endif
companion.MoveTo(companionTpMarker)
companion.Enable()
companion.EvaluatePackage()

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property SplitMsg  Auto  

Quest Property HadvarPath  Auto  

Quest Property RalofPath  Auto  

APMessengerUtil Property HelgenDialogue  Auto  

Quest Property MQ101  Auto  

ObjectReference Property playerTpMarker  Auto  

ObjectReference Property companionTpMarker  Auto  
