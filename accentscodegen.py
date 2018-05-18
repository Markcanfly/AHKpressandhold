import configparser
config = configparser.ConfigParser()

file = open('accents.ahk', mode="w", encoding="utf-8-sig")

# TODO: add ability to select which programs should the script be enabled and disabled in

# instantiate
config = configparser.ConfigParser()

# parse config file
try:
    config.read("config.ini", encoding="utf-8")
except FileNotFoundError:
    print("Config file not found.")
    exit()

disableTooltipsInSpecifiedWindows = list()

tooltips = config.getboolean("tooltips", "tooltips")
if "disableScriptIn" in config["general"]:
    disableTooltipsInSpecifiedWindows = config["tooltips"]["disableTooltipsIn"].split(",")
    for index in range(len(disableTooltipsInSpecifiedWindows)):
        disableTooltipsInSpecifiedWindows[index] = disableTooltipsInSpecifiedWindows[index].strip()

if tooltips:
    delayBeforeTooltip = config.getfloat("tooltips", "delayBeforeTooltip")
    tooltipTimeout = int(config.getfloat("tooltips", "tooltipTimeout") * 1000)

# todo: check if the number of lowercase and uppercase chars for the same char are the same
# todo: check each user input

# set number of versions for each character
chars = dict()

for char in config["lowercase"]:
    chars[char] = len(config["lowercase"][char].split(","))

# Check user input
upperToLower = list(config["uppercase"])
for index in range(len(upperToLower)):
    upperToLower[index] = upperToLower[index].lower()

if list(config["lowercase"]) != upperToLower:
    raise ValueError("One or more characters don't have an uppercase/lowercase version.")

# Set Repeat and Slow Keys in Ease of Access Center to slow down keyboard repeat rates
# to allow for more time for the second keypress

file.write("#NoEnv\n")
file.write("SendMode Input\n")
if disableTooltipsInSpecifiedWindows != []:
    file.write("SetTitleMatchMode, 2\n")
file.write("\n")

# print lists of character variations and tooltips

# print lowercase

for char in config["lowercase"]:
    charList = config["lowercase"][char].replace(" ", "").split(",")
    file.write(char + "_lower := " + str(charList).replace("\'","\"") + "\n")
    if tooltips:
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
        file.write(char + "_lower_tooltip := \"" + tooltip + "\"\n")

# print uppercase

for char in config["uppercase"]:
    charList = config["uppercase"][char].replace(" ", "").split(",")
    file.write(char + "_upper := " + str(charList).replace("\'","\"") + "\n")
    if tooltips:
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
        file.write(char + "_upper_tooltip := \"" + tooltip + "\"\n")

file.write("\n")

# print code necessary for the key combinations

for char in chars:
    # this writes the tooltip displayer segment
    if tooltips:
        file.write("~*{0}::\n".format(char))
        if disableTooltipsInSpecifiedWindows != []:
            file.write("if not (WinActive(\"{0}\")".format(disableTooltipsInSpecifiedWindows[0]))
            for index in range(1, len(disableTooltipsInSpecifiedWindows)):
                file.write("or WinActive(\"{0}\")".format(disableTooltipsInSpecifiedWindows[index]))
            file.write(") {\n")
        file.write("""KeyWait, {0}, T{1}
    if ErrorLevel
        if (GetKeyState(\"Shift\", \"P\")){{
            ToolTip, % {0}_upper_tooltip, %A_CaretX%, %A_CaretY%
        }} else {{
            ToolTip, % {0}_lower_tooltip, %A_CaretX%, %A_CaretY%
            }}
SetTimer, RemoveToolTip, {2}
""".format(char, delayBeforeTooltip, tooltipTimeout))
    if disableTooltipsInSpecifiedWindows != []:
        file.write("}\n")
    file.write("return\n\n")
    for n in range(1, chars[char] + 1):
        file.write("""~{0} & {1}::
Send, {{BackSpace}}
if (GetKeyState(\"Shift\", \"P\")) {{
Send, % {0}_upper[{1}]
}} else {{
Send, % {0}_lower[{1}]
}}""".format(char,n))
        if tooltips:
            file.write("\nToolTip")
        file.write("\nreturn\n\n")

if tooltips:
    file.write("""RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return""")

file.close()
