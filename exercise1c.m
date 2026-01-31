%Exercise 1(c)

true_value = pi;
Nmax = 400; % we estimated 399 but we start from 1 in matlab so 399+1
N = 1:Nmax;

approx_pi = zeros(size(N));

for i = N
    approx_pi(i) = 4 * sum(((-1).^(0:i-1)) ./ (2*(0:i-1) +1 ));

end

actual_error = abs(approx_pi - true_value);
theoretical_error = 4 ./ (2*N + 1);

figure
loglog(N, theoretical_error, 'LineWidth', 2);
hold on
loglog(N, actual_error, 'LineWidth', 2);

xlabel('#N terms');
ylabel('error');
title('plot of estimated error vs N and actual error')