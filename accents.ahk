#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Set Repeat and Slow Keys in Ease of Access Center to slow down keyboard repeat rates 
; to allow for more time for the second keypress

; The ~ modifier symbol makes it so that the system still receives the information of an e being presed
; Then it can delete the last character and paste the accurate new one
; todo: add some extra accents not found in macOS
; todo: add ability to long-press, release button, and then press number

e_lower := ["è", "é", "ê", "ë", "ē", "ė", "ę"]
e_lower_tooltip := "è  é  ê  ë  ē  ė  ę`n1  2  3  4  5  6  7"
e_upper := ["È", "É", "Ê", "Ë", "Ē", "Ė", "Ę"]
e_upper_tooltip := "È  É  Ê  Ë  Ē  Ė  Ę`n1  2  3  4  5  6  7"
y_lower := ["ÿ"]
y_lower_tooltip := "ÿ`n1"
y_upper := ["Ÿ"]
y_upper_tooltip := "Ÿ`n1"
u_lower := ["û", "ü", "ù", "ú", "ū"]
u_lower_tooltip := "û  ü  ù  ú  ū`n1  2  3  4  5"
u_upper := ["Û", "Ü", "Ù", "Ú", "Ū"]
u_upper_tooltip := "Û  Ü  Ù  Ú  Ū`n1  2  3  4  5"
i_lower := ["î", "ï", "í", "ī", "į", "ì"]
i_lower_tooltip := "î   ï   í   ī   į   ì`n1  2  3  4  5  6"
i_upper := ["Î", "Ï", "Í", "Ī", "Į", "Ì"]
i_upper_tooltip := "Î   Ï   Í   Ī   Į   Ì`n1  2  3  4  5  6"
o_lower := ["ô", "ö", "ò", "ó", "œ", "ø", "ō", "õ"]
o_lower_tooltip := "ô  ö  ò  ó  œ  ø  ō  õ`n1  2  3   4   5   6  7  8"
o_upper := ["Ô", "Ö", "Ò", "Ó", "Œ", "Ø", "Ō", "Õ"]
o_upper_tooltip := "Ô  Ö  Ò  Ó  Œ  Ø  Ō  Õ`n1  2  3   4   5   6  7  8"
a_lower := ["à", "á", "â", "ä", "æ", "ã", "å", "ā"]
a_lower_tooltip := "à  á  â  ä  æ  ã  å  ā`n1  2  3  4  5  6  7  8"
a_upper := ["À", "Á", "Â", "Ä", "Æ", "Ã", "Å", "Ā"]
a_upper_tooltip := "À  Á  Â  Ä  Æ  Ã  Å  Ā`n1  2  3  4  5  6  7  8"
s_lower := ["ß", "ś", "š"]
s_lower_tooltip := "ß  ś  š`n1  2  3"
s_upper := ["ß", "Ś", "Š"]
s_upper_tooltip := "ß  Ś  Š`n1  2  3"
l_lower := ["ł"]
l_lower_tooltip := "ł`n1"
l_upper := ["Ł"]
l_upper_tooltip := "Ł`n1"
z_lower := ["ž", "ź", "ż"]
z_lower_tooltip := "ž  ź  ż`n1  2  3"
z_upper := ["Ž", "Ź", "Ż"]
z_upper_tooltip := "Ž  Ź  Ż`n1  2  3"
c_lower := ["ç", "ć", "č"]
c_lower_tooltip := "ç  ć  č`n1  2  3"
c_upper := ["Ç", "Ć", "Č"]
c_upper_tooltip := "Ç  Ć  Č`n1  2  3"
n_lower := ["ñ", "ń"]
n_lower_tooltip := "ñ  ń`n1  2"
n_upper := ["Ñ", "Ń"]
n_upper_tooltip := "Ñ  Ń`n1  2"

~Escape:: ; if for some reason the tooltip doesn't disappear, the user can press Escape
    ToolTip
    return

; paste the python file's output here

~*a::
    KeyWait, a, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % a_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % a_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~a & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[1]
} else {
    Send, % a_lower[1]
}
ToolTip
return

~a & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[2]
} else {
    Send, % a_lower[2]
}
ToolTip
return

~a & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[3]
} else {
    Send, % a_lower[3]
}
ToolTip
return

~a & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[4]
} else {
    Send, % a_lower[4]
}
ToolTip
return

~a & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[5]
} else {
    Send, % a_lower[5]
}
ToolTip
return

~a & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[6]
} else {
    Send, % a_lower[6]
}
ToolTip
return

~a & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[7]
} else {
    Send, % a_lower[7]
}
ToolTip
return

~a & 8::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % a_upper[8]
} else {
    Send, % a_lower[8]
}
ToolTip
return

