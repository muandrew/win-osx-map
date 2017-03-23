#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ! = Alternative
; ^ = Control
; # = Windows modifier
 
; https://autohotkey.com/board/topic/21510-toaster-popups/
; https://github.com/guillemcanal/autohotkey-apple-keyboard/blob/master/AppleKeyboard.ahk

#Include %A_ScriptDir%\pkg\idea\ini.ahk

#Include %A_ScriptDir%\emu\spectacle\main.ahk
#Include %A_ScriptDir%\opt\function_keys\main.ahk
#Include %A_ScriptDir%\pkg\chrome\main.ahk
#Include %A_ScriptDir%\pkg\idea\main.ahk

;==========
; General
;==========

^r::
    MsgBox "Reload!"
    Reload
    return

#c::^c
    return
#x::^x
    return
#v::^v
    return
#q::
    send !{f4}
    return

#w::
    send !{f4}
    return

; Don't remap for windows 7
;#Tab::!Tab

#z::^z
    return
#+z::^y
    return

#s::^s
    return

;find
#f::^f
    return
;replace
#r::^r
    return

#Space::
    Send {LWin}
    return

#Up::
    Send ^{Home}
    return
#+Up::
    Send ^+{Home}
    return
#Down::
    Send ^{End}
    return
#+Down::
    Send ^+{End}
    return
#Left::
    Send {Home}
    return
#+Left::
    Send +{Home}
    return
#+Right::
    Send +{End}
    return
#Right::
    Send {End}
    return

;minimize
#m::
    WinMinimize, A
    return

; http://www.autohotkey.com/board/topic/51631-disable-windows-key-start-menu-but-not-shortcuts/
; jspenguin
~LWin Up:: return
~RWin Up:: return