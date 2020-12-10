%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the minimum interval of a function using the 
% fibonacci method in the interval [a,b].Where:
%   a_init = a
%   b_init = b 
%   l: The maximum range that the last interval may have
%   func: The function to be minimized
%%
function [a,b,calc_number] = fibonacci_method(a_init,b_init,l,func)
k = 1;

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

% Initialize an array to keep the fibonacci series so we dont have to
% recalculate them during the algorithm
fib = [];
n = 1;
while (fibonacci(n) < (b(k)-a(k))/l)
    fib(n) = fibonacci(n);
    n = n + 1;
end

% n is n-1 because the while loop counted 1 more in order to stop
n = n - 1;

% Calculate the first values for x1k,x2k,f(x1k),f(x2k)
x1(k) = a(k) + (fib(n-k-1)/fib(n-k+1)) * (b(k) - a(k));
x2(k) = a(k) + (fib(n-k)/fib(n-k+1)) * (b(k) - a(k));
y1(k) = double(func(x1(k)));
y2(k) = double(func(x2(k)));

for i =1:n-2
    % If f(x1k) < f(x2k)
    if y1(k) < y2(k)
        % Then ak+1 = ak bk+1 = x2k x2k+1 = x1k and
        %  x1k+1 = ak+1 + (Fn-k-2/Fn-k) * (b(k+1) - a(k+1))
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        y2(k+1) = y1(k);
        x1(k+1) = a(k+1) + (fib(n-k-2)/fib(n-k)) * (b(k+1) - a(k+1));
        y1(k+1) = double(func(x1(k+1)));
    else
        % Then ak+1 = x1k bk+1 = bk x1k+1 = x2k and
        % x2k+1 x1k+1 = ak+1 + (Fn-k-1/Fn-k) * (b(k+1) - a(k+1))
        a(k+1) = x1(k);
        b(k+1) = b(k);
        x1(k+1) = x2(k);
        y1(k+1) = y2(k);
        x2(k+1) = a(k+1) + (fib(n-k-1)/fib(n-k)) * (b(k+1) - a(k+1));
        y2(k+1) = double(func(x2(k+1)));
    end
    k = k + 1;
end

calc_number = k;
end