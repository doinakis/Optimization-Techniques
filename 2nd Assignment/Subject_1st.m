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
model = figure(1);grid on;
fsurf(f,'ShowContours','on');
title("3D function plot");
xlabel("x");
ylabel("y");
zlabel("f(x,y)");
%saveas(model,['./Diagrams/Subject1st/','function_plot.jpeg']);
% Plot the isolines of f
model = figure(2);
fcontour(f)
grid on;
title("function isolines");
xlabel("x");
ylabel("y");
%saveas(model,['./Diagrams/Subject1st/','contour.jpeg']);