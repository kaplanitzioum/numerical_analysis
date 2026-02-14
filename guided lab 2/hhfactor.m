function [Q R] = hh_factor(A)
% A is input mxn matrix
% Q is output orthogonal matrix mxm  
% R is output matrix mxn upper triangular
% QR factorization with householder method 
% Kat Tzioumakis
%2/13/2026

[m,n] = size(A);

%we're building R on A
R=A;
Q = eye(m); 


for k = 1:min(m,n)

    x = R(k:m, k);      %assigns elements to x from the k-th to the m-th row from the k-th col --> 1column

    %householder vector
    u = zeros(length(x), 1);
    u(1)=1;     % unit vector

    target_el = -sign(x(1)) * norm(x);      %1st new entry after reflect = -sign(x1)*||x||
    v = x - target_el*u;                    %vector i want to create
    v = v/norm(v);                          %normalize it

    %--- reflection applied on Q ---%
    Q(:,k:m) = Q(:, k:m) - 2*(Q(:, k:m)*v)*v';

    %--- refelction applied on R ---%
    R(k:m, k:n) = R(k:m, k:n) - 2*v*(v'*R(k:m, k:n));  %rows above k already visited, cols before k are triangular
end
end


%---exercise 3(b)---%
A = [1 1 1;
     1 1 0;
     1 0 0];

[Q,R] = hh_factor(A);
disp(Q)
disp(R)

    
%---exercise 3(c) ---%
C = rand(100,100);

[Q_c, R_c] = hh_factor(C);

error_measure = norm(Q_c'*Q_c-eye(100));
fprintf('norm of 100x100 matrix: %e\n', error_measure);
%disp(norm);

error_measure2 = norm(Q_c*Q_c'-eye(100));
fprintf('norm of 100x100 matrix: %e\n', error_measure2);

check_trig = norm(tril(R_c,-1));
fprintf('norm of Upper Triangular matrix: %e\n', check_trig);

check_factor = norm(C - Q_c*R_c);
fprintf('norm of B-Q*R: %16e\n', check_trig);
