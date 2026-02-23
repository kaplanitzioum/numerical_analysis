% exercise 4
epsilon = 0.5e-15;
A = [1, 1+epsilon, 3; 
     2, 2, 20; 
     3, 6, 4];

%---crout no pivot ---
L = zeros(3,3); 
U = eye(3); %identity matrix

%1st col L and row 1 U
L(:,1) = A(:,1);
U(1,2) = A(1,2)/L(1,1);
U(1,3) = A(1,3)/L(1,1);

%2nd col L and row 2 U
L(2,2) = A(2,2) - L(2,1)*U(1,2);
L(3,2) = A(3,2) - L(3,1)*U(1,2);
U(2,3) = (A(2,3) - L(2,1)*U(1,3)) / L(2,2);

%3rd col L
L(3,3) = A(3,3) - (L(3,1)*U(1,3) + L(3,2)*U(2,3));

R = A - (L * U);

%built-in 
[L_built, U_built, P] = lu(A);

R_p = (P * A) - (L_built * U_built);


fprintf('Crout Algo(no pivoting)\n');
fprintf('L(2,2) pivot: %.2e\n', L(2,2));
fprintf('U(2,3) value: %.2e\n', U(2,3));
fprintf('max residual: %.2f\n\n', max(abs(R(:))));

fprintf('Built-in (With Pivoting)\n');
fprintf('Max Residual: %.2e\n', max(abs(R_p(:))));