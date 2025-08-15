#Requires AutoHotkey v2.0
#Warn All, StdOut
#SingleInstance

#Include "C:\Users\Admin\Documents\Hotkeys\includes\GlobalHelpers.ahk"

*RControl::+F10
+RButton::+F10

!Left:: SendInput "{Home}"
!Right:: SendInput "{End}"
+!Left:: SendInput "+{Home}"
+!Right:: SendInput "+{End}"

!WheelUp:: SendInput "{Up}"
!WheelDown:: SendInput "{Down}"
+!WheelUp:: SendInput "+{Up}"
+!WheelDown:: SendInput "+{Down}"
+WheelUp:: SendInput "{Left}"
+WheelDown:: SendInput "{Right}"

!LButton:: SendInput "{Enter}"
!RButton:: SendInput "{BS}"