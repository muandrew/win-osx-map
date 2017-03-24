;==========
; Intellij & Android Studio
;==========

#IfWinActive ahk_group idea_grp

#,::
	Send ^!s
    return
; find class
#o::
	Send ^n
    return
; find file
#+o::
	Send ^+n
    return

; find action
#+a::
    Send ^+a
    return

; close tab
#w::
	Send ^{f4}
	return

#/::
	Send ^/
	return

#IfWinActive