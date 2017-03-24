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
; #Include %A_ScriptDir%\opt\media_keys\main.ahk

#Include %A_ScriptDir%\pkg\chrome\main.ahk
#Include %A_ScriptDir%\pkg\idea\main.ahk
#Include %A_ScriptDir%\pkg\mintty\main.ahk
#Include %A_ScriptDir%\pkg\sublime\main.ahk

;==========
; General
;==========

^1::
    MsgBox "Reload!"
    Reload
    return

#c::
    Send ^c
    return
#x::
    Send ^x
    return
#v::
    Send ^v
    return
#a::
    Send ^a
    return
#q::
    Send !{f4}
    return

#w::
    Send !{f4}
    return

; Don't remap for windows 7
;#Tab::!Tab

#z::
    Send ^z
    return
#+z::
    Send ^y
    return

#s::
    Send ^s
    return

;find
#f::
    Send ^f
    return
;replace
#r::
    Send ^r
    return
; spotlight
#Space::
    Send {LWin}
    return

; movement and selection
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
