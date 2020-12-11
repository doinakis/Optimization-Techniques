clc
clear
close all

syms x1 x2;

% Function to be minimized
f(x1,x2) = (1/2) * x1^2 + (1/2) * x2^2;

% Initialize the gamma value,espilon,the maximum iterations,sk and the
% interval for the variables x1,x2 (a(1)<=x1<=b(1),a(2)<=x2<=b(2))
a = [-20;-12];
b = [10;15];
X = [8;3];
sk = 15;
gamma_value = 0.1;
epsilon = 0.01;
max_iterations = 100;
figure_counter = 1;

% Apply the algotithm and plot the resutls 
[xk_projection,iterations_projection] = steepest_descent_with_projection(X,epsilon,f,gamma_value,a,b,sk,max_iterations);
model = figure(figure_counter);
figure_counter = figure_counter + 1;
hold on;
plot(0:iterations_projection,f(xk_projection(1,:),xk_projection(2,:)));
scatter(iterations_projection,f(xk_projection(1,end),xk_projection(2,end)),'*');
graph_title = sprintf('Steepest Descent with Projection\nStarting point = (%d,%d) method = const \n#iterations = %d g_k = %.1f s_k = %d', X(1),X(2),iterations_projection,gamma_value,sk);
title(graph_title);
set(gca, 'XTick', 0:iterations_projection);
xlabel("k-th iteration");
xticks([0:5:iterations_projection-1 iterations_projection]);
ylabel("f(xk,yk)");
% saveas(model,'./Diagrams/Subject_2nd/projection_function_values.jpeg');

[xk,iterations] = steepest_descent(X,epsilon,f,"const",gamma_value,max_iterations);
model = figure(figure_counter);
figure_counter = figure_counter + 1;
hold on;
plot(0:iterations,f(xk(1,:),xk(2,:)));
scatter(iterations,f(xk(1,end),xk(2,end)),'*');
graph_title = sprintf('Steepest Descent\nStarting point = (%d,%d) method = const \n#iterations = %d g_k = %.1f', X(1),X(2),iterations,gamma_value);
title(graph_title);
set(gca, 'XTick', 0:iterations);
xlabel("k-th iteration");
xticks([0:5:iterations-1 iterations]);
ylabel("f(xk,yk)");
% saveas(model,'./Diagrams/Subject_2nd/steepest_function_values.jpeg');
