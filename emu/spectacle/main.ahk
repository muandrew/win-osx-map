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