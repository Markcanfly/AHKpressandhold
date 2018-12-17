# AHKpressandhold
An AutoHotkey script made to mimic the macOS Press and Hold accent menu on Windows

*The script itself only requires AutoHotkey to be installed, but Python is needed to easily update the script.*

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

To change the basic layout or the properties of the tooltips, change the included config.ini, then run accentscodegen.py (written in Python3), which writes the generated code to the .ahk file. 

[Helpful tutorial on how to set it as a startup script](https://www.autohotkey.com/docs/FAQ.htm#Startup)


## How to make the keyboard repeat delay longer (useful if you want tooltips)
This is to ensure that you have time to observe the tooltip, before the next character is typed
### 1. Go to the oldschool Control Panel > Devices and Printers
![controlpanel](https://user-images.githubusercontent.com/27026978/50086929-e5309c80-01fe-11e9-938d-4d19a49ff921.png)
### 2. Right-click on your keyboard
![devices](https://user-images.githubusercontent.com/27026978/50086621-f036fd00-01fd-11e9-8fc4-6892d079e1de.png)
### 3. Set the Repeat delay to long
![repeatdelay](https://user-images.githubusercontent.com/27026978/50086622-f0cf9380-01fd-11e9-9cbc-a6f769e8ef3e.png)
