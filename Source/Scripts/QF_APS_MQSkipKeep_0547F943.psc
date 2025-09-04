;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_APS_MQSkipKeep_0547F943 Extends Quest Hidden

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
HelgenDialogue.SkipKeepEntrance(true)


SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property SplitMsg  Auto  

Quest Property HadvarPath  Auto  

Quest Property RalofPath  Auto  

APMessengerUtil Property HelgenDialogue  Auto  
