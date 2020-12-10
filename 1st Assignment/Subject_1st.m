%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

clc
clear 
close all 

% Helping variables for the plots 
figure_counter = 1;
colors = {'r','b','k'};
symbols = {'o','+','*','x'};

% Functions to be minimized
syms x;
f1(x) = (x-2).^2 - sin(x+3);
f2(x) = exp((-5*x))+ (x+2).*(cos(0.5*x)).^2;
f3(x) = (x.^2).*sin(x+2) - (x+1).^2;

% Initialization of l and the input interval 
l = 0.01;
a_init = 2;
b_init = 5;
epsilon = 0.001;
% Define a step to check the behaviour when epsilon is changing  
epsilon_step = 0.0001;
epsilon_values = [];

i = 1;
while (epsilon < l/2)
    [~,~,calc_number1(i)] = bisection(a_init,b_init,epsilon,l,f1);
    [~,~,calc_number2(i)] = bisection(a_init,b_init,epsilon,l,f2);
    [~,~,calc_number3(i)] = bisection(a_init,b_init,epsilon,l,f3);
    epsilon_values = [epsilon_values epsilon];
    epsilon = epsilon + epsilon_step;
    i = i + 1;
end
calculations_epsilon = [calc_number1;calc_number2;calc_number3];

% Plot the the number of calculations for each function, for the different
% espilons
for i=1:3
    
    model = figure(figure_counter); 
    figure_counter = figure_counter + 1;
    hold on 
    grid on
    title("Calculations of the function f_"+ num2str(i) +"(x) (l = 0.01)");
    xlabel('\epsilon');
    ylabel('Number of calculations');
    plot(epsilon_values,calculations_epsilon(i,:));
    %saveas(model,['./Diagrams/Subject1st/f_',num2str(i),'_calculations_variable_epsilon.jpeg']);

end


% Keeping epsilon constant and l changing
l_step = 0.001;
l = 0.003;
epsilon = 0.001;
l_values = [];
i = 1;
while (l < 0.1)
    [~,~,calc_number1(i)] = bisection(a_init,b_init,epsilon,l,f1);
    [~,~,calc_number2(i)] = bisection(a_init,b_init,epsilon,l,f2);
    [~,~,calc_number3(i)] = bisection(a_init,b_init,epsilon,l,f3);
    l_values = [l_values l];
    l = l + l_step;
    i = i + 1;
end
calculations_l = [calc_number1;calc_number2;calc_number3];

% Plot the the number of calculations for each function, for the different
% l
for i=1:3
    
    model = figure(figure_counter); 
    figure_counter = figure_counter + 1;
    hold on 
    grid on
    title("Calculations of the function f_"+ num2str(i) +"(x) (\epsilon = 0.001)");
    xlabel('l');
    ylabel('Number of calculations');
    plot(l_values,calculations_l(i,:));
    %saveas(model,['./Diagrams/Subject1st/f_',num2str(i),'_calculations_variable_l.jpeg']);

end

% Calculate how the intervals change while l is changing 

l = [0.01 0.05 0.1];
line_widths = [1 1.7 2];
figure_f1 = figure_counter;
figure_counter = figure_counter + 1;
figure_f2 = figure_counter;
figure_counter = figure_counter + 1;
figure_f3 = figure_counter;
figure_counter = figure_counter + 1;
h1 = ones(3);
h2 = ones(3);
h3 = ones(3);

for i = 1:3
    
    [a1,b1,~] = bisection(a_init,b_init,epsilon,l(i),f1);
    [a2,b2,~] = bisection(a_init,b_init,epsilon,l(i),f2);
    [a3,b3,~] = bisection(a_init,b_init,epsilon,l(i),f3);
    figure(figure_f1);
    hold on 
    grid on
    title('Interval Change for f_1(x) (\epsilon = 0.001)');
    xlabel('k index value');
    ylabel('a and b values');
    h1(i) = plot(1:length(a1),a1,'Color',colors{i},'LineWidth',line_widths(i));
    plot(1:length(b1),b1,'Color',colors{i},'LineWidth',line_widths(i));
    figure(figure_f2);
    hold on 
    grid on
    title('Interval Change for f_2(x) (\epsilon = 0.001)');
    xlabel('k index value');
    ylabel('a and b values');
    h2(i) = plot(1:length(a2),a2,'Color',colors{i},'LineWidth',line_widths(i));
    plot(1:length(b2),b2,'Color',colors{i},'LineWidth',line_widths(i));
    figure(figure_f3);
    hold on 
    grid on
    title('Interval Change for f_3(x) (\epsilon = 0.001)');
    xlabel('k index value');
    ylabel('a and b values');
    h3(i) = plot(1:length(a3),a3,'Color',colors{i},'LineWidth',line_widths(i));
    plot(1:length(b3),b3,'Color',colors{i},'LineWidth',line_widths(i));
end

% Save the plots 
model = figure(figure_f1);
legend([h1(1),h1(2),h1(3)],'l=0.01','l=0.05','l=0.1');
%saveas(model,'./Diagrams/Subject1st/f_1_intervals_variable_l.jpeg');
model = figure(figure_f2);
legend([h2(1),h2(2),h2(3)],'l=0.01','l=0.05','l=0.1');
%saveas(model,'./Diagrams/Subject1st/f_2_intervals_variable_l.jpeg');
model = figure(figure_f3);
legend([h3(1),h3(2),h3(3)],'l=0.01','l=0.05','l=0.1');
%saveas(model,'./Diagrams/Subject1st/f_3_intervals_variable_l.jpeg');
