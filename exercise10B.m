%exercise 10-method B
%clc
a=2;
true_value=sqrt(a);
z0 = 1.5;
N=10;

z = zeros(N+1,1); %init with 0, n+1 bc of initial value
approx_abs_error = zeros(N+1,1);
abs_error = zeros(N+1,1);

z(1)=y0;


for n=1:N
    term_a = 3*z(n);
    term_b = 12 / z(n);
    term_c = 4 / (z(n)^3);

    z(n+1) = (1/8) * (term_a + term_b - term_c);

    approx_abs_error(n+1) = abs(z(n+1) - z(n));
    abs_error(n+1) = abs(z(n+1) - true_value);

    fprintf('Step %d: z(n) is %f, a is %f, result is %f\n', n, z(n), a, z(n+1));
    fprintf('Approximate absolute error: %.4f\n',approx_abs_error(n+1));
    fprintf('Absolute error: %.4f\n',abs_error(n+1));

end