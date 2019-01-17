%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
%% ----------------- KESTREL 5500 VISUALIZER ----------------- %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%

% Thanks for using my program!
% Gracias por usar mi programa!
% 当プログラムはご使用になって誠に感謝いたします。
%                                                 〜 Luis Sosa

%% ACKNOWLEDGEMENTS

% Thanks to Daniel Pereira who developed the WindRose.m file used in this program
% daniel.pereira.valades@gmail.com
% https://www.mathworks.com/matlabcentral/fileexchange/47248-wind-rose

% Thanks to Mathworks for developing Matlab, much of its documentation, and
% the function which chooseSaveType was based off of.

% ------------------------------------------------------------------- %
%% ------ Variables stored in Kestrel 5500 .csv exports ------ %%
% ------------------------------------------------------------------- %

% Top 3 lines are header lines
% All variables are ints unless otherwise specified

% formattedDateTime = kestrelData(:,1);
    % FORMAT: YYYY/MM/DD HH:MM:SS
% barometricPressure = kestrelData(:,2);
    % FORMAT: String
% densityAltitude = kestrelData(:,3);
% relativeHumidity =  kestrelData(:,4);
% stationPressure =  kestrelData(:,5);
    % FORMAT: String
% headwind =  kestrelData(:,6);
% altitude =  kestrelData(:,7);
% dewPoint =  kestrelData(:,8);
% magneticDirection =  kestrelData(:,9);
% wetBulb =  kestrelData(:,10);
% windChill =  kestrelData(:,11);
% crossWind =  kestrelData(:,12);
% heatStress =  kestrelData(:,13);
% temperature =  kestrelData(:,14);
% trueDirection =  kestrelData(:,15);


% -------------------------------------------------------------- %
%% ------------------- Initialize GUI ------------------- %%
%%%                  - Auto Generated by GUIDE -              %%%%
% -------------------------------------------------------------- %

function varargout = Kestrel5500_visualizer(varargin)
% KESTREL5500_VISUALIZER MATLAB code for Kestrel5500_visualizer.fig
%      KESTREL5500_VISUALIZER, by itself, creates a new KESTREL5500_VISUALIZER or raises the existing
%      singleton*.
%
%      H = KESTREL5500_VISUALIZER returns the handle to a new KESTREL5500_VISUALIZER or the handle to
%      the existing singleton*.
%
%      KESTREL5500_VISUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KESTREL5500_VISUALIZER.M with the given input arguments.
%
%      KESTREL5500_VISUALIZER('Property','Value',...) creates a new KESTREL5500_VISUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Kestrel5500_visualizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Kestrel5500_visualizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Kestrel5500_visualizer

% Last Modified by GUIDE av2.5 05-Jan-2019 22:40:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kestrel5500_visualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @Kestrel5500_visualizer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Kestrel5500_visualizer is made visible.
function Kestrel5500_visualizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Kestrel5500_visualizer (see VARARGIN)

% Choose default command line output for Kestrel5500_visualizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Kestrel5500_visualizer wait for user response (see UIRESUME)
% uiwait(handles.guiMain);

% set(gcf,'toolbar','figure');
 
% f = figure(999);
% f.Visible = 'off';

% --- Outputs from this function are returned to the command line.
function varargout = Kestrel5500_visualizer_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

%% ************** Creation Functions ***************** %%

% --- Executes during object creation, after setting all properties.
function meanOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meanOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function directoryDisp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to directoryDisp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function maxOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function smoothSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smoothSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function minOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ***************** Unused Callbacks ******************* %%


%% MEAN OUT -------------------------------------------------------
function meanOut_Callback(hObject, eventdata, handles)
% hObject    handle to meanOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meanOut as text
%        str2double(get(hObject,'String')) returns contents of meanOut as a double


%% DIRECTORY ------------------------------------------------------
function directoryDisp_Callback(hObject, eventdata, handles)
% hObject    handle to directoryDisp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of directoryDisp as text
%        str2double(get(hObject,'String')) returns contents of directoryDisp as a double


