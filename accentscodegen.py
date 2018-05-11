chars = {"e":7, "y":1, "u":5, "i":6, "o":8, "a":8, "s":3, "l":1, "z":3, "c":3, "n":2}

for char in chars:
    # this writes the tooltip displayer segment
    print("~*{0}::".format(char)) 
    print("    KeyWait, {0}, T0.5".format(char))
    print("    if ErrorLevel")
    print("        if (GetKeyState(\"Shift\", \"P\")){")
    print("            ToolTip, % {0}_upper_tooltip, %A_CaretX%, %A_CaretY%".format(char))
    print("        } else {")
    print("            ToolTip, % {0}_lower_tooltip, %A_CaretX%, %A_CaretY%".format(char))
    print("        }")
    print("        SetTimer, RemoveToolTip, 3000")
    print("return")
    print("")
    for n in range(1, chars[char] + 1):
        print("~{0} & {1}::".format(char, n))
        print("Send, {BackSpace}")
        print("if (GetKeyState(\"Shift\", \"P\")) {")
        print("    Send, % {0}_upper[{1}]".format(char, n))
        print("} else {")
        print("    Send, % {0}_lower[{1}]".format(char, n))
        print("}")
        print("ToolTip")
        print("return")
        print("")
input("") 
# this "input("") function is to protect my mental health, by not requiring me to
# find whatever's wrong with my current debugger (none of them seemed to give the
# full proper console output)
