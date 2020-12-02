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

xinit = -1;
yinit = -1;
xk = [xinit;yinit];
epsilon = 0.01;

[xk1,iterations1] = steepest_descent(xk,epsilon,f,"const",0.3);
figure(1) 
fcontour(f);
hold on;
scatter(xk1(1,1:end-1),xk1(2,1:end-1));
scatter(xk1(1,end),xk1(2,end),'*');
% 
%
xk = [xinit;yinit];
[xk2,iterations2] = steepest_descent(xk,epsilon,f,"min",0.3);
figure(2)
fcontour(f);
hold on;
scatter(xk2(1,1:end-1),xk2(2,1:end-1));
scatter(xk2(1,end),xk2(2,end),'*');

xk = [xinit;yinit];
[xk3,iterations3] = steepest_descent(xk,epsilon,f,"armijo",0.3);
figure(3)
fcontour(f);
hold on;
scatter(xk3(1,1:end-1),xk3(2,1:end-1));
scatter(xk3(1,end),xk3(2,end),'*');