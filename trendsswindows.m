function varargout = trendsswindows(varargin)
% TRENDSSWINDOWS MATLAB code for trendsswindows.fig
%      TRENDSSWINDOWS, by itself, creates a new TRENDSSWINDOWS or raises the existing
%      singleton*.
%
%      H = TRENDSSWINDOWS returns the handle to a new TRENDSSWINDOWS or the handle to
%      the existing singleton*.
%
%      TRENDSSWINDOWS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRENDSSWINDOWS.M with the given input arguments.
%
%      TRENDSSWINDOWS('Property','Value',...) creates a new TRENDSSWINDOWS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trendsswindows_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trendsswindows_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trendsswindows

% Last Modified by GUIDE v2.5 04-Dec-2011 15:12:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trendsswindows_OpeningFcn, ...
                   'gui_OutputFcn',  @trendsswindows_OutputFcn, ...
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


% --- Executes just before trendsswindows is made visible.
function trendsswindows_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trendsswindows (see VARARGIN)

% Choose default command line output for trendsswindows
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trendsswindows wait for user response (see UIRESUME)
% uiwait(handles.trendsfigure);


% --- Outputs from this function are returned to the command line.
function varargout = trendsswindows_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in trendsokay.
function trendsokay_Callback(hObject, eventdata, handles)
% hObject    handle to trendsokay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes during object creation, after setting all properties.
function trendsaxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trendsaxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate trendsaxes
global transactions
global type
ntransactions = transactions.Value(strcmp(transactions.Value(:,6), type),:);
[ timestamp ] = gettimestamp();
ntransactions{end+1,1} = timestamp(1);
ntransactions{end,2} = timestamp(2);
ntransactions{end,3} = timestamp(3);
ntransactions{end,4} = timestamp(4);
ntransactions{end,5} = timestamp(5);
ntransactions{end,6} = 'Current';
ntransactions{end,7} = NaN;
ntransactions{end,8} = 'Date';
ntransactions{end,9} = ntransactions{end-1,9};
ntransactions{end,10} = ntransactions{end-1,10};
date = ntransactions(:,1:5);
date = cell2mat(date);
[r ~] = size(date);
date = [date,zeros(r,1)];
ntransactions = [ntransactions,cellstr(datestr(date))];
if strcmp(type, 'Checking')
    ntransactions = [{ntransactions{:,9}}' {ntransactions{:,11}}'];
else
    ntransactions = [{ntransactions{:,10}}' {ntransactions{:,11}}'];
end
startDate = datenum(ntransactions{1,2});
endDate = datenum(ntransactions{end,2});
endDate = addtodate(endDate, 1, 'minute');
yvalue = cell2mat(ntransactions(:,1));
xvalue = datenum(ntransactions(:,2));
lx = xvalue(end);
lx = addtodate(lx, 1, 'minute');
xvalue(end) = lx;
sDate = datevec(startDate);
eDate = datevec(endDate);
syear = sDate(1);
smonth = sDate(2);
sday = sDate(3);
shour = sDate(4);
smin = sDate(5);
eyear = eDate(1);
emonth = eDate(2);
eday = eDate(3);
ehour = eDate(4);
emin = eDate(5);
plot(xvalue,yvalue);
if eyear ~= syear
    interim = syear:eyear;
    len = length(interim);
    xData = linspace(startDate, endDate, len);
    set(gca, 'XTick', xData);
    datetick('x','yyyy','keepticks');
    xlabel('Date');
elseif emonth ~= smonth
    interim = smonth:emonth;
    len = length(interim);
    xData = linspace(startDate, endDate, len);
    set(gca, 'XTick', xData);
    datetick('x','mmm','keepticks');
    xlabel('Date');
elseif eday ~= sday
    interim = sday:eday;
    len = length(interim);
    xData = linspace(startDate, endDate, len);
    set(gca, 'XTick', xData);
    datetick('x','dd','keepticks');
    xlabel('Date');
elseif ehour ~= shour
    interim = shour:ehour;
    len = length(interim);
    xData = linspace(startDate, endDate, len);
    set(gca, 'XTick', xData);
    datetick('x','HH','keepticks');
    xlabel('Time');
else
    interim = smin:emin;
    len = length(interim);
    xData = linspace(startDate, endDate, len);
    set(gca, 'XTick', xData);
    datetick('x','HH:MM','keepticks');
    xlabel('Time');
end
ylabel('Account Value(USD)');
titleStr = ['Transactions from ' ntransactions{1,2}(1:17) ' to ' ntransactions{end,2}(1:17)];
title(titleStr);

% --- Executes during object creation, after setting all properties.
function trendstext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trendstext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global type
if strcmp(type, 'Checking')
    dialoguestring = 'Checking Account Trends';
else
    dialoguestring = 'Savings Account Trends';
end
set(hObject,'String',dialoguestring)
