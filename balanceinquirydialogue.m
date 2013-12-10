function varargout = balanceinquirydialogue(varargin)
% BALANCEINQUIRYDIALOGUE MATLAB code for balanceinquirydialogue.fig
%      BALANCEINQUIRYDIALOGUE, by itself, creates a new BALANCEINQUIRYDIALOGUE or raises the existing
%      singleton*.
%
%      H = BALANCEINQUIRYDIALOGUE returns the handle to a new BALANCEINQUIRYDIALOGUE or the handle to
%      the existing singleton*.
%
%      BALANCEINQUIRYDIALOGUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BALANCEINQUIRYDIALOGUE.M with the given input arguments.
%
%      BALANCEINQUIRYDIALOGUE('Property','Value',...) creates a new BALANCEINQUIRYDIALOGUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before balanceinquirydialogue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to balanceinquirydialogue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above balanceinquirydialoguetext to modify the response to help balanceinquirydialogue

% Last Modified by GUIDE v2.5 01-Dec-2011 02:02:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @balanceinquirydialogue_OpeningFcn, ...
                   'gui_OutputFcn',  @balanceinquirydialogue_OutputFcn, ...
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


% --- Executes just before balanceinquirydialogue is made visible.
function balanceinquirydialogue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to balanceinquirydialogue (see VARARGIN)

% Choose default command line output for balanceinquirydialogue
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes balanceinquirydialogue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = balanceinquirydialogue_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in balanceinquirydialogueokay.
function balanceinquirydialogueokay_Callback(hObject, eventdata, handles)
% hObject    handle to balanceinquirydialogueokay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes during object creation, after setting all properties.
function balanceinquirydialoguetext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to balanceinquirydialoguetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global type
global check
global accounts
if strcmp(type, 'Checking')
    balancestring = ['Your Checking Account Balance is: $' num2str(accounts.Value{check,4})];
else
    balancestring = ['Your Savings Account Balance is: $' num2str(accounts.Value{check,5})];
end
set(hObject,'String',balancestring)
