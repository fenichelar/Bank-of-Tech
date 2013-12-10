function importhistory
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global transactions
global accountinfo
global file
global excel
global newuser
global z
global check
if ~newuser
    sheet = excel.ActiveWorkbook.Sheets.get('Item',[accountinfo.FirstName accountinfo.LastName]);
else
    sheet = file.Sheets.Add;
    sheet.Name = [accountinfo.FirstName accountinfo.LastName];
end
sheet.Activate();
transactions = excel.ActiveSheet.get('Range', 'A1:J50000');
[r ~] = size(transactions.Value);
z = 0;
x = 1;
while x<r
    if transactions.Value{x,1}>1
        z = x;
    else
        x = r;
    end
    x = x + 1;
end
z = z + 1;
end

