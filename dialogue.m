function varargout = dialogue(varargin)
% DIALOGUE MATLAB code for dialogue.fig
%      DIALOGUE, by itself, creates a new DIALOGUE or raises the existing
%      singleton*.
%
%      H = DIALOGUE returns the handle to a new DIALOGUE or the handle to
%      the existing singleton*.
%
%      DIALOGUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIALOGUE.M with the given input arguments.
%
%      DIALOGUE('Property','Value',...) creates a new DIALOGUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dialogue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dialogue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above dialoguetext to modify the response to help dialogue

% Last Modified by GUIDE v2.5 06-Dec-2011 16:30:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dialogue_OpeningFcn, ...
                   'gui_OutputFcn',  @dialogue_OutputFcn, ...
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


% --- Executes just before dialogue is made visible.
function dialogue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dialogue (see VARARGIN)

% Choose default command line output for dialogue
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dialogue wait for user response (see UIRESUME)
% uiwait(handles.dialoguefigure);


% --- Outputs from this function are returned to the command line.
function varargout = dialogue_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in dialogueokay.
function dialogueokay_Callback(hObject, eventdata, handles)
% hObject    handle to dialogueokay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes during object creation, after setting all properties.
function dialoguetext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dialoguetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global type
global mode

if strcmp(mode, 'Withdraw')
    if strcmp(type, 'Checking')
        dialoguestring = 'How much would you like to withdraw from your Checking Account?';
    else
        dialoguestring = 'How much would you like to withdraw from your Savings Account?';
    end
elseif strcmp(mode, 'Deposit')
    if strcmp(type, 'Checking')
        dialoguestring = 'How much would you like to deposit into your Checking Account?';
    else
        dialoguestring = 'How much would you like to deposit into your Savings Account?';
    end
elseif strcmp(mode, 'Transfer')
    if strcmp(type, 'Checking')
        dialoguestring = 'How much would you like to transfer from your Checking Account to your Savings Account?';
    else
        dialoguestring = 'How much would you like to transfer from your Savings Account to your Checking Account?';
    end
else
    dialoguestring = 'Please enter your new PIN.';
end
set(hObject,'String',dialoguestring)

% --- Executes on button press in dialoguecancel.
function dialoguecancel_Callback(hObject, eventdata, handles)
% hObject    handle to dialoguecancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
global amount
amount = false;


function amount_Callback(hObject, eventdata, handles)
% hObject    handle to amount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amount as dialoguetext
%        str2double(get(hObject,'String')) returns contents of amount as a double
global amount
amount = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function amount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over amount.
function amount_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to amount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amount
amount = str2num(get(hObject,'String'));


% --- Executes on key press with focus on amount and none of its controls.
function amount_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to amount (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global amount
amount = str2num(get(hObject,'String'));