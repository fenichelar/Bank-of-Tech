function ATM
clear
clc
x = mfilename('fullpath');
filelocation = [x(1:end-3) 'data.xlsx'];
password = 'BankofTech';
global file
global excel
global newuser
global accounts
newuser = false;
excel = actxserver('Excel.Application');
file = excel.Workbooks.Open(filelocation,3,false,1,password,password,true);
sheet = excel.Worksheets.get('Item','accounts');
sheet.Activate();
accounts = excel.ActiveSheet.get('Range', 'A1:E10000');
welcome
end