function varargout = welcome(varargin)
% welcome MATLAB code for welcome.fig
%      welcome, by itself, creates a welcomenew welcome or raises the existing
%      singleton*.
%
%      H = welcome returns the handle to a welcomenew welcome or the handle to
%      the existing singleton*.
%
%      welcome('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in welcome.M with the given input arguments.
%
%      welcome('Property','Value',...) creates a welcomenew welcome or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the welcome before welcome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to welcome_OpeningFcn via varargin.
%
%      *See welcome Options on GUIDE's Tools menu.  Choose "welcome allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help welcome

% Last Modified by GUIDE v2.5 06-Dec-2011 16:41:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @welcome_OpeningFcn, ...
                   'gui_OutputFcn',  @welcome_OutputFcn, ...
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


% --- Executes just before welcome is made visible.
function welcome_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to welcome (see VARARGIN)

% Choose default command line output for welcome
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes welcome wait for user response (see UIRESUME)
% uiwait(handles.welcomefigure);

% --- Outputs from this function are returned to the command line.
function varargout = welcome_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function welcomeaccount_Callback(hObject, eventdata, handles)
% hObject    handle to welcomeaccount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function welcomelogin_Callback(hObject, eventdata, handles)
% hObject    handle to welcomelogin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c
c = false;
close all
login

% --------------------------------------------------------------------
function welcomenew_Callback(hObject, eventdata, handles)
% hObject    handle to welcomenew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c
c = false;
close all
newaccount

% --------------------------------------------------------------------
function welcomexit_Callback(hObject, eventdata, handles)
% hObject    handle to welcomexit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c
c = true;
close all


% --- Executes during object creation, after setting all properties.
function welcomefigure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to welcomefigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close welcomefigure.
function welcomefigure_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to welcomefigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
global c
if c
    global file
    global excel
    file.Save;
    file.Close(false);
    excel.Quit
    clear all
    clc
end
