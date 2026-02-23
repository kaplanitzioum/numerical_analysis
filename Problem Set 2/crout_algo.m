%Exercise 4(d) Ax=b

x_true = [1; 1; 1];
k_vals = 0:9;
eps_vals = (1/3)*10.^(-k_vals);

%Initialize error
err_crout = zeros(size(k_vals));
err_builtin = zeros(size(k_vals));

%table mode
fprintf('%-4s | %-10s | %-15s | %-15s\n', 'k', 'epsilon', 'Crout Error', 'Built-in Error');

for i = 1:length(eps_vals)
    eps = eps_vals(i);
   
    A = [2, -2, 0; eps - 2, 2, 0; 0, -1, 3];
    b = [0; eps; 2];
    
    %--- Crout's algo ---
    % Stage 1-> 1st column of L and 1st row of U
    L = zeros(3,3); U = eye(3);
    %1st col
    L(1,1) = A(1,1); 
    L(2,1) = A(2,1); 
    L(3,1) = A(3,1);
    %1st row
    U(1,2) = A(1,2)/L(1,1); 
    U(1,3) = A(1,3)/L(1,1);
    
    % Stage 2-> 2nd column of L and 2nd row of U
    %2nd col
    L(2,2) = A(2,2) - L(2,1)*U(1,2);
    L(3,2) = A(3,2) - L(3,1)*U(1,2);
    %2nd row
    U(2,3) = (A(2,3) - L(2,1)*U(1,3)) / L(2,2);
    
    % Stage 3-> 3rd column of L
    L(3,3) = A(3,3) - (L(3,1)*U(1,3) + L(3,2)*U(2,3));
    
    %Ly = b
    y = L \ b; 
    %Ux = y
    x_crout = U \ y;
    
    %--- built inmethod ---
    [L_built, U_built, P] = lu(A);
    x_builtin = U_built \ (L_built \ (P * b));
    
    %relative error(infinity norm)
    err_crout(i) = norm(x_crout - x_true, inf) / norm(x_true, inf);
    err_builtin(i) = norm(x_builtin - x_true, inf) / norm(x_true, inf);
    
    fprintf('%-4d | %-10.1e | %-15.2e | %-15.2e\n', k_vals(i), eps, err_crout(i), err_builtin(i)); %%f doesnt work 
end

%plot relative error vs the different epsilons
figure;
loglog(eps_vals, err_crout,'ro-','DisplayName','crout');
hold on;
loglog(eps_vals, err_builtin,'gs--','DisplayName','lu()');
%set(gca);
xlabel('epsilon'); 
ylabel('relative error');
title('relative Error vs \epsilon'); 
legend; 
grid on;