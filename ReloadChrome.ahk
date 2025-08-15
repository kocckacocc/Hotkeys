#Requires AutoHotkey v2.0
#Warn All, StdOut
#SingleInstance

#Include 'C:\Users\Admin\Documents\Hotkeys\includes\GlobalHelpers.ahk'

FocusTo := true

+!s:: {

    Send '^s'

    ThisID := WinGetID('A')
    ProcessName := WinGetProcessName('ahk_id ' ThisID)

    sleep 1000

    if WinExist('Test') {
        if FocusTo {
            WinActivate
            Send('{Browser_Refresh}')
            WinActivate 'ahk_id ' ThisID
        } else {
            WinSetTransparent 0
            WinActivate
            Send('{Browser_Refresh}')
            WinMoveBottom
            WinSetTransparent ''
            WinActivate 'ahk_id ' ThisID
        }
    }

}