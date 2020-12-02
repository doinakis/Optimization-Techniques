%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
close all 
clc 
clear

% Create the function
syms x y;
f(x,y) = x.^3 .* exp(-x.^2 - y.^4);

% Plot the function in the 3d space
figure(1);grid on;
fsurf(f,'ShowContours','on');

% Plot the isolines of f
figure(2);
fcontour(f)
grid on;