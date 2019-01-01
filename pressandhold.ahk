#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Fire_Hotkey() {

}


Add_Hotkeys(key, chars) {
    For index, char in chars {
        
    }
}

IniRead, section, config.ini, lowercase

lines := StrSplit(section, "`n") ; split

section_keys := []
accent_versions := {}

For index, line in lines {

    section_keys.Push(SubStr(line, 1, 1)) ; extract each key (the first chars)

}
;Sleep, 1000 ; !REMOVE AFTER DEBUGGING!
For index, key in section_keys {
    IniRead, chars, config.ini, lowercase, %key%
    chars := StrReplace(chars, " ") ; remove spaces
    chars := StrReplace(chars, ",") ; remove commas
    accent_versions[key] := chars
    Add_Hotkeys(key, chars)
}
