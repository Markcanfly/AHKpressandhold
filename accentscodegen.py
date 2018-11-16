import configparser
config = configparser.ConfigParser()

# Open AutoHotkey file in the required UTF-8 encoding + BOM
file = open('accents.ahk', mode="w", encoding="utf-8-sig")

# TODO: add ability to select which programs should the script be enabled and disabled in

# instantiate
config = configparser.ConfigParser()

# parse config file, or if there's no config file, terminate the program
try:
    config.read("config.ini", encoding="utf-8-sig")
except FileNotFoundError:
    print("Config file not found.")
    exit()

# Create an empty list for the names of the windows in which the tooltips should be disabled, if any
disableTooltipsInSpecifiedWindows = list()

tooltips = config.getboolean("tooltips", "tooltips") # Get if user wants tooltips to appear

# If the option "disableTooltipsIn" is available
if "disableTooltipsIn" in config["tooltips"]:
    if config["tooltips"]["disableTooltipsIn"] != "":
        # Make a list from the comma-separated values.
        disableTooltipsInSpecifiedWindows = config["tooltips"]["disableTooltipsIn"].split(",")
        for index in range(len(disableTooltipsInSpecifiedWindows)):
            # Remove leading and trailing whitespace from the window titles
            disableTooltipsInSpecifiedWindows[index] = disableTooltipsInSpecifiedWindows[index].strip()

if tooltips:
    delayBeforeTooltip = config.getfloat("tooltips", "delayBeforeTooltip")
    tooltipTimeout = int(config.getfloat("tooltips", "tooltipTimeout") * 1000)

# todo: check each user input

# set number of versions for each character

chars = dict() # Create an empty dictionary for the number of each character's variations

for char in config["lowercase"]:
    chars[char] = len(config["lowercase"][char].split(","))

# Check user input
upperToLower = list(config["uppercase"])
for index in range(len(upperToLower)):
    upperToLower[index] = upperToLower[index].lower()

file.write("#NoEnv\n")
file.write("SendMode Input\n") 
if disableTooltipsInSpecifiedWindows != []:
    # Set title match mode so if the active window's title contains the string we're testing for, it returns its unique code.
    file.write("SetTitleMatchMode, 2\n")
file.write("Menu, Tray, Tip, macOSaccents\n")
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

# print a function that checks if one of the windows specified in "disableTooltipsIn" is open
if disableTooltipsInSpecifiedWindows != []:
    file.write("shouldTooltipsBeEnabledHere() {\n")
    file.write("if WinActive(\"{0}\")".format(disableTooltipsInSpecifiedWindows[0]))
    for index in range(1, len(disableTooltipsInSpecifiedWindows)):
        file.write(" or WinActive(\"{0}\")".format(disableTooltipsInSpecifiedWindows[index]))
    file.write(" {\n")
    file.write("return false\n")
    file.write("} else {\n")
    file.write("return true\n")
    file.write("}\n")
    file.write("}\n\n")


# print code necessary for the key combinations

for char in chars:
    # this writes the tooltip displayer segment
    if tooltips:
        file.write("~*{0}::\n".format(char))
        if disableTooltipsInSpecifiedWindows != []:
            file.write("if shouldTooltipsBeEnabledHere()")
            file.write(" {\n")
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

    # Print the necessary code for the script to grab the character from the array specified above 
    # and Send it as a keypress when the correct combination is pressed.

    for n in range(1, chars[char] + 1):
        file.write("""~{0} & {1}::
Send, {{BackSpace}}
if (GetKeyState(\"Shift\", \"P\")) {{
Send, % {0}_upper[{1}]
}} else {{
Send, % {0}_lower[{1}]
}}""".format(char,n))
        if tooltips:
            # Clear the tooltip after pressing the number.
            file.write("\nToolTip")
        file.write("\nreturn\n\n")

# This is a piece of code that gets executed a specified amount of time later than every Tooltip call, to clear the tooltip
# for example if the user doesn't actually use the combination.

if tooltips:
    file.write("""RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return""")

file.write("\n")

file.close()
