﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Set Repeat and Slow Keys in Ease of Access Center to slow down keyboard repeat rates 
; to allow for more time for the second keypress

; The ~ modifier symbol makes it so that the system still receives the information of an e being presed
; Then it can delete the last character and paste the accurate new one

; e

~e & 1::
Send, {BackSpace}
Send, è 

return

~e & 2::
Send, {BackSpace}
Send, é

return

~e & 3::
Send, {BackSpace}
Send, ê

return

~e & 4::
Send, {BackSpace}
Send, ë

return

~e & 5::
Send, {BackSpace}
Send, ē

return

~e & 6::
Send, {BackSpace}
Send, ė

return

~e & 7::
Send, {BackSpace}
Send, ę

return