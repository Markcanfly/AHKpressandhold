#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Fire_Hotkey() { ; determines from the combination pressed and the array which char should be sent
    
    global accent_versions
    key := SubStr(A_ThisHotkey, 2, 1)
    num := SubStr(A_ThisHotkey, 6, 1)
    chars := accent_versions[key]
    char := SubStr(chars, num, 1)
    Send {BackSpace}
    Send % char

}


Add_Hotkeys(key, len) { ; We add the hotkeys so that they target the Fire_Hotkey function

    Loop %len% {
        hotkeyname = ~%key% & %A_Index%
        Hotkey, %hotkeyname%, Fire_Hotkey
    }

}

IniRead, section, config.ini, lowercase ; get data from config

lines := StrSplit(section, "`n")

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
    len := StrLen(chars)
    Add_Hotkeys(key, len)

}
