# macosaccents
An AutoHotkey script made to mimic the macOS accent menu

*The script itself only requires AutoHotkey to be installed, but Python is needed to easily update the script.*

Basic variations taken from the US layout (international)

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

Set "Repeat and Slow Keys" in Ease of Access Center to slow down keyboard repeat rates to allow for more time before windows starts detecting another keypress. Make sure that that time is longer than the one you've set for your tooltips, otherwise they will only appear after the key you wanted has already been typed twice.
