#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Add_Hotkey(key, chars) {
    
}

IniRead, section, config.ini, lowercase

lines := StrSplit(section, "`n") ; split

section_keys := []

For index, line in lines {

    section_keys.Push(SubStr(line, 1, 1)) ; extract each key (the first chars)

}
Sleep, 1000
For index, key in section_keys {

    IniRead, chars, config.ini, lowercase, %key%
    chars_clean := StrReplace(chars, " ") ; remove spaces
    chars_array := StrSplit(chars, ",")
    Add_Hotkey(key, chars_array)

}
