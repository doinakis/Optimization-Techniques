%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doinakis Michail
% doinakis@ece.auth.gr
% 9292
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [xk,calc_nubmer] = levenberg_marquardt(xk,epsilon,func,gamma_method,gamma)

% Initialize an array to hold the values of the dk vector
d = [];
k = 1;

% Calculate the gradient of the function 
f_grad = gradient(func);
f_hes = hessian(func);

% Sitch to run the algorithm selected (constant, minimize
% f(xk-gammak*gradient(f)) or armijo method 
switch gamma_method
    case "const"
        % While the norm of the gradient vector is larger than the selected
        % value epsilon
        while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
            hes_matrix = double(subs(f_hes,symvar(f_hes),{xk(:,k)'}));
            eigen_values = eig(hes_matrix);
            if (sum(eigen_values < 0) > 0)
                uk = max(abs(eigen_values))+0.2;
            end
            A = hes_matrix + uk*eye(2);
            B = -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}));
            
            % Calculate the k+1 d value and place it in the matrix
            d = [d linsolve(A,B)];
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter 
            k = k + 1;
        end
    case "min"
        % Create syms variable to call the bisection with derivatives
        % method
        syms gamma_value
        
        % While the norm of the gradient vector is larger than the selected
        % value epsilon
        while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
            
            hes_matrix = double(subs(f_hes,symvar(f_hes),{xk(:,k)'}));
            eigen_values = eig(hes_matrix);
            if (sum(eigen_values < 0) > 0)
                uk = max(abs(eigen_values))+0.2;
            end
            A = hes_matrix + uk*eye(2);
            B = -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}));
            
            % Calculate the k+1 d value and place it in the matrix
            d = [d linsolve(A,B)];
            
            % Initialize a function with gamma_value as its input variable
            func_min(gamma_value) = func(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));
            
            % Find the minimum of the function using
            % bisection_with_derivatives method mentioned in the previous
            % assignment 
            [~,~,gamma,~] = bisection_with_derivatives(0,1,0.001,func_min);
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter
            k = k + 1;
            if (k == 101 || func(xk(1,k),xk(2,k)) >= func(xk(1,k-1),xk(2,k-1)))
                break
            end
        end
    case "armijo"
        % Set the armijo algorithm constants
        mk = 0;
        a = 10^(-3);
        b = 1/5;
        s = gamma * b^mk;
        
        % While the norm of the gradient vector is larger than the selected
        % value epsilon
        while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
            
             hes_matrix = double(subs(f_hes,symvar(f_hes),{xk(:,k)'}));
            eigen_values = eig(hes_matrix);
            if (sum(eigen_values < 0) > 0)
                uk = max(abs(eigen_values))+0.2;
            end
            A = hes_matrix + uk*eye(2);
            B = double(subs(f_grad,symvar(f_grad),{xk(:,k)'}));
            
            % Calculate the k+1 d value and place it in the matrix
            d = [d linsolve(A,-B)];
            
            fxk = double(func(xk(1,k),xk(2,k)));
            % find the mk value for which the inequality is satisfied
            while (fxk - double(func(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k))) < -a * b^mk * s * d(:,k)' * B)
                mk = mk + 1;
                gamma = s * b^mk;
            end
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter
            k = k + 1;
            if (k == 101 || func(xk(1,k),xk(2,k)) >= func(xk(1,k-1),xk(2,k-1)))
                break
            end
            % Set mk to 0 for the next iteration
            mk = 0;
            gamma = s * b^mk;
        end
        
end

calc_nubmer = k - 1;




end

