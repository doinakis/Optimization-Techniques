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

% Plot the function
figure(1);
fsurf(f);

figure(2);
fcontour(f);