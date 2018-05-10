e_lower = 7
e_upper = 7
y_lower = 1
y_upper = 1
u_lower = 5
u_upper = 5
i_lower = 6
i_upper = 6
o_lower = 8
o_upper = 8
a_lower = 8
a_upper = 8
s_lower = 3
s_upper = 3
l_lower = 1
l_upper = 1
z_lower = 3
z_upper = 3
c_lower = 3
c_upper = 3
n_lower = 2
n_upper = 2
chars = {"e":7, "y":1, "u":5, "i":6, "o":8, "a":8, "s":3, "l":1, "z":3, "c":3, "n":2}

for char in chars:
    for n in range(1, chars[char] + 1):
        print("~{0} & {1}::".format(char, n))
        print("Send, {BackSpace}")
        print("if (GetKeyState(\"Shift\", \"P\")) {")
        print("    Send, % {0}_upper[{1}]".format(char, n))
        print("} else {")
        print("    Send, % {0}_lower[{1}]".format(char, n))
        print("}")
        print("return")
        print("")
