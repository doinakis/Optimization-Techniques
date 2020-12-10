%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc
clear 
close all 
% Functions to be minimized
syms x;
f1(x) = (x-2).^2 - sin(x+3);
f2(x) = exp((-5*x))+ (x+2).*(cos(0.5*x)).^2;
f3(x) = (x.^2).*sin(x+2) - (x+1).^2;
% Initialization of the interval [2,5]
a_init=2;
b_init=5;
epsilon = 0.001;
l=0.01;
%[a,b,min] = bisection_with_derivatives(a_init,b_init,l,f1);
 %[a,b] = bisection(a_init,b_init,epsilon,l,f3);

[a2,b2,calc_number] = fibonacci_method(a_init,b_init,l,f1);
% figure(1) 
hold on 
grid on
title("Bisection");
xlabel("x");
ylabel("f1(x) = (x-2)^2 - sin(x+3)");
plot(2:0.001:5,double(f1(2:0.001:5)));
scatter(a2(end),double(f1(a2(end))),'*')
scatter(b2(end),double(f1(b2(end))))
% figure(2) 
% hold on 
% plot(2:0.001:5,f1(2:0.001:5));
% scatter(a2,double(f1(a2)),'*')
% scatter(b2,double(f1(b2)))
