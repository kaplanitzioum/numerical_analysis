%herons algorithm
clear;
a = 2; %we're trying to approximate sqrt2
y0 = 1.5; %initial guess 
N = 10; %num of iterations

%allocate memory
y = zeros(N+1,1); %init with 0, n+1 bc of initial value

% set initial guess, matlab starts at 1 not 0
y(1) = y0;

true_value = sqrt(a);
abs_error = zeros(N+1,1);
rel_error = zeros(N+1,1);

approx_abs_error = zeros(N+1,1);
approx_rel_error = zeros(N+1,1);

for n=1:N
    y(n+1) = 0.5 * (y(n) + (a/y(n)));
    
    %true errors with sqrt built in func 
    abs_error(n+1) = abs(y(n+1) - true_value);
    rel_error(n+1) = abs_error(n+1) / abs(true_value);

    %approximate errors
    approx_abs_error(n+1) = abs(y(n+1) - y(n));
    approx_rel_error(n+1) = approx_abs_error(n+1)/abs(y(n+1));

    fprintf('Step %d: y(n) is %f, a is %f, result is %f\n', n, y(n), a, y(n+1));
    fprintf('True: abs = %.4e, Rel = %.4e\n', abs_error(n+1), rel_error(n+1));
    fprintf('Approx: abs = %.4e, Rel = %.4e\n', approx_abs_error(n+1), approx_rel_error(n+1));
end

%plot
figure;
loglog(1:N, rel_error(2:end), '-o');
xlabel('Iteration (n)');
ylabel('Relative Error');
grid on;