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

% Last Modified by GUIDE v2.5 04-Jan-2019 22:50:32

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
% uiwait(handles.figure1);

 set(gcf,'toolbar','figure');

% --- Outputs from this function are returned to the command line.
function varargout = Kestrel5500_visualizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cycleLeft.
function cycleLeft_Callback(hObject, eventdata, handles)
% hObject    handle to cycleLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

state = get(handles.plotArea,'UserData'); % Get state
state = mod(state - 2,15); % Cycle back
if state == 0    % There is no index zero in Matlab
   state = 15;
end
set(handles.plotArea,'UserData',state);
cycleRight_Callback(handles.cycleRight, eventdata, handles); % Cycle right callback plots



% --- Executes on button press in cycleRight.
function cycleRight_Callback(hObject, eventdata, handles)
% hObject    handle to cycleRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global fKestrelData;
global unitIn;

% Get State
state = get(handles.plotArea,'UserData');
% Title and units Array
titulo = {'Wind Speed','Barometric Pressure','Density Altitude','Relative Humidity','Station Pressure','Headwind','Altitude','Dew Point','Magnetic Direction','Wet Bulb','Wind Chill','Crosswind','Heat Stress Index','Temperature','True Direction'};

%if unitIn(2) =

units = {'m/s','mb','m','%','mb','mps','m','Celsius','Degrees','Celsius','Celsius','m/s','Celsius','Celsius','Degrees'};
%units = table2array(unitIn);
%units = units(state+1);

% Plot
smoothness = get(handles.smoothSlider,'Value')*20 + 1;
smoothPlotData = smooth(fKestrelData(:,state),smoothness);
plot(t,smoothPlotData);
title(titulo(state));
% Label
ylabel(units(state));
% Average
%average = mean(smoothPlotData(:,state));
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

% Cycle between 15 parameters
state = state + 1;
if state == 16
    state = 1;
end
set(handles.plotArea,'UserData',state);

% --------------DEPRECATED CODE------------- %
%  REASON: Excesive use of switch statements
%  SOLUTION: Change data from table to array


