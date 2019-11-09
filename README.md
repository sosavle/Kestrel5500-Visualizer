# :sunny: Kestrel5500-Visualizer

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
* V1.5: Smoothness slider, toolbar functionalities, resizable window, context menu copy option added, removal of global variables, comments and embellishments. Github button and Wind Rose functionality.

*********
# Context behind Kestrel Visualizer and Web:
These repos are half personal project, half part of my undergraduate research. As of the time of writing, I'm currently working with UM's environmental engineering laboratories to evaluate bacterial presence in coastal aerosols. It's a pretty fun research avenue because I get to go to the beach quite a bit :D. 

Anyway, as part of the research, we collect many weather parameters whenever we sample, which is the area I specialize in within the project. We purchased a Kestrel 5500 weather station in order to measure several parameters, but after the first use we realized the output was a plain .csv file, and the manufacturing company did not offer any sort of visualization software. So I decided to make my own! I first made it in MATLAB, because I was taking a class on it at the time, but eventually decided it would be more accessible as a website. 

Despite being tied to my research experience, I consider it a personal project because I mainly did it during my winter break and surprised everyone in the lab when I just brought it up the next meeting. It's really still a very simple piece of software, but I like to think it could perhaps prove useful to other Kestrel owners out there too!
