%Exercise 10 - Method C with starting point 1.5
%clc

a=2;
N=10;
x = zeros(N+1, 1);
x(1) = 1.5;
true_value = sqrt(a);

approx_abs_error = zeros(N+1,1);
abs_error = zeros(N+1,1);

for n=1:N
    num = a - x(n)^2;
    denom = 2*x(n) +1;

    x(n+1) = x(n) + (num/denom);

    approx_abs_error(n+1) = abs(x(n+1) - x(n));
    abs_error(n+1) = abs(true_value - x(n+1));

    fprintf('Step %d: z(n) is %f, a is %f, result is %f\n', n, x(n), a, x(n+1));
    fprintf('Approximate absolute error: %.4f\n',approx_abs_error(n+1));
    fprintf('Absolute error: %.4f\n',abs_error(n+1));

end