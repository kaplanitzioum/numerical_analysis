%5(c)
f = @(x) sin(x);
fp_exact = cos(0); %f'(0) = 1
x0 = 0;

%step sizes h
h_vals = [0.2, 0.1, 0.05, 0.025, 0.0125];
error = zeros(size(h_vals));

for i = 1:length(h_vals)
    h = h_vals(i);
    
    %we need 5 points 
    dx = [0, 1, 2, 3, 4] * h;
    coeffs = double(computeCoefficients(1, dx));
    f_vals = f(x0 + dx);
    fp_approx = sum(coeffs .* f_vals');
    
    error(i) = abs(fp_approx - fp_exact);
    
    %show the coeeffs to see whats going on here
    if i == 1
        fprintf('Coefficients for h=0.1: [%s]\n', num2str(coeffs', '%.4f '));
    end
end

check_errors = error>0;
figure;
loglog(h_vals, error, '-o', 'LineWidth', 2);
grid on;
xlabel('Steps');
ylabel('error');
title('forward difference convergence of sin(x)');


c = polyfit(log(h_vals(check_errors)), log(error(check_errors)), 1);
fprintf('order of onvergence: %.4f\n', c(1));