% switch state
%     
%     case 0
%           plot(t,fKestrelData(:,1));
%           title('Wind Speed');
%           set(handles.meanOut,'String',mean(fKestrelData.WindSpeed));
%           units = 'm/s';
%           ylabel(units);
%           [maximum,maxI] = max(fKestrelData.WindSpeed);
%           [minimum,minI] = min(fKestrelData.WindSpeed);
%           set(handles.maxOut,'String',maximum);
%           set(handles.minOut,'String',minimum);
%           hold on
%           plot(t(maxI),fKestrelData.WindSpeed(maxI),'or','MarkerSize',7);
%           plot(t(minI),fKestrelData.WindSpeed(minI),'ob','MarkerSize',7);
%           hold off
%     case 1
%           plot(t,smooth(fKestrelData.BarometricPressure,15));
%           title('Barometric Pressure')
%           set(handles.meanOut,'String',mean(fKestrelData.BarometricPressure));
%           ylabel('mbar');
%           set(handles.maxOut,'String',max(fKestrelData.BarometricPressure));
%           set(handles.minOut,'String',min(fKestrelData.BarometricPressure));
%      case 2
%           plot(t,fKestrelData.DensityAltitude);
%           title('Density Altitude')
%           set(handles.meanOut,'String',mean(fKestrelData.DensityAltitude));
%           ylabel('m');
%           set(handles.maxOut,'String',max(fKestrelData.DensityAltitude));
%           set(handles.minOut,'String',min(fKestrelData.DensityAltitude));
%      case 3
%           plot(t,fKestrelData.RelativeHumidity);
%           title('Relative Humidity')
%           set(handles.meanOut,'String',mean(fKestrelData.RelativeHumidity));
%           ylim([0 100]);
%           ylabel('%');
%           set(handles.maxOut,'String',max(fKestrelData.RelativeHumidity));
%           set(handles.minOut,'String',min(fKestrelData.RelativeHumidity));
%      case 4
%           plot(t,smooth(fKestrelData.StationPressure,15));
%           title('Station Pressure')
%           set(handles.meanOut,'String',mean(fKestrelData.StationPressure));
%           ylabel('mbar');
%           set(handles.maxOut,'String',max(fKestrelData.StationPressure));
%           set(handles.minOut,'String',min(fKestrelData.StationPressure));
%      case 5
%           plot(t,fKestrelData.Headwind);
%           title('Headwind')
%           set(handles.meanOut,'String',mean(fKestrelData.Headwind));
%           ylabel('m/s');
%           set(handles.maxOut,'String',max(fKestrelData.Headwind));
%           set(handles.minOut,'String',min(fKestrelData.Headwind));
%      case 6
%           plot(t,fKestrelData.Altitude);
%           title('Altitude')
%           set(handles.meanOut,'String',mean(fKestrelData.Altitude));
%           ylabel('m');
%           set(handles.maxOut,'String',max(fKestrelData.Altitude));
%           set(handles.minOut,'String',min(fKestrelData.Altitude));
%      case 7
%           plot(t,fKestrelData.DewPoint);
%           title('Dew Point')
%           set(handles.meanOut,'String',mean(fKestrelData.DewPoint));
%           ylabel('ÅãC');
%           set(handles.maxOut,'String',max(fKestrelData.DewPoint));
%           set(handles.minOut,'String',min(fKestrelData.DewPoint));
%      case 8
%           plot(t,fKestrelData.PsychroWetBulbTemperature);
%           title('Psychro Wet Bulb Temperature')
%           set(handles.meanOut,'String',mean(fKestrelData.PsychroWetBulbTemperature));
%           ylabel('ÅãC');
%           set(handles.maxOut,'String',max(fKestrelData.PsychroWetBulbTemperature));
%           set(handles.minOut,'String',min(fKestrelData.PsychroWetBulbTemperature));
%      case 9
%           plot(t,fKestrelData.WindChill);
%           title('Wind Chill')
%           set(handles.meanOut,'String',mean(fKestrelData.WindChill));
%           ylabel('ÅãC');
%           set(handles.maxOut,'String',max(fKestrelData.WindChill));
%           set(handles.minOut,'String',min(fKestrelData.WindChill));
%     case 10
%           plot(t,fKestrelData.Crosswind);
%           title('Crosswind')
%           set(handles.meanOut,'String',mean(fKestrelData.Crosswind));
%           ylabel('m/s');
%           set(handles.maxOut,'String',max(fKestrelData.Crosswind));
%           set(handles.minOut,'String',min(fKestrelData.Crosswind));
%     case 11
%           plot(t,fKestrelData.HeatStressIndex);
%           title('Heat Stress Index')
%           set(handles.meanOut,'String',mean(fKestrelData.HeatStressIndex));
%           ylabel('ÅãC');
%           set(handles.maxOut,'String',max(fKestrelData.HeatStressIndex));
%           set(handles.minOut,'String',min(fKestrelData.HeatStressIndex));
%     case 12
%           plot(t,fKestrelData.Temperature);
%           title('Temperature')
%           set(handles.meanOut,'String',mean(fKestrelData.Temperature));
%           ylabel('ÅãC');
%           set(handles.maxOut,'String',max(fKestrelData.Temperature));
%           set(handles.minOut,'String',min(fKestrelData.Temperature));
%     case 13
%           plot(t,fKestrelData.Direction_True);
%           title('True Direction ')
%           set(handles.meanOut,'String',mean(fKestrelData.Direction_True));
%           ylim([0 360]);
%           yticks([0 90 180 360]);
%           ylabel('Åã');
%           set(handles.maxOut,'String',max(fKestrelData.Direction_True));
%           set(handles.minOut,'String',min(fKestrelData.Direction_True));
%     case 14
%           plot(t,fKestrelData.Direction_Mag);
%           title('Magnetic Direction')
%           set(handles.meanOut,'String',mean(fKestrelData.Direction_Mag));
%           ylim([0 360]);
%           yticks([0 90 180 360]);
%           ylabel('Åã');
%           set(handles.maxOut,'String',max(fKestrelData.Direction_Mag));
%           set(handles.minOut,'String',min(fKestrelData.Direction_Mag));
% end

       
    
    




function meanOut_Callback(hObject, eventdata, handles)
% hObject    handle to meanOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meanOut as text
%        str2double(get(hObject,'String')) returns contents of meanOut as a double


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



