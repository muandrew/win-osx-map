#IfWinActive ahk_exe mintty.exe

#c::
    Send ^{Ins}
    return
#p::
    Send +{Ins}
    return

#IfWinActive