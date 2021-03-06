function varargout = transactionswindows(varargin)
% TRANSACTIONSWINDOWS MATLAB code for transactionswindows.fig
%      TRANSACTIONSWINDOWS, by itself, creates a new TRANSACTIONSWINDOWS or raises the existing
%      singleton*.
%
%      H = TRANSACTIONSWINDOWS returns the handle to a new TRANSACTIONSWINDOWS or the handle to
%      the existing singleton*.
%
%      TRANSACTIONSWINDOWS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSACTIONSWINDOWS.M with the given input arguments.
%
%      TRANSACTIONSWINDOWS('Property','Value',...) creates a new TRANSACTIONSWINDOWS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transactionswindows_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transactionswindows_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transactionswindows

% Last Modified by GUIDE v2.5 04-Dec-2011 15:12:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transactionswindows_OpeningFcn, ...
                   'gui_OutputFcn',  @transactionswindows_OutputFcn, ...
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


% --- Executes just before transactionswindows is made visible.
function transactionswindows_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transactionswindows (see VARARGIN)

% Choose default command line output for transactionswindows
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transactionswindows wait for user response (see UIRESUME)
% uiwait(handles.transactionsfigure);


% --- Outputs from this function are returned to the command line.
function varargout = transactionswindows_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in transactionsokay.
function transactionsokay_Callback(hObject, eventdata, handles)
% hObject    handle to transactionsokay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes during object creation, after setting all properties.
function transactionstable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transactionstable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global transactions
global type
ntransactions = transactions.Value(strcmp(transactions.Value(:,6), type),:);
date = ntransactions(:,1:5);
date = cell2mat(date);
[r ~] = size(date);
date = [date,zeros(r,1)];
ntransactions = [ntransactions,cellstr(datestr(date))];
if strcmp(type, 'Checking')
    ntransactions = [{ntransactions{:,7}}',{ntransactions{:,8}}',{ntransactions{:,9}}',{ntransactions{:,11}}'];
else
    ntransactions = [{ntransactions{:,7}}',{ntransactions{:,8}}',{ntransactions{:,10}}',{ntransactions{:,11}}'];
end
set(hObject,'Data',ntransactions);


% --- Executes during object creation, after setting all properties.
function transcationstext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transcationstext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global type
if strcmp(type, 'Checking')
    dialoguestring = 'Checking Account Transactions';
else
    dialoguestring = 'Savings Account Transactions';
end
set(hObject,'String',dialoguestring)
