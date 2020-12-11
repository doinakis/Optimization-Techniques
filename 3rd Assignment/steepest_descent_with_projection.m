%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the minimum point xk of a given function using 
% the Steepest Descentwith projection method and returns the number of 
%iterations the algorithm needed(iterations) and every point calculated 
%in each iteration (xk) Where:
%   X: is the starting point (x,y)
%   epsilon: if the gradient of the function is less than this value the
%       algorithm stops
%   func: the function to be minimized
%   gamma: the initial value of gamma
%   a,b: intervals for the variables x1,x2 (a(1)<=x1<=b(1),a(2)<=x2<=b(2))
%   sk: parameter to to calculate the x bar 
%   max_iterations: if the algorithm reaches that many iterations it
%       returns
%%
function [xk,iterations] = steepest_descent_with_projection(X,epsilon,func,gamma,a,b,sk,max_iterations)

% Initialize an array to hold the values of the dk vector
d = [];
k = 1;
xk = X;
x_bar = [];
% Calculate the gradient of the function 
f_grad = gradient(func);

% While the norm of the gradient vector is larger than the selected
% value epsilon
while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
    
%   xk(:,k) = projection(a,b,xk(:,k));
    % Calculate the k+1 d value and place it in the matrix
    d = [d -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))];
    x_bar(:,k) = projection(a,b,xk(:,k)+sk*d(:,k));
    % Calculate the xk+1 value and place it in the xk matrix
    x_k = xk(:,k) + gamma * (x_bar(:,k) - xk(:,k));
    xk = [xk x_k];
    
    % Increase the k counter
    k = k + 1;
    
    % Break the while loop if it reaches the maximum iterations
    if(k > max_iterations)
        break
    end
end

iterations = k - 1;
end