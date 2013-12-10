function importdata
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global accountinfo
global check
global accounts
global newuser
if newuser
    check1 = find(strcmp(accounts.Value(:,1), accountinfo.FirstName)==1);
    check2 = find(strcmp(accounts.Value(:,2), accountinfo.LastName)==1);
    check = intersect(check1,check2);
else
    check1 = find(strcmp(accounts.Value(:,1), accountinfo.FirstName)==1);
    check2 = find(strcmp(accounts.Value(:,2), accountinfo.LastName)==1);
    check3 = find(strcmp(accounts.Value(:,3), accountinfo.PIN)==1);
    check = intersect(intersect(check1,check2),check3);
end

