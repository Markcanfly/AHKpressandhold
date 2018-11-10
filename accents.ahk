#NoEnv
SendMode Input

e_lower := ["è", "é", "ê", "ë", "ē", "ė", "ę"]
y_lower := ["ÿ"]
u_lower := ["û", "ü", "ù", "ú", "ū"]
i_lower := ["î", "ï", "í", "ī", "į", "ì"]
o_lower := ["ô", "ö", "ò", "ó", "œ", "ø", "ō", "õ"]
a_lower := ["à", "á", "â", "ä", "æ", "ã", "å", "ā"]
s_lower := ["ß", "ś", "š"]
l_lower := ["ł"]
z_lower := ["ž", "ź", "ż"]
c_lower := ["ç", "ć", "č"]
n_lower := ["ñ", "ń"]
e_upper := ["È", "É", "Ê", "Ë", "Ē", "Ė", "Ę"]
y_upper := ["Ÿ"]
u_upper := ["Û", "Ü", "Ù", "Ú", "Ū"]
i_upper := ["Î", "Ï", "Í", "Ī", "Į", "Ì"]
o_upper := ["Ô", "Ö", "Ò", "Ó", "Œ", "Ø", "Ō", "Õ"]
a_upper := ["À", "Á", "Â", "Ä", "Æ", "Ã", "Å", "Ā"]
s_upper := ["ß", "Ś", "Š"]
l_upper := ["Ł"]
z_upper := ["Ž", "Ź", "Ż"]
c_upper := ["Ç", "Ć", "Č"]
n_upper := ["Ñ", "Ń"]

~e & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[1]
} else {
Send, % e_lower[1]
}
return

~e & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[2]
} else {
Send, % e_lower[2]
}
return

~e & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[3]
} else {
Send, % e_lower[3]
}
return

~e & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[4]
} else {
Send, % e_lower[4]
}
return

~e & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[5]
} else {
Send, % e_lower[5]
}
return

~e & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[6]
} else {
Send, % e_lower[6]
}
return

~e & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % e_upper[7]
} else {
Send, % e_lower[7]
}
return

~y & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % y_upper[1]
} else {
Send, % y_lower[1]
}
return

~u & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % u_upper[1]
} else {
Send, % u_lower[1]
}
return

~u & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % u_upper[2]
} else {
Send, % u_lower[2]
}
return

~u & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % u_upper[3]
} else {
Send, % u_lower[3]
}
return

~u & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % u_upper[4]
} else {
Send, % u_lower[4]
}
return

~u & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % u_upper[5]
} else {
Send, % u_lower[5]
}
return

~i & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[1]
} else {
Send, % i_lower[1]
}
return

~i & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[2]
} else {
Send, % i_lower[2]
}
return

~i & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[3]
} else {
Send, % i_lower[3]
}
return

~i & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[4]
} else {
Send, % i_lower[4]
}
return

~i & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[5]
} else {
Send, % i_lower[5]
}
return

~i & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % i_upper[6]
} else {
Send, % i_lower[6]
}
return

~o & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[1]
} else {
Send, % o_lower[1]
}
return

~o & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[2]
} else {
Send, % o_lower[2]
}
return

~o & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[3]
} else {
Send, % o_lower[3]
}
return

~o & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[4]
} else {
Send, % o_lower[4]
}
return

~o & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[5]
} else {
Send, % o_lower[5]
}
return

~o & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[6]
} else {
Send, % o_lower[6]
}
return

~o & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[7]
} else {
Send, % o_lower[7]
}
return

~o & 8::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % o_upper[8]
} else {
Send, % o_lower[8]
}
return

~a & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[1]
} else {
Send, % a_lower[1]
}
return

~a & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[2]
} else {
Send, % a_lower[2]
}
return

~a & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[3]
} else {
Send, % a_lower[3]
}
return

~a & 4::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[4]
} else {
Send, % a_lower[4]
}
return

~a & 5::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[5]
} else {
Send, % a_lower[5]
}
return

~a & 6::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[6]
} else {
Send, % a_lower[6]
}
return

~a & 7::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[7]
} else {
Send, % a_lower[7]
}
return

~a & 8::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % a_upper[8]
} else {
Send, % a_lower[8]
}
return

~s & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % s_upper[1]
} else {
Send, % s_lower[1]
}
return

~s & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % s_upper[2]
} else {
Send, % s_lower[2]
}
return

~s & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % s_upper[3]
} else {
Send, % s_lower[3]
}
return

~l & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % l_upper[1]
} else {
Send, % l_lower[1]
}
return

~z & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % z_upper[1]
} else {
Send, % z_lower[1]
}
return

~z & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % z_upper[2]
} else {
Send, % z_lower[2]
}
return

~z & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % z_upper[3]
} else {
Send, % z_lower[3]
}
return

~c & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % c_upper[1]
} else {
Send, % c_lower[1]
}
return

~c & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % c_upper[2]
} else {
Send, % c_lower[2]
}
return

~c & 3::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % c_upper[3]
} else {
Send, % c_lower[3]
}
return

~n & 1::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % n_upper[1]
} else {
Send, % n_lower[1]
}
return

~n & 2::
Send, {BackSpace}
if (GetKeyState("Shift", "P")) {
Send, % n_upper[2]
} else {
Send, % n_lower[2]
}
return


