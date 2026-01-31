%exercise 5(a)

x = linspace(-5e-6, 5e-6, 1001);

func = log(1+x) - cos(x) - x + 1;

figure
plot(x, func, 'Linewidth', 1.5);
xlabel('x')
ylabel('f(x)');
title('plot of f(x)')