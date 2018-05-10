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
