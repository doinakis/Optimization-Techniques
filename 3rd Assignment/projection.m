%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the projection of vector x=[x1;x2] with given 
% intervals such as (a(1)<=x1<=b(1),a(2)<=x2<=b(2)) Where:
%   a,b: intervals for the variables x1,x2 (a(1)<=x1<=b(1),a(2)<=x2<=b(2))
%   x: the vector x
%%
function [xout] = projection(a,b,x)

% Preallocatng the output vector
xout = ones(length(x),1);

for i = 1:length(x)
    if (x(i) <= a(i))
        xout(i) = a(i);
    elseif (x(i) >= b(i))
        xout(i) = b(i);
    else
        xout(i) = x(i);
    end
end
