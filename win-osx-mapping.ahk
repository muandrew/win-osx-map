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

;====================
; Spectacle emulator
;====================

; PatrickS
; http://autohotkey.com/board/topic/51720-windows-7-like-window-positioning-for-xp-and-vista/
;; -----------------------------------------------------------------------
; Get the position and size of the desktop, taking the taskbar area into account.
; This function probably doesn't work on secondary monitors.

Win__GetDesktopPos(ByRef X, ByRef Y, ByRef W, ByRef H)
{
    ; Get dimensions of the system tray (taskbar)
    WinGetPos, TrayX, TrayY, TrayW, TrayH, ahk_class Shell_TrayWnd
    ; disable tray sizing
    if (TrayX < 0 or TrayX > (A_ScreenWidth - 4))
    {
        TrayW := 0
    }
    if (TrayY < 0 or TrayY > (A_ScreenHeight - 4))
    {
        TrayH := 0
    }
    
    if (TrayW = A_ScreenWidth)
    {
        ; Horizontal Taskbar
        X := 0
        Y := TrayY ? 0 : TrayH
        W := A_ScreenWidth
        H := A_ScreenHeight - TrayH
    }
    else
    {
        ; Vertical Taskbar
        X := TrayX ? 0 : TrayW
        Y := 0
        W := A_ScreenWidth - TrayW
        H := A_ScreenHeight
    }
}

;; -----------------------------------------------------------------------
; Mimic Windows-7 Win-Left Key Combination

Win__HalfLeft()
{
    Win__GetDesktopPos(X, Y, W, H)
    WinMove, A,, X, Y, W/2, H
}

;; -----------------------------------------------------------------------
; Mimic Windows-7 Win-Right Key Combination

Win__HalfRight()
{   
    Win__GetDesktopPos(X, Y, W, H)
    WinMove, A,, X + W/2, Y, W/2, H
}

win__HalfUp()
{
    Win__GetDesktopPos(X, Y, W, H)
    WinMove, A,, X, Y, W, H/2
}


win__HalfDown()
{
    Win__GetDesktopPos(X, Y, W, H)
    WinMove, A,, X, Y + H/2, W, H/2
}

Win__FullSize()
{   
   Win__GetDesktopPos(X, Y, W, H)
   WinMove, A,, X, Y, W, H
}

GroupAdd, grp_t, ahk_exe sublime_text.exe
GroupAdd, grp_t, ahk_exe notepad.exe

;; -----------------------------------------------------------------------
; Use the Alt-Left and Alt-Right key combinations to simulate
; Win-7's Win-Left and Win-Right key functions.
!#Up::
    Win__HalfUp()
    return
!#Down::
    Win__HalfDown()
    return
!#Left::
    Win__HalfLeft()
    return
!#Right::
    Win__HalfRight()
    return
!#f::
    Win__FullSize()
    return

;==========
; Chrome
;==========

#IfWinActive ahk_exe chrome.exe

#l::^l
    return

#IfWinActive

;==========
; Intellij & Android Studioo
;==========o


#IfWinActive ahk_group grp_t
#o::
    MsgBox "b"
    return
#IfWinActive

#IfWinActive ahk_exe idea.exe
;#IfWinActive ahk_exe studio.exe

#,::^!s
    return

#o::^n
#+o::^+n

; find action
#+a::^+a

; close tab
#w:: send ^{f4}

#/::^/

#IfWinActive

;==========
; General
;==========

~^s::
if WinActive("C:\Documents and Settings\Admin\Desktop\osx-mapping.ahk - Sublime Text (UNREGISTERED)") {
    Reload
}
if WinActive("win7-osx-mapping - Notepad") {
    MsgBox "Reload!"
    Reload
}
return

f11::#d

#c::^c
    return
#x::^x
    return
#v::^v
    return
#q:: send !{f4}

#w:: send !{f4}

; Don't remap for windows 7
;#Tab::!Tab

#z::^z
    return
#+z::^y
    return

#s::^s
    return

;find
#f::
    ^f
    return
;replace
#r::
    ^r
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