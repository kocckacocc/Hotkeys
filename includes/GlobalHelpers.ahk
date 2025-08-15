flog(params*) {
    logfile := A_ScriptDir . "\log\log.txt"
    ts := FormatTime(, "yyyy-MM-dd HH:mm:ss.") substr(A_TickCount, -3)
    for , param in params
        message .= param . " "
    FileAppend ts " " message "`n", logfile
}

~^!r:: {
    If InStr(WinGetTitle('A'), A_ScriptName)
        if MsgBox("Reload '" A_ScriptName "'?", "Reload script?", "YesNo") = "Yes"
            Reload
}

