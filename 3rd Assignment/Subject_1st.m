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

x1init = 10;
x2init = 10;
X = [8 -5 11;3 7 3];
gamma_value = [0.1 1 2 10];
epsilon = 0.01;
figure_counter = 1;


for i = 1:4
[xk,iterations] = steepest_descent(X(:,i),epsilon,f,"const",gamma_value(3));
graph_title = sprintf('Steepest Descent\nStarting point = ');
end