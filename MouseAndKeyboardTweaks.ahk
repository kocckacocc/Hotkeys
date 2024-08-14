#Requires AutoHotkey v2.0
#Warn All, OutputDebug

^!r::Reload

*RControl:: +F10

; :)

+!Left:: SendInput "{Home}"
+!Right:: SendInput "{End}"

!WheelUp:: SendInput "{Up}"
+!WheelUp:: SendInput "+{Up}"

!WheelDown:: SendInput "{Down}"
+!WheelDown:: SendInput "+{Down}"

+WheelUp:: SendInput "{Left}"
+WheelDown:: SendInput "{Right}"

!LButton:: SendInput "{Enter}"
!RButton:: SendInput "{BS}"
+RButton:: +F10