function varargout = amounterror(varargin)
% AMOUNTERROR MATLAB code for amounterror.fig
%      AMOUNTERROR, by itself, creates a new AMOUNTERROR or raises the existing
%      singleton*.
%
%      H = AMOUNTERROR returns the handle to a new AMOUNTERROR or the handle to
%      the existing singleton*.
%
%      AMOUNTERROR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMOUNTERROR.M with the given input arguments.
%
%      AMOUNTERROR('Property','Value',...) creates a new AMOUNTERROR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before amounterror_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to amounterror_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above amounterrortext to modify the response to help amounterror

% Last Modified by GUIDE v2.5 01-Dec-2011 02:00:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @amounterror_OpeningFcn, ...
                   'gui_OutputFcn',  @amounterror_OutputFcn, ...
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


% --- Executes just before amounterror is made visible.
function amounterror_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to amounterror (see VARARGIN)

% Choose default command line output for amounterror
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes amounterror wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = amounterror_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in amounterrorokay.
function amounterrorokay_Callback(hObject, eventdata, handles)
% hObject    handle to amounterrorokay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes during object creation, after setting all properties.
function amounterrortext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amounterrortext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
