function varargout = loginerror(varargin)
% LOGINERROR MATLAB code for loginerror.fig
%      LOGINERROR, by itself, creates a new LOGINERROR or raises the existing
%      singleton*.
%
%      H = LOGINERROR returns the handle to a new LOGINERROR or the handle to
%      the existing singleton*.
%
%      LOGINERROR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGINERROR.M with the given input arguments.
%
%      LOGINERROR('Property','Value',...) creates a new LOGINERROR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before loginerror_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to loginerror_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help loginerror

% Last Modified by GUIDE v2.5 04-Dec-2011 15:13:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @loginerror_OpeningFcn, ...
                   'gui_OutputFcn',  @loginerror_OutputFcn, ...
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


% --- Executes just before loginerror is made visible.
function loginerror_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to loginerror (see VARARGIN)

% Choose default command line output for loginerror
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes loginerror wait for user response (see UIRESUME)
% uiwait(handles.loginerrorfigure);


% --- Outputs from this function are returned to the command line.
function varargout = loginerror_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loginerrortryagain.
function loginerrortryagain_Callback(hObject, eventdata, handles)
% hObject    handle to loginerrortryagain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
