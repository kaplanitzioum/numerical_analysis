%Exercise 5(b)
x = linspace(-5e-6, 5e-6, 1001);

taylor_func = x.^3/3 - 7*x.^4/24;

figure
plot(x, taylor_func, 'Linewidth', 1.5);
xlabel('x')
ylabel('f(x)');
title('plot of f(x) avoiding cancellation error')