~*c::
    KeyWait, c, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % c_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % c_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~c & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % c_upper[1]
} else {
    Send, % c_lower[1]
}
ToolTip
return

~c & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % c_upper[2]
} else {
    Send, % c_lower[2]
}
ToolTip
return

~c & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % c_upper[3]
} else {
    Send, % c_lower[3]
}
ToolTip
return

~*e::
    KeyWait, e, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % e_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % e_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~e & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[1]
} else {
    Send, % e_lower[1]
}
ToolTip
return

~e & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[2]
} else {
    Send, % e_lower[2]
}
ToolTip
return

~e & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[3]
} else {
    Send, % e_lower[3]
}
ToolTip
return

~e & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[4]
} else {
    Send, % e_lower[4]
}
ToolTip
return

~e & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[5]
} else {
    Send, % e_lower[5]
}
ToolTip
return

~e & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[6]
} else {
    Send, % e_lower[6]
}
ToolTip
return

~e & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % e_upper[7]
} else {
    Send, % e_lower[7]
}
ToolTip
return

~*i::
    KeyWait, i, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % i_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % i_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~i & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[1]
} else {
    Send, % i_lower[1]
}
ToolTip
return

~i & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[2]
} else {
    Send, % i_lower[2]
}
ToolTip
return

~i & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[3]
} else {
    Send, % i_lower[3]
}
ToolTip
return

~i & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[4]
} else {
    Send, % i_lower[4]
}
ToolTip
return

~i & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[5]
} else {
    Send, % i_lower[5]
}
ToolTip
return

~i & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % i_upper[6]
} else {
    Send, % i_lower[6]
}
ToolTip
return

~*l::
    KeyWait, l, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % l_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % l_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~l & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % l_upper[1]
} else {
    Send, % l_lower[1]
}
ToolTip
return

~*o::
    KeyWait, o, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % o_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % o_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~o & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[1]
} else {
    Send, % o_lower[1]
}
ToolTip
return

~o & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[2]
} else {
    Send, % o_lower[2]
}
ToolTip
return

~o & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[3]
} else {
    Send, % o_lower[3]
}
ToolTip
return

~o & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[4]
} else {
    Send, % o_lower[4]
}
ToolTip
return

~o & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[5]
} else {
    Send, % o_lower[5]
}
ToolTip
return

~o & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[6]
} else {
    Send, % o_lower[6]
}
ToolTip
return

~o & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[7]
} else {
    Send, % o_lower[7]
}
ToolTip
return

~o & 8::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % o_upper[8]
} else {
    Send, % o_lower[8]
}
ToolTip
return

~*n::
    KeyWait, n, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % n_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % n_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~n & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % n_upper[1]
} else {
    Send, % n_lower[1]
}
ToolTip
return

~n & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % n_upper[2]
} else {
    Send, % n_lower[2]
}
ToolTip
return

~*s::
    KeyWait, s, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % s_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % s_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~s & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % s_upper[1]
} else {
    Send, % s_lower[1]
}
ToolTip
return

~s & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % s_upper[2]
} else {
    Send, % s_lower[2]
}
ToolTip
return

~s & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % s_upper[3]
} else {
    Send, % s_lower[3]
}
ToolTip
return

~*u::
    KeyWait, u, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % u_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % u_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~u & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % u_upper[1]
} else {
    Send, % u_lower[1]
}
ToolTip
return

~u & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % u_upper[2]
} else {
    Send, % u_lower[2]
}
ToolTip
return

~u & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % u_upper[3]
} else {
    Send, % u_lower[3]
}
ToolTip
return

~u & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % u_upper[4]
} else {
    Send, % u_lower[4]
}
ToolTip
return

~u & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % u_upper[5]
} else {
    Send, % u_lower[5]
}
ToolTip
return

~*y::
    KeyWait, y, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % y_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % y_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~y & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % y_upper[1]
} else {
    Send, % y_lower[1]
}
ToolTip
return

~*z::
    KeyWait, z, T0.8
    if ErrorLevel
        if (GetKeyState("Shift", "P")){
            ToolTip, % z_upper_tooltip, %A_CaretX%, %A_CaretY%
        } else {
            ToolTip, % z_lower_tooltip, %A_CaretX%, %A_CaretY%
        }
        SetTimer, RemoveToolTip, 3000
return

~z & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % z_upper[1]
} else {
    Send, % z_lower[1]
}
ToolTip
return

~z & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % z_upper[2]
} else {
    Send, % z_lower[2]
}
ToolTip
return

~z & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
    Send, % z_upper[3]
} else {
    Send, % z_lower[3]
}
ToolTip
return

; static code from here

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
