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

% Initialize the gamma value,espilon and the maximum iterations
X = [10;10];
gamma_value = [0.1 1 2 10];
epsilon = 0.01;
max_iterations = 100;

% Helping variable for the plots 
figure_counter = 1;

% Apply the algotithm for every case and plot the resutls 
for i = 1:4
    [xk,iterations] = steepest_descent(X,epsilon,f,"const",gamma_value(i),max_iterations);
    model = figure(figure_counter);
    figure_counter = figure_counter + 1;
    if (i == 4)
        semilogy(0:iterations,f(xk(1,:),xk(2,:)));
        hold on;
    else
        hold on;
        plot(0:iterations,f(xk(1,:),xk(2,:)));
    end
    scatter(iterations,f(xk(1,end),xk(2,end)),'*');
    graph_title = sprintf('Steepest Descent\nStarting point = (%d,%d) method = const \n#iterations = %d g_k = %.1f', X(1),X(2),iterations,gamma_value(i));
    title(graph_title);
    set(gca, 'XTick', 0:iterations);
    xlabel("k-th iteration");
    xticks([0:5:iterations-1 iterations]);
    ylabel("f(xk,yk)");
    % saveas(model,['./Diagrams/Subject_1st/',num2str(i),'_function_values.jpeg']);
end
