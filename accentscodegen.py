import configparser

# TODO: add ability to select which programs should the script be enabled and disabled in

# instantiate
config = configparser.ConfigParser()

# parse config file
config.read("config.ini")

tooltips=config.getboolean("tooltips", "tooltips")
if tooltips:
    delayBeforeTooltip = config.getfloat("tooltips", "delayBeforeTooltip")
    tooltipTimeout = int(config.getfloat("tooltips", "tooltipTimeout") * 1000)

# todo: check if the number of lowercase and uppercase chars for the same char are the same
# todo: check each user input

# set number of versions for each character
chars = dict()

for char in config["lowercase"]:
    chars[char] = len(config["lowercase"][char].split(","))

print("#NoEnv")
print("SendMode Input")
print("")

# Set Repeat and Slow Keys in Ease of Access Center to slow down keyboard repeat rates 
# to allow for more time for the second keypress

# print lists of character variations and tooltips

# print lowercase

for char in config["lowercase"]:
    charList = config["lowercase"][char].replace(" ", "").split(",")
    print(char + "_lower := " + str(charList).replace("\'","\""))
    tooltip = charList[0]
    if len(charList) > 1:
        for index in range(1, len(charList)):
            tooltip += "   "
            tooltip += charList[index]
    tooltip += "`n1"
    if len(charList) > 1:
        for index in range(2, len(charList) + 1):
            tooltip += "   "
            tooltip += str(index)
    print(char + "_lower_tooltip := \"" + tooltip + "\"")
            

# print uppercase

for char in config["uppercase"]:
    charList = config["uppercase"][char].replace(" ", "").split(",")
    print(char + "_upper := " + str(charList).replace("\'","\""))
    tooltip = charList[0]
    if len(charList) > 1:
        for index in range(1, len(charList)):
            tooltip += "   "
            tooltip += charList[index]
    tooltip += "`n1"
    if len(charList) > 1:
        for index in range(2, len(charList) + 1):
            tooltip += "   "
            tooltip += str(index)
    print(char + "_upper_tooltip := \"" + tooltip + "\"")

# print code necessary for the key combinations

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

print("""RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return""")

