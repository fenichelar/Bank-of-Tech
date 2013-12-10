function varargout = newaccount(varargin)
% NEWACCOUNT MATLAB code for newaccount.fig
%      NEWACCOUNT, by itself, creates a new NEWACCOUNT or raises the existing
%      singleton*.
%
%      H = NEWACCOUNT returns the handle to a new NEWACCOUNT or the handle to
%      the existing singleton*.
%
%      NEWACCOUNT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWACCOUNT.M with the given input arguments.
%
%      NEWACCOUNT('Property','Value',...) creates a new NEWACCOUNT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newaccount_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newaccount_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newaccount

% Last Modified by GUIDE v2.5 04-Dec-2011 15:13:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newaccount_OpeningFcn, ...
                   'gui_OutputFcn',  @newaccount_OutputFcn, ...
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

% --- Executes just before newaccount is made visible.
function newaccount_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newaccount (see VARARGIN)

% Choose default command line output for newaccount
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global accountinfo
accountinfo.SavingsBalance = 0;
accountinfo.CheckingBalance = 0;
accountinfo.PIN = '';
accountinfo.FirstName = '';
accountinfo.LastName = '';

% UIWAIT makes newaccount wait for user response (see UIRESUME)
% uiwait(handles.newaccountfigure);

% --- Outputs from this function are returned to the command line.
function varargout = newaccount_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in newaccountsubmit.
function newaccountsubmit_Callback(hObject, eventdata, handles);
% hObject    handle to newaccountsubmit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo
global accounts
global newuser
global check
newuser = true;
importdata;

if isempty(check) && numel(accountinfo.PIN)==4 && numel(accountinfo.FirstName)>=1 && numel(accountinfo.LastName)>=1
    close
    global mode
    mode = 'Deposit';
    global type
    type = 'Checking';
    global amount
    [r ~] = size(accounts.Value);
    z = 0;
    x = 1;
    while x<r
        if length(accounts.Value{x,1})>1
            z = x;
        else
            x = r;
        end
        x = x + 1;
    end
    z = z + 1;
    if isempty(accountinfo.CheckingBalance)
        accountinfo.CheckingBalance = 0;
    end
    if isempty(accountinfo.SavingsBalance)
        accountinfo.SavingsBalance = 0;
    end
    accounts.Value{z,1} = accountinfo.FirstName;
    accounts.Value{z,2} = accountinfo.LastName;
    accounts.Value{z,3} = accountinfo.PIN;
    accounts.Value{z,4} = accountinfo.CheckingBalance;
    accounts.Value{z,5} = 0;
    check = z;
    importhistory;
    amount = accountinfo.CheckingBalance;
    addtransactions;
    type = 'Savings';
    amount = accountinfo.SavingsBalance;
    accounts.Value{z,5} = accountinfo.SavingsBalance;
    addtransactions;
    newuser = false;
    GUI
else
    newaccounterror
end


function newfname_Callback(hObject, eventdata, handles)
% hObject    handle to newfname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo;
accountinfo.FirstName = lower(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of newfname as text
%        str2double(get(hObject,'String')) returns contents of newfname as a double


% --- Executes during object creation, after setting all properties.
function newfname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newfname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newlname_Callback(hObject, eventdata, handles)
% hObject    handle to newlname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo;
accountinfo.LastName = lower(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of newlname as text
%        str2double(get(hObject,'String')) returns contents of newlname as a double


% --- Executes during object creation, after setting all properties.
function newlname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newlname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newpin_Callback(hObject, eventdata, handles)
% hObject    handle to newpin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo;
accountinfo.PIN = get(hObject,'String');
% Hints: get(hObject,'String') returns contents of newpin as text
%        str2double(get(hObject,'String')) returns contents of newpin as a double


% --- Executes during object creation, after setting all properties.
function newpin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newpin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newcdeposit_Callback(hObject, eventdata, handles)
% hObject    handle to newcdeposit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo;
accountinfo.CheckingBalance = str2num(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of newcdeposit as text
%        str2double(get(hObject,'String')) returns contents of newcdeposit as a double


% --- Executes during object creation, after setting all properties.
function newcdeposit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newcdeposit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newsdeposit_Callback(hObject, eventdata, handles)
% hObject    handle to newsdeposit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global accountinfo;
accountinfo.SavingsBalance = str2num(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of newsdeposit as text
%        str2double(get(hObject,'String')) returns contents of newsdeposit as a double


% --- Executes during object creation, after setting all properties.
function newsdeposit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newsdeposit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in newaccountcancel.
function newaccountcancel_Callback(hObject, eventdata, handles)
% hObject    handle to newaccountcancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
welcome