%% MIN OUT --------------------------------------------------------
function minOut_Callback(hObject, eventdata, handles)
% hObject    handle to minOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minOut as text
%        str2double(get(hObject,'String')) returns contents of minOut as a double


%% MAX OUT --------------------------------------------------------
function maxOut_Callback(hObject, eventdata, handles)
% hObject    handle to maxOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxOut as text
%        str2double(get(hObject,'String')) returns contents of maxOut as a double


% -------------------------------------------------------------------- %
%% -------------------- Start of Callbacks -------------------- %%
%%%                  - Editable Program Starts Here -                %%%
% -------------------------------------------------------------------- %

% browseButton
% kestrelPlot 
% cycleRight
% cycleLeft
% graphButton
% tableButton
% smoothSlider
% openButton
% saveButton


%% BROWSE --------------------------------------------------------
% --- Executes on button press in browseButton. -------------------------
function browseButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Browse for a file and display filepath
% global unitIn;
[file, path] = uigetfile('*.csv');
directory = fullfile(path,file);
set(handles.directoryDisp, 'string', directory);
kestrelData = readtable(directory,'HeaderLines',3); % Delete top of sheet


% unitIn = kestrelData(1,:); % Extract unit cells
writetable(kestrelData,'kestrelData')
% Save the edited file and re-open it (necessary to eliminate ' ' enclosing values)
opts = detectImportOptions('KestrelData.txt');
opts.VariableTypes(1) = {'string'};
kestrelData = readtable('KestrelData.txt',opts);
clear opts;
% delete KestrelData.txt


% Barometic and Station Pressure arrays are stored as cells, so they must
% be converted to doubles for analysis. Since the values include commas,
% string is used as an intermediate

% Type will be cell if the values include a comma (i.e. are over 1000)
% These cells must be converted to doubles via a string intermediary
if iscell(kestrelData.BarometricPressure) 
    
    kestrelData.BarometricPressure = cell2mat(kestrelData.BarometricPressure);
    BP = zeros(length(kestrelData.BarometricPressure),1);
    
    for j = 1:length(kestrelData.BarometricPressure)
        BP(j,:) = str2double(kestrelData.BarometricPressure(j,:));
    end
    kestrelData.BarometricPressure = BP;
    clear BP;
end

% Same logic as before
if iscell(kestrelData.StationPressure)
    
    kestrelData.StationPressure = cell2mat(kestrelData.StationPressure);
    SP = zeros(length(kestrelData.BarometricPressure),1);
    
    for j = 1:length(kestrelData.StationPressure)
        SP(j,:) = str2double(kestrelData.StationPressure(j,:));
    end
    kestrelData.StationPressure = SP;
    clear SP;
end

% Getting time as a string
timeStr = kestrelData.FORMATTEDDATE_TIME;
% Making use of Matlab's datetime type
t = datetime(timeStr);
setappdata(gcf,'t',t);
% date & time require special treatment, so they are isolated
kestrelData.FORMATTEDDATE_TIME = [];
% array form avoids redundant switch statements
fKestrelData = table2array(kestrelData); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Rearrange
% tempKestrelData = fKestrelData;
% 
% reorderVector = [1,6,12,9,15,14,11,8,13,10,4,5,2,3,7];
% 
% for j=1:length(reorderVector)
%     fKestrelData(:,j) = tempKestrelData(:,reorderVector(j));
% end
% 
% % fKestrelData(:,2) = tempKestrelData(:,6); % Headwind
% % fKestrelData(:,3) = tempKestrelData(:,12); % Crosswind
% % fKestrelData(:,4) = tempKestrelData(:,9); % Magnetic Direction
% % fKestrelData(:,5) = tempKestrelData(:,15); % True Direction
% % fKestrelData(:,6) = tempKestrelData(:,14);
% % fKestrelData(:,2) = tempKestrelData(:,11);
% % fKestrelData(:,2) = tempKestrelData(:,8);
% % fKestrelData(:,2) = tempKestrelData(:,13);
% % fKestrelData(:,2) = tempKestrelData(:,10);
% % fKestrelData(:,2) = tempKestrelData(:,4);
% % fKestrelData(:,2) = tempKestrelData(:,5);
% % fKestrelData(:,2) = tempKestrelData(:,2);
% % fKestrelData(:,2) = tempKestrelData(:,3);
% % fKestrelData(:,2) = tempKestrelData(:,7);
% 
% clear tempKestrelData;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setappdata(handles.guiMain,'fKestrelData',fKestrelData)