function directoryDisp_Callback(hObject, eventdata, handles)
% hObject    handle to directoryDisp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of directoryDisp as text
%        str2double(get(hObject,'String')) returns contents of directoryDisp as a double


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


% --- Executes on button press in browseButton.
function browseButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Browse for a file and display filepath
global fKestrelData;
global unitIn;
[file, path] = uigetfile('*.csv');
directory = fullfile(path,file);
set(handles.directoryDisp, 'string', directory);
kestrelData = readtable(directory,'HeaderLines',3); % Delete top of sheet


unitIn = kestrelData(1,:); % Extract unit cells
writetable(kestrelData,'kestrelData');
% Save the edited file and re-open it (necessary to eliminate ' ' enclosing values)
opts = detectImportOptions('KestrelData.txt');
opts.VariableTypes(1) = {'string'};
kestrelData = readtable('KestrelData.txt',opts);
clear opts;
% delete KestrelData.txt


% Barometic and Station Pressure arrays are stored as cells, so they must
% be converted to doubles for analysis. Since the values include commas,
% string is used as an intermediate

if iscell(kestrelData.BarometricPressure)
kestrelData.BarometricPressure = cell2mat(kestrelData.BarometricPressure);

BP = zeros(length(kestrelData.BarometricPressure),1);
for j = 1:length(kestrelData.BarometricPressure)
    BP(j,:) = str2double(kestrelData.BarometricPressure(j,:));
end
    kestrelData.BarometricPressure = BP;
    clear BP;
end

if iscell(kestrelData.StationPressure)
    
kestrelData.StationPressure = cell2mat(kestrelData.StationPressure);

SP = zeros(length(kestrelData.BarometricPressure),1);
for j = 1:length(kestrelData.StationPressure)
   SP(j,:) = str2double(kestrelData.StationPressure(j,:));
end
    kestrelData.StationPressure = SP;
    clear SP;
end


%formattedDateTime = kestrelData(:,1);
% barometricPressure = kestrelData(:,2);
% densityAltitude = kestrelData(:,3);
% relativeHumidity =  kestrelData(:,4);
% stationPressure =  kestrelData(:,5);
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


global t;
timeStr = kestrelData.FORMATTEDDATE_TIME;
t = datetime(timeStr);
% date & time require special treatment, so they are isolated
kestrelData.FORMATTEDDATE_TIME = [];
% array form avoids redundant switch statements
fKestrelData = table2array(kestrelData); 

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
fTable = cell(cat(2,tableDate,table2cell(kestrelData)));
set(handles.guiTable,'Data',fTable);

set(handles.guiTable,'RowName',tableTime);

clear kestrelData;

set(handles.plotArea,'UserData',1);
cycleRight_Callback(handles.cycleRight, eventdata, handles);

%% GOALS

% Unify graphs
% Detect Units
% Buttons with images
% Separate figure
% Hyperlinks
% Highlight Table
% Modify graph via Table
% Modify smoothness via Slider
% Two files on same graph


function minOut_Callback(hObject, eventdata, handles)
% hObject    handle to minOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minOut as text
%        str2double(get(hObject,'String')) returns contents of minOut as a double


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



function maxOut_Callback(hObject, eventdata, handles)
% hObject    handle to maxOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxOut as text
%        str2double(get(hObject,'String')) returns contents of maxOut as a double


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


% --- Executes on button press in gitHub.
function gitHub_Callback(hObject, eventdata, handles)
% hObject    handle to gitHub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graphButton.
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


% --- Executes on button press in tableButton.
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


% --- Executes on slider movement.
function smoothSlider_Callback(hObject, eventdata, handles)
% hObject    handle to smoothSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
position = get(handles.smoothSlider,'Value')*100;
position = round(position);
set(handles.smoothSlider,'Value',position/100);

state = get(handles.plotArea,'UserData'); % Get state
state = mod(state - 1,15); % Cycle back
if state == 0    % There is no index zero in Matlab
   state = 15;
end

set(handles.plotArea,'UserData',state);
cycleRight_Callback(handles.cycleRight, eventdata, handles);



% --- Executes during object creation, after setting all properties.
function smoothSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smoothSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
