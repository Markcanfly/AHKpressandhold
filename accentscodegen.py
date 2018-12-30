import configparser
from os import path # To use the isfile method
config = configparser.ConfigParser()

#region
def get_default_config():
    return """[tooltips]
# Do you want tooltips to appear?
tooltips=false
# For how long do you want to have to hold a key down for a tooltip to appear? (in seconds, floating point value allowed)
delayBeforeTooltip=0.6
# After how long do you want the tooltip to disappear? (in seconds, floating point value allowed)
tooltipTimeout=2.5
# Type the names, (or a part of the name) of programs you want tooltips to be disabled in (separated by commas)
disableTooltipsIn=

# Here you can specify which keys do you want to use with different versions, and in what order shall those versions be.
# Also, the number of variations needs to be the same for the upper- and lowercase versions of a character.
# Use a comma to separate the values.
[lowercase]
e:è, é, ê, ë, ē, ė, ę
y:ÿ
u:û, ü, ù, ú, ū
i:î, ï, í, ī, į, ì
o:ô, ö, ò, ó, œ, ø, ō, õ
a:à, á, â, ä, æ, ã, å, ā
s:ß, ś, š
l:ł
z:ž, ź, ż
c:ç, ć, č
n:ñ, ń

[uppercase]
e:È, É, Ê, Ë, Ē, Ė, Ę
y:Ÿ
u:Û, Ü, Ù, Ú, Ū
i:Î, Ï, Í, Ī, Į, Ì
o:Ô, Ö, Ò, Ó, Œ, Ø, Ō, Õ
a:À, Á, Â, Ä, Æ, Ã, Å, Ā
s:ß, Ś, Š
l:Ł
z:Ž, Ź, Ż
c:Ç, Ć, Č
n:Ñ, Ń
"""
#endregion

def main(sourceIni="config.ini", fileName = 'accents', fileNameSuffix = None):

    
    if fileName.endswith('.ahk'):
        fileName = fileName[:-4]

    fileNameEnding = '.ahk'
    if fileNameSuffix is not None:
        fileNameEnding = '_' + fileNameSuffix + fileNameEnding

    fileName = fileName + fileNameEnding
    
    # Open AutoHotkey file in the required UTF-8 encoding + BOM
    file = open(fileName, mode="w", encoding="utf-8-sig")


    # instantiate
    config = configparser.ConfigParser()

    # Try to read specified config file, if it doesn't exist, generate default and read
    # Apparently, the configparser silently passes FileNotFoundError-s. Sigh. Great.
    
    if path.isfile(sourceIni):
        config.read(sourceIni, encoding="utf-8-sig")
    else:
        print("Config file not found, using default config.")
        if not path.isfile('config.ini'):
            with open('config.ini', 'w', encoding='utf-8-sig') as configfile:
                configfile.write(get_default_config())
        config.read('config.ini', encoding="utf-8-sig")

    # Check the required data in the config 

    try:
        # Check if the required sections exist
        sections = ("lowercase", "uppercase")
        for section in sections:
            if not config.has_section(section):
                raise ValueError("Missing section: " + section)

    except Exception as error:
        print("Error:" + repr(error))


    # Create an empty list for the names of the windows in which the tooltips should be disabled, if any
    disableTooltipsInSpecifiedWindows = list()

    if config.has_section('tooltips'):
        userWantsTooltips = config.getboolean("tooltips", "tooltips", fallback=False) # Get if user wants tooltips to appear

        # If the option "disableTooltipsIn" is available
        if "disableTooltipsIn" in config["tooltips"]:
            if config["tooltips"]["disableTooltipsIn"] != "":
                # Make a list from the comma-separated values.
                disableTooltipsInSpecifiedWindows = config["tooltips"]["disableTooltipsIn"].split(",")
                for index in range(len(disableTooltipsInSpecifiedWindows)):
                    # Remove leading and trailing whitespace from the window titles
                    disableTooltipsInSpecifiedWindows[index] = disableTooltipsInSpecifiedWindows[index].strip()

        if userWantsTooltips:
            delayBeforeTooltip = config.getfloat("tooltips", "delayBeforeTooltip")
            tooltipTimeout = int(config.getfloat("tooltips", "tooltipTimeout") * 1000)
    else:
        userWantsTooltips = False
        disableTooltipsInSpecifiedWindows = []


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
    file.write("Menu, Tray, Tip, PressAndHold\n")
    file.write("\n")

    # print lists of character variations and tooltips

    # print lowercase

    for char in config["lowercase"]:
        charList = config["lowercase"][char].replace(" ", "").split(",")
        
        file.write(char + "_lower := " + str(charList).replace("\'","\"") + "\n")
        
        if userWantsTooltips:
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
        if userWantsTooltips:
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
        if userWantsTooltips:
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
            if userWantsTooltips:
                # Clear the tooltip after pressing the number.
                file.write("\nToolTip")
            file.write("\nreturn\n\n")

    # This is a piece of code that gets executed a specified amount of time later than every Tooltip call, to clear the tooltip
    # for example if the user doesn't actually use the combination.

    if userWantsTooltips:
        file.write("""RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return""")

    file.write("\n")

    file.close()


if __name__ == "__main__":
    main()