nRows = length(timeStr); % number of rows (amount of data points collected)

% initialize outside of loop for faster performance
tableDate(nRows,1) = ""; 
tableTime(nRows,2) = "";

declutterDates = missing;  % used to avoid redundant date values flooding table

for j=1:nRows
    tempDateTime = strsplit(timeStr(j,:)); % separate date and time
    tableDate(j) = tempDateTime(1,1); % set date
    tableTime(j) = tempDateTime(1,2); % set time
    
    % evaluate redundancy of date
    if  tableDate(j) ~= declutterDates 
        declutterDates = tableDate(j,1);
    else
        tableDate(j,1) = missing;
    end
        
end

% strsplit only works with strings. However, conversion into char is
% necessary because cells can only contain chars
tableDate = convertStringsToChars(tableDate);
tableTime = convertStringsToChars(tableTime);

% concatenate date and time with the remaining data, convert into cells
% (because tables use cells)
fTable = cat(2,tableDate,table2cell(kestrelData));
setappdata(gcf,'fTable',cell2table(fTable));
set(handles.guiTable,'Data',fTable);
set(handles.guiTable,'RowName',tableTime);

clear kestrelData;

% Proceed to plot state 1 (the first graph)
setappdata(handles.guiMain,'state',1);
kestrelPlot(handles,handles.guiMain)


%% PLOT ----------------------------------------------------------
function kestrelPlot(handles,fig)
mainFig = handles.guiMain;

% Get axes data
t = getappdata(mainFig,'t');
fKestrelData = getappdata(mainFig,'fKestrelData');

% Get State
state = getappdata(mainFig,'state');

% Title and units Array
titulo = {'Wind Speed','Barometric Pressure','Density Altitude','Relative Humidity','Station Pressure','Headwind','Altitude','Dew Point','Magnetic Direction','Wet Bulb','Wind Chill','Crosswind','Heat Stress Index','Temperature','True Direction'};
units = {'m/s','mb','m','%','mb','mps','m','Celsius','Degrees','Celsius','Celsius','m/s','Celsius','Celsius','Degrees'};

% Determine Smoothing Factor
smoothness = get(handles.smoothSlider,'Value')*length(t) + 1;
smoothness = round(smoothness);
smoothPlotData = smooth(fKestrelData(:,state),smoothness);

% Plot the data!    
plot(t,smoothPlotData);

%------ Context Menu
if gcf == handles.guiMain
    c = uicontextmenu;
    
    handles.guiMain.UIContextMenu = c;
    handles.plotArea.UIContextMenu = c;
    m1 = uimenu(c,'Label','Copy screen','Callback',@copy2Clipboard);  
    m2 = uimenu(c,'Label','Copy graph only','Callback',@copy2Clipboard);
end
%------

% Title
title(titulo(state));
% Label
ylabel(units(state));
% Average
average = mean(smoothPlotData);
set(handles.meanOut,'String',average);
% Calculate Max and Min
[maximum,maxI] = max(smoothPlotData);
[minimum,minI] = min(smoothPlotData);
set(handles.maxOut,'String',maximum);
set(handles.minOut,'String',minimum);
% Plot Max and Min
hold on
plot(t(maxI),smoothPlotData(maxI),'or','MarkerSize',7);
plot(t(minI),smoothPlotData(minI),'ob','MarkerSize',7);
hold off



%% COPY 2 CLIPBOARD
function copy2Clipboard(source,callbackdata)

% Enhanced Clipboard copy functionality is only available in Windows OS
% according to Matlab help menu for the print function

if ~ispc
    copyType = '-dmeta';
else
    copyType = '-dbitmap';
end

switch source.Label
    case 'Copy screen'
       print('-clipboard',copyType);
    case 'Copy graph only'
        print('-clipboard', copyType ,'-noui');
