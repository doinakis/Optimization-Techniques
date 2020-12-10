%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the minimum interval of a function using the 
% bisection method in the interval [a,b].Where:
%   a_init = a
%   b_init = b
%   epsilon: The distance from the bisector
%   l: The maximum range that the last interval may have  
%   func: The function to be minimized
%%
function [a,b,calc_number] = bisection(a_init,b_init,epsilon,l,func)
k = 1;

% Initialize the arrays which hold the intervals calculated in each
% iteration
a =[];
b =[];
% Arrays that hold the x1k and x2k values 
x1 = [];
x2 = [];

% Set a1 and b1 to be the initial values of the interval [a,b]
a(k) = a_init;
b(k) = b_init;

% If the given a and b values define an already small interval the
% function returns 
if (b(k) - a(k) < l)
    calc_number = 0;
    return
end
% While the distance of the interval calculated is larger than l
% Algorithm stops when the range is smaller or equal to l
while (b(k) - a(k) >= l)
    % Calculate the x1k and x2k
    x1(k) = (a(k) + b(k))/2 - epsilon;
    x2(k) = (a(k) + b(k))/2 + epsilon;
    % If f(x1k) < f(x2k)
    if double(func(x1(k))) < double(func(x2(k)))
        % Then ak+1 = ak and bk+1 = x2k
        a(k+1) = a(k);
        b(k+1) = x2(k);
    else
        % If f(x1k) > f(x2k)
        % Then ak+1 = x1k and bk+1 = bk
        a(k+1) = x1(k);
        b(k+1) = b(k);        
    end
    % Increase k by 1 to move to apply the algorith to the next interval 
    k = k + 1;
end
% k is set to k+1 because the last k value didnt calculate the function 
calc_number = 2*(k-1);
end

