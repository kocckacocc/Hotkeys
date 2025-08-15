#Requires AutoHotkey v2.0
#Warn All, StdOut
#SingleInstance

Spells := [
    "Hunter's Mark,1500,f",
    'Serpent Sting,1500,e',
    'Arcane Shot,6000,q',
]

CoolDownGuiWidth := 206
CoolDownGuiHeight := 25
CoolDownGuiXpos := A_ScreenWidth / 2 - 286
CoolDownGuiYpos := A_ScreenHeight / 2 + 340

Period := 100
DebugMode := false

WowTitle := 'World of Warcraft'
if !WinExist(WowTitle)
    ExitApp
WinActivate WowTitle

On := false
Spellkey := 1
BR := "`r`n"

CapsLock:: {

    global On
    global Count := 0
    global Spellkey := 1

    if On
        SetTimer Tick, 0

    On := true
    CoolDownGui.Show("autosize x" . CoolDownGuiXpos . " y" . CoolDownGuiYpos)
    WinActivate WowTitle

    SetTimer Tick, Period
    Tick() {
        global Count
        SpellData := StrSplit(Spells[Spellkey], ",", " `t")
        Cooldown := SpellData[2]

        if Count = 0
            Send SpellData[3]

        Count++
        Percent := 100 - Ceil((Count * Period / Cooldown) * 100)

        SpellText.Value := SpellData[1]
        CoolDownProgressBar.Value := Percent

        DebugTextU.Value :=
            "Cooldown: " . Cooldown . " ms" . BR .
            "Ellapsed: " . Count * Period . " ms" . BR .
            Percent . " %" . BR .
            SpellData[1]

        if (Count * Period >= Cooldown) {
            Count := 0
            Spellkey++

            if Spellkey > Spells.Length {
                Spellkey := 1
                SetTimer Tick, 0
                CoolDownGui.Hide()

                SpellText.Value := ""
                DebugTextU.Value := "Sucess Sequence."
            }
        }

    }

}

CoolDownGui := Gui()
CoolDownGui.MarginX := "1", CoolDownGui.MarginY := "1", CoolDownGui.BackColor := "black"
CoolDownGui.Opt("+alwaysontop -caption")
CoolDownGui.SetFont("s6 cffeb00 bold q5", "Verdana")

CoolDownProgressBar := CoolDownGui.Add("Progress", "h" . (CoolDownGuiHeight - 10) . " w" . CoolDownGuiWidth . " cred Background202124 vProgress1 -Smooth")
SpellText := CoolDownGui.Add("Text", "h10 wp BackgroundTrans")

DebugGui := Gui()
DebugGui.BackColor := "black"
DebugGui.Opt("+alwaysontop -Caption")
DebugGui.SetFont("s8 c00cc00 q5", "Fixedsys")
DebugTextU := DebugGui.Add("Text", "w400 h100", "No debug.")
DebugTextD := DebugGui.Add("Text", "w400 h100", "No debug.")
if DebugMode {
    DebugGui.Show("x" . A_ScreenWidth - 400 . " y" . A_ScreenHeight - 200 . " w400 h200")
    WinActivate WowTitle
}