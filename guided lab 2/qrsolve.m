clear;
function x = qr_solve(Q,R,b)

y = Q'*b;

n = length(y);
x = zeros(n,1);

%scan bottom to top bc we have an upper triangular
for i = n:-1:1
     x(i) = (y(i) - R(i,i+1:n)*x(i+1:n)) / R(i,i);
end
end

n =7; 
A = magic(n);
x = (1:n)'; %our real x values

b = A * x;

[Q,R] = qr(A);

x2 = qr_solve(Q,R,b);
norm_check = norm(x-x2);
disp(norm_check)