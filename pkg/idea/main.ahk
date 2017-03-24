;==========
; Intellij & Android Studio
;==========

#IfWinActive ahk_group idea_grp

#,::^!s
    return
; find class
#o::^n
    return
; find file
#+o::^+n
    return

; find action
#+a::
    ^+a
    return

; close tab
#w:: send ^{f4}

#/::^/

#IfWinActive