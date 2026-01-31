%Exercise 1(b)

epsilon = 5e-3;
true_value = 3.1415926;

Sum = 0;
N = 0;

while 4/(2*N +3) > epsilon
    Sum = Sum + 4*((-1)^N) / (2*N +1);
    N = N + 1;
end

actual_error = abs(Sum - true_value);

fprintf('Approximation of π: %.10f\nwith thoeretical error: %.3e\n', Sum, 4/(2*N +3));
fprintf('Actual error: %.6e\n', actual_error);