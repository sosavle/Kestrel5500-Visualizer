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

% Last Modified by GUIDE v2.5 23-Dec-2018 18:10:11

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

state = get(handles.plotArea,'UserData');
set(handles.plotArea,'UserData',state - 2);
cycleRight_Callback(handles.cycleRight, eventdata, handles);



% --- Executes on button press in cycleRight.
function cycleRight_Callback(hObject, eventdata, handles)
% hObject    handle to cycleRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global fKestrelData;

state = get(handles.plotArea,'UserData');
switch state
    
    case 0
          plot(t,fKestrelData.WindSpeed);
          title('Wind Speed');
          set(handles.meanOut,'String',mean(fKestrelData.WindSpeed));
          ylabel('m/s');
    case 1
          plot(t,smooth(fKestrelData.BarometricPressure,15));
          title('Barometric Pressure')
          set(handles.meanOut,'String',mean(fKestrelData.BarometricPressure));
          ylabel('mbar');
     case 2
          plot(t,fKestrelData.DensityAltitude);
          title('Density Altitude')
          set(handles.meanOut,'String',mean(fKestrelData.DensityAltitude));
          ylabel('m');
     case 3
          plot(t,fKestrelData.RelativeHumidity);
          title('Relative Humidity')
          set(handles.meanOut,'String',mean(fKestrelData.RelativeHumidity));
          ylim([0 100]);
          ylabel('%');
     case 4
          plot(t,smooth(fKestrelData.StationPressure,15));
          title('Station Pressure')
          set(handles.meanOut,'String',mean(fKestrelData.StationPressure));
          ylabel('mbar');
     case 5
          plot(t,fKestrelData.Headwind);
          title('Headwind')
          set(handles.meanOut,'String',mean(fKestrelData.Headwind));
          ylabel('m/s');
     case 6
          plot(t,fKestrelData.Altitude);
          title('Altitude')
          set(handles.meanOut,'String',mean(fKestrelData.Altitude));
          ylabel('m');
     case 7
          plot(t,fKestrelData.DewPoint);
          title('Dew Point')
          set(handles.meanOut,'String',mean(fKestrelData.DewPoint));
          ylabel('ÅãC');
     case 8
          plot(t,fKestrelData.PsychroWetBulbTemperature);
          title('Psychro Wet Bulb Temperature')
          set(handles.meanOut,'String',mean(fKestrelData.PsychroWetBulbTemperature));
          ylabel('ÅãC');
     case 9
          plot(t,fKestrelData.WindChill);
          title('Wind Chill')
          set(handles.meanOut,'String',mean(fKestrelData.WindChill));
          ylabel('ÅãC');
    case 10
          plot(t,fKestrelData.Crosswind);
          title('Crosswind')
          set(handles.meanOut,'String',mean(fKestrelData.Crosswind));
          ylabel('m/s');
    case 11
          plot(t,fKestrelData.HeatStressIndex);
          title('Heat Stress Index')
          set(handles.meanOut,'String',mean(fKestrelData.HeatStressIndex));
          ylabel('ÅãC');
    case 12
          plot(t,fKestrelData.Temperature);
          title('Temperature')
          set(handles.meanOut,'String',mean(fKestrelData.Temperature));
          ylabel('ÅãC');
    case 13
          plot(t,fKestrelData.Direction_True);
          title('True Direction ')
          set(handles.meanOut,'String',mean(fKestrelData.Direction_True));
          ylim([0 360]);
          yticks([0 90 180 360]);
          ylabel('Åã');
    case 14
          plot(t,fKestrelData.Direction_Mag);
          title('Magnetic Direction')
          set(handles.meanOut,'String',mean(fKestrelData.Direction_Mag));
          ylim([0 360]);
          yticks([0 90 180 360]);
          ylabel('Åã');
end

% Cycle between 15 parameters
state = mod(state + 1,15);
set(handles.plotArea,'UserData',state);

       
    
    




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
[file, path] = uigetfile('*.csv');
directory = fullfile(path,file);
set(handles.directoryDisp, 'string', directory);
kestrelData = readtable(directory,'HeaderLines',3); %Delete top of sheet
writetable(kestrelData,'kestrelData');
% Save the edited file and re-open it
opts = detectImportOptions('KestrelData.txt');
kestrelData = readtable('KestrelData.txt',opts);

% Barometic and Station Pressure arrays are stored as cells, so they must
% be converted to doubles for analysis. Since the values include commas,
% string is used as an intermediate

kestrelData.BarometricPressure = cell2mat(kestrelData.BarometricPressure);
kestrelData.StationPressure = cell2mat(kestrelData.StationPressure);

BP = zeros(length(kestrelData.BarometricPressure),1);
for j = 1:length(kestrelData.BarometricPressure)
    BP(j,:) = str2double(kestrelData.BarometricPressure(j,:));
end
    kestrelData.BarometricPressure = BP;

SP = zeros(length(kestrelData.BarometricPressure),1);
for j = 1:length(kestrelData.StationPressure)
   SP(j,:) = str2double(kestrelData.StationPressure(j,:));
end
    kestrelData.StationPressure = SP;
        
fKestrelData = kestrelData;

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
t = datetime(kestrelData.FORMATTEDDATE_TIME);
%t.Format = 'HH:mm';

set(handles.plotArea,'UserData',0);
cycleRight_Callback(handles.cycleRight, eventdata, handles);
