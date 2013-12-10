function addtransactions
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global transactions
global type
global accounts
global mode
global check
global amount
global z
[ timestamp ] = gettimestamp();
ntransactions{1,1} = timestamp(1);
ntransactions{1,2} = timestamp(2);
ntransactions{1,3} = timestamp(3);
ntransactions{1,4} = timestamp(4);
ntransactions{1,5} = timestamp(5);
ntransactions{1,6} = type;
ntransactions{1,7} = amount;
ntransactions{1,8} = mode;
ntransactions{1,9} = accounts.Value{check,4};
ntransactions{1,10} = accounts.Value{check,5};
transactions.Value(z,:) = ntransactions;
z = z + 1;
end

