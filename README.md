# AHKpressandhold
An AutoHotkey script made to mimic the macOS Press and Hold accent menu on Windows

Default variations taken from the US layout (international)

|     |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
|----:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|**a**|  à  |  á  |  â  |  ä  |  æ  |  ã  |  å  |  ā  |
|**c**|  ç  |  ć  |  č  |  ć  |     |     |     |     |
|**e**|  è  |  é  |  ê  |  ë  |  ē  |  ė  |  ę  |     |
|**i**|  î  |  ï  |  í  |  ī  |  į  |  ì  |     |     |
|**l**|  ł  |     |     |     |     |     |     |     |
|**o**|  ô  |  ö  |  ò  |  ó  |  œ  |  ø  |  ō  |  õ  |
|**n**|  ñ  |  ń  |     |     |     |     |     |     |
|**s**|  ß  |  ś  |  š  |     |     |     |     |     |
|**u**|  û  |  ü  |  ù  |  ú  |  ū  |     |     |     |
|**y**|  ÿ  |     |     |     |     |     |     |     |
|**z**|  ž  |  ź  |  ż  |     |     |     |     |     |

To change the basic layout or the properties of the tooltips, change the included *config.ini*.


## How to use
### 1. Install
You can use it from source by installing [AutoHotkey](https://www.autohotkey.com) and just running the script in the folder with the config.ini file, or download the latest release with the compiled executable.
### 2. Use
Hold a key down on the keyboard, then press the corresponding number of the character variation. 

E. g. with the default configuration for the character **ä** you would need to press **a**+**4**. Check (and edit) the config file for reference.
### 3. Editing the configuration
You can specify the variations for each key by editing *config.ini* file. You can add new keys, delete the existing, go wild. The script will build the key combinations when executed, so you will need to relaunch after editing for the changes to take effect.
### 4. Continued use
The script, once launched, will run in the background, consuming minimal resources. If you want the script to launch when starting Windows, check out this [helpful tutorial on how to set it as a startup script](https://www.autohotkey.com/docs/FAQ.htm#Startup).


## How to make the keyboard repeat delay longer (useful if you want tooltips)
This is to ensure that you have time to observe the tooltip, before the next character is typed
### 1. Go to the oldschool Control Panel > Devices and Printers
![controlpanel](https://user-images.githubusercontent.com/27026978/50086929-e5309c80-01fe-11e9-938d-4d19a49ff921.png)
### 2. Right-click on your keyboard
![devices](https://user-images.githubusercontent.com/27026978/50086621-f036fd00-01fd-11e9-8fc4-6892d079e1de.png)
### 3. Set the Repeat delay to long
![repeatdelay](https://user-images.githubusercontent.com/27026978/50086622-f0cf9380-01fd-11e9-9cbc-a6f769e8ef3e.png)
