function [Q R] = gs_factor(A)
% Q = gram_schmidt(X)
% A is input mxn matrix
% Q is output matrix mxn with orthonomal set of vectors (cols) 
% R is output matrix nxn upper triangular
% computes the QR factorization of the matrix A
% Kat Tzioumakis
% 2/9/2026


[m,n] = size(A);

%initialize with 0
Q = zeros(m,n);
R = zeros(n,n);

% --- main loop over columns of A --- %
    for j = 1:n
        
        v = A(:,j);     % go to next col
        
        % subtract projections onto previous col
        for i = 1:j-1
            R(i,j) = Q(:,i)' * v;      % projection coefficient
            v = v - R(i,j) * Q(:,i);   % subtract projection
        end

        R(j,j) = norm(v);   % norm of remaining vector
        
        if R(j,j) > 1e-16
            Q(:,j) = v / R(j,j);   % normalize
        else
            Q(:,j) = zeros(m,1);   % dependent column
        end
        
    end
end


% --- Exercise 2(b)---%
A = [1 1 1;
     1 1 0;
     1 0 0];

[Q,R] = gs_factor(A);

disp(Q)
disp(R)

% --- Exercise 2(c) check with norms---%
B = rand(100,100);

[Q_c,R_c] = gs_factor(B);

error_measure = norm(Q_c'*Q_c-eye(100));
fprintf('norm of 100x100 matrix: %e\n', error_measure);
%disp(norm);

error_measure2 = norm(Q_c*Q_c'-eye(100));
fprintf('norm of 100x100 matrix: %e\n', error_measure2);

check_trig = norm(tril(R_c,-1));
fprintf('norm of Upper Triangular matrix: %e\n', check_trig);

check_factor = norm(B - Q_c*R_c);
fprintf('norm of B-Q*R: %16e\n', check_trig);