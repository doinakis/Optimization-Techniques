%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the minimum interval of a function using the 
% golden section method in the interval [a,b].Where:
%   a_init = a
%   b_init = b
%   l: The maximum range that the last interval may have  
%%
function [a,b,calc_number] = golden_sector(a_init,b_init,l,func)
k = 1;
% Gamma value as calculated in the notes 
gamma = 0.618;

% Initialize the arrays which hold the intervals calculated in each
% iteration and the function values where y1(k) will be f(x1k) and y2k will
% be f(x2k)
a =[];
b =[];
y1 = [];
y2 = [];

% Arrays that hold the x1k and x2k values 
x1 = [];
x2 = [];

% Set a1 and b1 to be the initial values of the interval [a.b]
a(k) = a_init;
b(k) = b_init;

% If the given a and b values define an already small interval the
% function returns 
if (b(k) - a(k) < l)
    calc_number = 0;
    return
end

% Calculate the first values for x1k,x2k,f(x1k),f(x2k)
x1(k) = a(k) + (1-gamma)*(b(k)-a(k));
x2(k) = a(k) + gamma*(b(k)-a(k));
y1(k) = double(func(x1(k)));
y2(k) = double(func(x2(k)));


% While the distance of the interval calculated is larger than l
% Algorithm stops when the range is smaller or equal to l
while (b(k) - a(k) >= l)
    % If f(x1k) < f(x2k)
    if y1(k) < y2(k)
        % ak+1 = ak and bk+1 = x2k
        a(k+1) = a(k);
        b(k+1) = x2(k);
        % x2k+1 = x1k and x1k+1 = ak+1 + (1-gamma)*(bk+1 - ak+1)
        % Since x2k+1 = x1k we already have the value f(x1k) stored at
        % y1(k) so y2(k+1)= f(x2k+1) = f(x1k) = y1(k) 
        x2(k+1) = x1(k);
        y2(k+1) = y1(k);
        % Calculate the value for x1k+1 and f(x1k+1)
        x1(k+1) = a(k+1) + (1-gamma)*(b(k+1)-a(k+1));
        y1(k+1) = double(func(x1(k+1)));
    else
        % ak+1 = x1k and bk+1 = bk
        a(k+1) = x1(k);
        b(k+1) = b(k);
        % x1k+1 = x2k and x2k+1 = ak+1 + gamma*(bk+1 - ak+1)
        % Since x1k+1 = x2k we already have the value f(x2k) stored at
        % y2(k) so y1(k+1)= f(x1k+1) = f(x2k) = y2(k) 
        x1(k+1) = x2(k);
        y1(k+1) = y2(k);
        % Calculate the value for x2k+1 and f(x2k+1)
        x2(k+1) = a(k+1) + gamma*(b(k+1)-a(k+1));
        y2(k+1) = double(func(x2(k+1)));
        
    end
    % Increase k by 1 to move to apply the algorith to the next interval 
    k = k + 1;
end
calc_number = k;
end