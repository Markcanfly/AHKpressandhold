#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Tip, PressAndHold

Fire_Hotkey() { ; determines from the combination pressed and the array which char should be sent
    
    global lowercase_accent_versions
    global uppercase_accent_versions

    ;acquire data
    key := SubStr(A_ThisHotkey, 2, 1)
    num := SubStr(A_ThisHotkey, 6, 1)

    lowercase_chars := lowercase_accent_versions[key]
    lowercase_char := SubStr(lowercase_chars, num, 1)

    uppercase_chars := uppercase_accent_versions[key]
    uppercase_char := SubStr(uppercase_chars, num, 1)
    
    ;send data
    Send, {BackSpace}
    if (GetKeyState("Shift", "P")) {
        Send, % uppercase_char
    } else {
        Send, % lowercase_char
    }

}


Add_Hotkeys(key, len) { ; We add the hotkeys so that they target the Fire_Hotkey function

    Loop %len% {
        hotkeyname = ~%key% & %A_Index%
        Hotkey, %hotkeyname%, Fire_Hotkey
    }

}

; get lowercase values

IniRead, section, config.ini, lowercase ; get data from config

lines := StrSplit(section, "`n")

lowercase_section_keys := []
lowercase_accent_versions := {}

For index, line in lines {

    lowercase_section_keys.Push(SubStr(line, 1, 1)) ; extract each key (the first chars)

}

For index, key in lowercase_section_keys {

    IniRead, chars, config.ini, lowercase, %key%
    chars := StrReplace(chars, " ") ; remove spaces
    chars := StrReplace(chars, ",") ; remove commas
    lowercase_accent_versions[key] := chars
    len := StrLen(chars)
    Add_Hotkeys(key, len)

}

; get uppercase values

uppercase_section_keys := []
uppercase_accent_versions := {}

IniRead, section, config.ini, uppercase
test := true
if (test = false) { ; if no section 'uppercase' is found or it is empty

    ; just use StringUpper on the lowercase section of the lowercase section
    For index, key in  uppercase_section_keys {
        
        chars := lowercase_accent_versions[key]
        StringUpper, uppercase_version, chars
        uppercase_accent_versions[key] = uppercase_version
        Add_Hotkeys(key, len)   ; this should probably enable so you can have keys in the uppercase section different from lowercase, but not 100% sure
    }

} else { ; if we do find such a section, parse it

    lines := StrSplit(section, "`n")

    For index, line in lines {

        uppercase_section_keys.Push(SubStr(line, 1, 1)) ; extract each key (the first chars)
    
    }

    For index, key in uppercase_section_keys {

        IniRead, chars, config.ini, uppercase, %key%
        chars := StrReplace(chars, " ") ; remove spaces
        chars := StrReplace(chars, ",") ; remove commas
        uppercase_accent_versions[key] := chars
        len := StrLen(chars)
        Add_Hotkeys(key, len)

    }
}

; test
key := "e"
foo := uppercase_accent_versions[key]

MsgBox, % foo ; output's empty, when it should be uppercase é
