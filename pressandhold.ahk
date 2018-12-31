#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; We want to get the keys from the ini

IniRead, section, config.ini, lowercase
lines := StrSplit(section, "`n")

section_keys := []

For index, line in lines {
    section_keys.Push(SubStr(line, 1, 1)) ; append the first char, which is the key
}
