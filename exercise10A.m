%exercise 10-method A
%clc
a=2;
true_value=sqrt(a);
y0 = 1.5;
N=10;

y = zeros(N+1,1); %init with 0, n+1 bc of initial value
approx_abs_error = zeros(N+1,1);
abs_error = zeros(N+1,1);

y(1)=y0;


for n=1:N
    y(n+1) = 0.25*(3*y(n) +a/y(n));

    approx_abs_error(n+1) = abs(y(n+1) - y(n));
    abs_error(n+1) = abs(y(n+1) - true_value);

    fprintf('Step %d: y(n) is %f, a is %f, result is %f\n', n, y(n), a, y(n+1));
    fprintf('Approximate absolute error: %.4f\n',approx_abs_error(n+1));
    fprintf('Absolute error: %.4f\n',abs_error(n+1));

end