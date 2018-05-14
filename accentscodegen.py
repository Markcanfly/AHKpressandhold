import configparser

# instantiate
config = configparser.ConfigParser()

# parse config file
config.read('config.ini')

tooltips=config.getboolean('tooltips', 'tooltips')
if tooltips:
    delayBeforeTooltip = config.getfloat('tooltips', 'delayBeforeTooltip')
    tooltipTimeout = int(config.getfloat('tooltips', 'tooltipTimeout') * 1000)

chars = {"e":7, "y":1, "u":5, "i":6, "o":8, "a":8, "s":3, "l":1, "z":3, "c":3, "n":2}

for char in chars:
    # this writes the tooltip displayer segment
    if tooltips:
        print("~*{0}::".format(char)) 
        print("    KeyWait, {0}, T{1}".format(char, delayBeforeTooltip))
        print("    if ErrorLevel")
        print("        if (GetKeyState(\"Shift\", \"P\")){")
        print("            ToolTip, % {0}_upper_tooltip, %A_CaretX%, %A_CaretY%".format(char))
        print("        } else {")
        print("            ToolTip, % {0}_lower_tooltip, %A_CaretX%, %A_CaretY%".format(char))
        print("        }")
        print("        SetTimer, RemoveToolTip, {0}".format(tooltipTimeout))
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
        if tooltips:
            print("ToolTip")
        print("return")
        print("")

