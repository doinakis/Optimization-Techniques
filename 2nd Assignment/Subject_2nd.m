%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
close all
clc
clear

syms x y;
f(x,y) = x.^3 .* exp(-x.^2 - y.^4);


xinit = 1;
yinit = 1;
xk = [xinit;yinit];
epsilon = 0.01;

% [xk,iterations] = steepest_descent(xk,epsilon,f,"const",0.3);
% figure(1) 
% fcontour(f);
% hold on;
% scatter(xk(1,1:end-1),xk(2,1:end-1));
% scatter(xk(1,end),xk(2,end),'*');
% 
% 
% [xk,iterations] = steepest_descent(xk,epsilon,f,"min");
% figure(2)
% fcontour(f);
% hold on;
% scatter(xk(1,1:end-1),xk(2,1:end-1));
% scatter(xk(1,end),xk(2,end),'*');

[xk,iterations] = steepest_descent(xk,epsilon,f,"armijo",0.3);
figure(3)
fcontour(f);
hold on;
scatter(xk(1,1:end-1),xk(2,1:end-1));
scatter(xk(1,end),xk(2,end),'*');