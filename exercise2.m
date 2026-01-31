%exercise 2

x = logspace(-10,10, 100);

seq1 = sin(x.^2) ./x.^2;
seq2 = (sin(x)).^2 ./ x.^2;

error1 = abs(seq1 - 1);
error2 = abs(seq2 - 1);

figure
loglog(x, error1, 'g', "LineWidth", 2);
hold on
loglog(x, error2, 'm',"LineWidth", 2);

xlabel('x')
ylabel('Error')
title('rate of convergence to 1')