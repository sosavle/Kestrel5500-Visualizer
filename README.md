# Kestrel5500-Visualizer

Tool for graphing data (.csv files) obtained from a [Kestrel 5500 portable weather station](https://kestrelinstruments.com/)

The code is designed assuming the Kestrel is measuring in international units.

Designed in _Matlab R2018a_ using GUIDE.


![Screenshot](https://github.com/sosavle/Kestrel5500-Visualizer/blob/master/SnipMatlab.PNG)

*********
# How to install

You only need the files in the Kestrel5500-Visualizer folder!
Download the folder and then install the app by opening the "For Redistribution" sub-folder and clicking on the install wizard

If you already have Matlab installed on your computer, you may also download the .m and .fig files, and execute the .m file to boot up the GUI

*********
# Changelog

* V1: Cycling between graphs, average value
* V1.2: Added toolbar, minimum and maximum value display. Simplified code. Added License. Added executable file.
* V1.3: Bug fix: Pressure values under 1000 will no longer crash the app
* V1.4: Table viewer added
* V1.5: Smoothness slider, toolbar functionalities, resizable window, context menu copy option added, removal of global variables, comments and embellishments
* V1.6: Github button and Wind Rose functionality
