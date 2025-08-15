#Requires AutoHotkey v2.0
#Warn All, StdOut
#SingleInstance

#+LButton::^t
#^LButton::^g
#!LButton::^b

CapsLock::^z
#CapsLock::Click "Down Right"
#CapsLock::RButton

^CapsLock::CapsLock

#+t::!t