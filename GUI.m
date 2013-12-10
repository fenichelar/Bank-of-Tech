function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 07-Dec-2011 12:11:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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

% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.GUIfigure);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function account_Callback(hObject, eventdata, handles)
% hObject    handle to account (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function changep_Callback(hObject, eventdata, handles)
% hObject    handle to changep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
global accounts
mode = 'PIN';
global amount
global check
waitfor(dialogue)
if numel(num2str(amount))==4
    accounts.Value{check,3} = num2str(amount);
else
    waitfor(amounterror)
    changep_Callback
end

% --------------------------------------------------------------------
function trends_Callback(hObject, eventdata, handles)
% hObject    handle to trends (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function deposit_Callback(hObject, eventdata, handles)
% hObject    handle to deposit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
mode = 'Deposit';

% --------------------------------------------------------------------
function withdraw_Callback(hObject, eventdata, handles)
% hObject    handle to withdraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
mode = 'Withdraw';

% --------------------------------------------------------------------
function transfer_Callback(hObject, eventdata, handles)
% hObject    handle to transfer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
mode = 'Transfer';

% --------------------------------------------------------------------
function withdrawchecking_Callback(hObject, eventdata, handles)
% hObject    handle to withdrawchecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Checking';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    if accounts.Value{check,4} - amount>=0
        accounts.Value{check,4} = accounts.Value{check,4} - amount;
        addtransactions;
    else
        amounterror
    end
end

% --------------------------------------------------------------------
function withdrawsavings_Callback(hObject, eventdata, handles)
% hObject    handle to withdrawsavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Savings';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    if accounts.Value{check,5} - amount>=0
        accounts.Value{check,5} = accounts.Value{check,5} - amount;
        addtransactions;
    else
        amounterror
    end
end

% --------------------------------------------------------------------
function depositchecking_Callback(hObject, eventdata, handles)
% hObject    handle to depositchecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Checking';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    accounts.Value{check,4} = accounts.Value{check,4} + amount;
    addtransactions;
end

% --------------------------------------------------------------------
function depositsavings_Callback(hObject, eventdata, handles)
% hObject    handle to depositsavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Savings';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    accounts.Value{check,5} = accounts.Value{check,5} + amount;
    addtransactions;
end

% --------------------------------------------------------------------
function inquirychecking_Callback(hObject, eventdata, handles)
% hObject    handle to inquirychecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Checking';
balanceinquirydialogue


% --------------------------------------------------------------------
function inquirysavings_Callback(hObject, eventdata, handles)
% hObject    handle to inquirysavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Savings';
balanceinquirydialogue


% --------------------------------------------------------------------
function logout_Callback(hObject, eventdata, handles)
% hObject    handle to logout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all

% --------------------------------------------------------------------
function transferchecking_Callback(hObject, eventdata, handles)
% hObject    handle to transferchecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Checking';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    if accounts.Value{check,4} - amount>=0
        accounts.Value{check,4} = accounts.Value{check,4} - amount;
        addtransactions;
        type = 'Savings';
        accounts.Value{check,5} = accounts.Value{check,5} + amount;
        addtransactions;
    else
        amounterror
    end
end

% --------------------------------------------------------------------
function transfersavings_Callback(hObject, eventdata, handles)
% hObject    handle to transfersavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
global accounts
type = 'Savings';
global amount
global check
waitfor(dialogue)
if ~islogical(amount)
    if accounts.Value{check,5} - amount>=0
        accounts.Value{check,5} = accounts.Value{check,5} - amount;
        addtransactions;
        type = 'Checking';
        accounts.Value{check,4} = accounts.Value{check,4} + amount;
        addtransactions;
    else
        amounterror
    end
end

% --------------------------------------------------------------------
function transactionschecking_Callback(hObject, eventdata, handles)
% hObject    handle to transactionschecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Checking';
transactionswindows


% --------------------------------------------------------------------
function transactionssavings_Callback(hObject, eventdata, handles)
% hObject    handle to transactionssavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Savings';
transactionswindows


% --------------------------------------------------------------------
function transactions_Callback(hObject, eventdata, handles)
% hObject    handle to transactions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function inquiry_Callback(hObject, eventdata, handles)
% hObject    handle to inquiry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function GUIfigure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GUIfigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function trendschecking_Callback(hObject, eventdata, handles)
% hObject    handle to trendschecking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Checking';
trendsswindows

% --------------------------------------------------------------------
function trendssavings_Callback(hObject, eventdata, handles)
% hObject    handle to trendssavings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
type = 'Savings';
trendsswindows


% --- Executes when user attempts to close GUIfigure.
function GUIfigure_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to GUIfigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
global file
file.Save;
delete(hObject);
welcome


% --- Executes during object creation, after setting all properties.
function axesGUI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
imshow('techtower.png');