end


%% CYCLE RIGHT ----------------------------------------------------
% --- Executes on button press in cycleRight.-----------------------------
function cycleRight_Callback(hObject, eventdata, handles)
% hObject    handle to cycleRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get State
state = getappdata(gcf,'state');

% Cycle between 15 parameters
state = state + 1;
if state == 16
    state = 1;
end

setappdata(gcf,'state',state);
kestrelPlot(handles,handles.guiMain);


%% CYCLE LEFT
% --- Executes on button press in cycleLeft.------------------------------
function cycleLeft_Callback(hObject, eventdata, handles)
% hObject    handle to cycleLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

state = getappdata(gcf,'state');
state = mod(state - 1,15); % Cycle back
if state == 0    % There is no index zero in Matlab
   state = 15;
end
setappdata(gcf,'state',state);
kestrelPlot(handles,handles.guiMain);

%% GRAPH BUTTON ---------------------------------------------------
% --- Executes on button press in graphButton.---------------------------
function graphButton_Callback(hObject, eventdata, handles)
% hObject    handle to graphButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphButton

set(handles.graphButton,'Value',1);
set(handles.tableButton,'Value',0);
set(handles.guiTable,'Visible','off');
set(handles.Smoothing,'Visible','on');
set(handles.smoothSlider,'Visible','on');

%% TABLE BUTTON ---------------------------------------------------
% --- Executes on button press in tableButton. --------------------------
function tableButton_Callback(hObject, eventdata, handles)
% hObject    handle to tableButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tableButton

set(handles.tableButton,'Value',1);
set(handles.graphButton,'Value',0);
set(handles.guiTable,'Visible','on');
set(handles.Smoothing,'Visible','off');
set(handles.smoothSlider,'Visible','off');

%% SMOOTH SLIDER --------------------------------------------------
% --- Executes on slider movement.----------------------------------------
function smoothSlider_Callback(hObject, eventdata, handles)
% hObject    handle to smoothSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
position = get(handles.smoothSlider,'Value')*100;
set(handles.smoothSlider,'Value',position/100);

kestrelPlot(handles,handles.guiMain);

%% OPEN ---------------------------------------------------------
% --- Called by toolbar icon -------------------------------------------
function openButton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
browseButton_Callback(handles.browseButton, eventdata, handles);

%% SAVE ---------------------------------------------------------
% --- Called by toolbar icon -------------------------------------------
function saveButton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

saveStyle = chooseSaveType;

[filename,path] = uiputfile('*.png','Save as Image','Kestrel.png');

switch saveStyle
    case 'Current Figure'
       print(strcat(path,filename),'-dpng');
    case 'Current Graph'
       print(strcat(path,filename),'-noui','-dpng');
    case 'All Graphs'
         fig = 'allSubplot';
         kestrelPlot(handles,fig)
end
 
% saveas(gcf,strcat(path,filename)) <-- Replaced saveas by print to avoid
% creation of additional figures thanks to the '-noui' argument.

%% GOALS

% Unify graphs
% Detect Units
% Buttons with images
% DONE: Separate figure
% DONE: Hyperlinks
% Highlight Table
% Modify graph via Table
% DONE: Modify smoothness via Slider
% Two files on same graph
% DONE: Smoothness range based on amount of data
% DONE: Eliminate global


% --------------------------------------------------------------------
function githubButton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to githubButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://github.com/sosavle/Kestrel5500-Visualizer','-browser');


% --------------------------------------------------------------------
function windRosebutton_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to windRosebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%         This function was pubicly available online                   %%%
%%%   Credits to Daniel Pereira - daniel.pereira.valades@gmail.com       %%%
%%% https://www.mathworks.com/matlabcentral/fileexchange/47248-wind-rose %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fKestrelData = getappdata(handles.guiMain,'fKestrelData');
windRose = WindRose(fKestrelData(:,15), fKestrelData(:,1));
windRose.Color = [0.94 0.94 0.94];
windRose.NumberTitle = 'off';
windRose.Name = 'Wind Rose';
