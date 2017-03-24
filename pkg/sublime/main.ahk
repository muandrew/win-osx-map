#IfWinActive ahk_exe sublime_text.exe

#p::
    Send ^p
    return
#+p::
    Send ^+p
    return
#w::
    Send ^w
    return
#/::
    Send ^/
    return

#IfWinActive