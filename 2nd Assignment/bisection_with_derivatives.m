%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the minimum interval of a function using the 
% bisection with derivatives method in the interval [a,b].Where:
%   a_init = a
%   b_init = b 
%   l: The maximum range that the last interval may have
%   func: The function to be minimized
%%
function [a,b,min_xk,calc_number] = bisection_with_derivatives(a_init,b_init,l,func)

% Find the n value so that the conditions are met 

n=0;
while ((1/2)^n >= l/(b_init-a_init))
    n = n+1;
end

% Initialize k 
k = 1;

% Initialize the arrays which hold the intervals calculated in each
% iteration
a = [];
b = [];

min_xk = NaN;
a(k) = a_init;
b(k) = b_init;

% If n = 0 then the interval is already too small
if n == 0
    calc_number = 0;
end

% Calculation of the derivative of the function
df = diff(func);

% Apply the algorithm for n steps 
for i = 1:n
    % Set xk = (ak+bk)/2
    xk = (a(k) + b(k))/2;
    % Calculate df(xk) 
    if double(df(xk)) == 0 
        % If df(xk) = 0 then thats the minimum 
        min_xk = xk; 
        break
    elseif double(df(xk)) > 0 
        % if df(xk) > 0 then ak+1 = ak and bk+1 = xk
            a(k+1) = a(k);
            b(k+1) = xk;
    elseif double(df(xk)) < 0 
        % if df(xk) < 0 then ak+1 = xk and bk+1 = bk
        a(k+1) = xk;
        b(k+1) = b(k); 
    end
    % Stop when k reaches n 
    if k == n 
        break
    else 
        k = k + 1 ;
    end
end

if isnan(min_xk)
    min_xk = (a(end)+b(end))/2;
% The function func is called n times(Its derivative)
calc_number = n;
end