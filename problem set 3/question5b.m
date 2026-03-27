%5b convergece for f(x) = e^x at x=0
f = @(x) exp(x);
fp_exact = 1;%f'(0)=1
x0 = 0;

%step size 
h_vals = 10.^(-1:-1:-5); 
error = zeros(size(h_vals));

for i = 1:length(h_vals)
    h = h_vals(i);
    
    dx = [-h, 0, h];
    
    %coeffs sym
    coeffs_sym = computeCoefficients(1, dx);
    
    %convert sym coeffs to double bc nan
    coeffs = double(coeffs_sym); 
    
    %approximation
    f_vals = f(x0 + dx);
    fp_approx = sum(coeffs .* f_vals'); 
    error(i) = abs(fp_approx - fp_exact);
end


figure;
loglog(h_vals, error, '-o');
grid on;
xlabel('h'); 
ylabel('error');
title('centered 1st derivative convergence');

%slope/convergence
c = polyfit(log(h_vals), log(error), 1);
fprintf('order of convergence: %.4f\n', c(1));