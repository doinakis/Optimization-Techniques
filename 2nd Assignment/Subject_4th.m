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

X = [0 -1 1;0 -1 1;];
method = ["const","min","armijo"];
figure_counter = 1;
epsilon = 0.01;
gamma = 0.5;
for i = 1:3
    for j = 1:3
        
        [xk,iterations] = levenberg_marquardt(X(:,i),epsilon,f,method(j),gamma);
        graph_title = sprintf('Levenberg Marquardt\nStarting point = (%d,%d) method = %s\n#iterations = %d Minimum = (%.2f,%.2f)', X(1,i),X(2,i),method(j),iterations,xk(1,end),xk(2,end));
        model = figure(figure_counter);
        figure_counter = figure_counter + 1;
        fcontour(f);hold on;
        grid on;
        title(graph_title);
        xlabel("x");
        ylabel("y");
        plot(xk(1,1:end),xk(2,1:end));
        scatter(xk(1,end),xk(2,end),'*');
        saveas(model,['./Diagrams/Subject4th/',num2str(X(1,i)),'_',num2str(X(2,i)),'_',num2str(method(j)),'_contour.jpeg']);
        model = figure(figure_counter);
        hold on;
        figure_counter = figure_counter + 1;
        plot(0:iterations,f(xk(1,:),xk(2,:)));
        scatter(iterations,f(xk(1,end),xk(2,end)),'*');
        txt = sprintf("Minimum @(%.3f,%.2f)\n f = %.3f",xk(1,end),xk(2,end),double(f(xk(1,end),xk(2,end))));
        annotation('textbox', 'String', txt);
        title(" Value of the function as k changes");
        set(gca, 'XTick', 0:iterations);
        xlabel("k-th iteration");
        ylabel("f(xk,yk)");
        saveas(model,['./Diagrams/Subject4th/',num2str(X(1,i)),'_',num2str(X(2,i)),'_',num2str(method(j)),'_function_values.jpeg']);
      
    end
end