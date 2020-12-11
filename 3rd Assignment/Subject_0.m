%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc
clear 
close all 

syms x1 x2;

% Function to be minimized 
f(x1,x2) = (1/2) * x1^2 + (1/2) * x2^2;

% Plot the function in the 3d space
model = figure(1);grid on;
fsurf(f,'ShowContours','on');
title("3D function plot");
xlabel("x");
ylabel("y");
zlabel("f(x,y)");
saveas(model,['./Diagrams/Subject0/','function_plot.jpeg']);
