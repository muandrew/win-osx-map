#IfWinActive ahk_exe mintty.exe

#c::
    Send ^{Ins}
    return
#v::
    Send +{Ins}
    return

#IfWinActive