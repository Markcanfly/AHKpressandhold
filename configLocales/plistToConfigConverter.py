import os
import sys
import errno
import plistlib
from string import ascii_lowercase
from string import ascii_uppercase


#
# This script parses .plist files,
# and converts them to config files for the accents script.
#
# It first looks for .plist files in the Resources subdirectory,
# which is where macOS stores them, if there's none there, it looks in the script directory.
# 
# Then it generates a .ini file in the config subdirectory for each .plist file,
# in which there are characters that ahk can reasonably assign a hotkey to.
# 
# You can specify the content of the [tooltips] section by
# editing or creating a file in the script directory with the name 'tooltips.txt'
# You can also leave the file empty to omit the tooltips section or delete it to use the default.
#

def getTooltipsSection():
    tooltipsString = str()

    # If a tooltips.txt file is found, use that as the base of the whole section, if not, use the default

    try:
        file = open('tooltips.txt', 'r', encoding='utf-8')
        tooltipsString = file.read()
    except Exception as e:
        print('No tooltips file found, using default setting. Error: ' + str(e))
        tooltipsString = """[tooltips]
# Do you want tooltips to appear?
tooltips=false
# For how long do you want to have to hold a key down for a tooltip to appear? (in seconds, floating point value allowed)
delayBeforeTooltip=0.6
# After how long do you want the tooltip to disappear? (in seconds, floating point value allowed)
tooltipTimeout=2.5
# Type the names, (or a part of the name) of programs you want tooltips to be disabled in (separated by commas)
disableTooltipsIn=

# Here you can specify which keys do you want to use with different versions, and in what order shall those versions be.
# Remember that you need to specify an uppercase version for each character you add to lowercase, and vice versa.
# Also, the number of variations needs to be the same for the upper- and lowercase versions of a character.
# Use a comma to separate the values.
"""

    return tooltipsString

# Takes in a .plist keyboard file and returns the lowercase and uppercase dictionaries to place in the config

def parse(filename='testlist.plist'):
    lowerCase = ascii_lowercase
    upperCase = ascii_uppercase

    with open(filename, 'rb') as file:
        plist = plistlib.load(file)

    lowerCaseKeys = list()
    upperCaseKeys = list()

    # Finds the keys that we'll use

    for key in plist.keys():
        if key.startswith('Roman-Accent-'):
            # !!! key[-1] is the last character in that key, which is the character it needs to use for the dictionary
            # It retains the keys in their current form, but filter out those which it won't parse
            if key[-1] in lowerCase:
                lowerCaseKeys.append(key)
            elif key[-1] in upperCase:
                upperCaseKeys.append(key)

    # if there's no relevant data for us, return None

    if lowerCaseKeys == [] and upperCaseKeys == []:
        return None

    lowerCaseDict = dict()
    upperCaseDict = dict()

    # For both lower- and uppercase chars create a dictionary
    # and assign to each retained singleCharKey, (which were filtered out to be those that we can press on the keyboard)
    # the appropriate 'press and hold versions' from the plist. which is simply a string
    # todo: filter our the chars that are the same as the key, and return a list instead of string

    for key in lowerCaseKeys:
        singleCharKey = key[-1]
        lowerCaseDict[singleCharKey] = plist[key]['Keycaps']

    for key in upperCaseKeys:
        singleCharKey = key[-1]
        upperCaseDict[singleCharKey] = plist[key]['Keycaps']

    return (lowerCaseDict, upperCaseDict)

# Return .plist filenames from a tuple containing all filenames in a directory, returned by os.listdir

def plistFiles(files):
    plists = list()
    for string in files:
        if string.endswith('.plist'):
            plists.append(string)

    if plists == list():  # If it hasn't found a single .plist string, it returns false
        return None
    else:
        return plists

plistPaths = set()

plistDirectory = 'Resources' # Default directory for the plist files on macos

if os.path.isdir(plistDirectory):
    plistFileNames = plistFiles(os.listdir(plistDirectory + '/')) # Find all the .plist files in the specified directory
    if plistFileNames is not None: 
        # If it's found .plist files, add the directory name before the filename
        plistPaths = ['{0}/{1}'.format(plistDirectory, plistFileName) for plistFileName in plistFileNames]
else:
    plistPaths = plistFiles(os.listdir()) # List the filenames in the script folder
    if plistPaths is None:
        sys.exit('No .plists file found in either the Resources directory or the script directory.')

# This is where the parsing section ends, and the writing begins
# Make sure that the directory 'config' exists

try: 
    os.makedirs('config/')
except OSError as e:
    if e.errno != errno.EEXIST:
        raise


# For each .plist file that has passed the filter, create a config file with the appropriate name and write the proper content

tooltips = getTooltipsSection()

for plistFile in plistPaths:

    # Extract region code from filename
    if 'Resources/' in plistFile:
        suffix = plistFile[19:]  # Remove 'Resources/Keyboard-'
    else:
        suffix = plistFile[9:]  # Remove 'Keyboard-'

    suffix = suffix[:-6]  # Remove '.plist' from end

    parsed = parse(plistFile)

    if parsed is not None:

        lowerCase = parsed[0]
        upperCase = parsed[1]

        configFileName = 'config/config_' + suffix + '.ini'

        # Write the ini data to files

        with open(configFileName, 'w', encoding='utf8') as config:
            config.write(tooltips)
            # Write lowercase to file

            config.write('[lowercase]\n')
            for key in lowerCase.keys():
                config.write(
                    key + ":" + lowerCase[key].replace(' ', ',') + '\n') # Because our parsing algorithm returns these as strings
            config.write('\n')

            # Write uppercase to file

            config.write('[uppercase]\n')
            for key in upperCase.keys():
                config.write(
                    key + ":" + upperCase[key].replace(' ', ',') + '\n')
            config.write('\n')
