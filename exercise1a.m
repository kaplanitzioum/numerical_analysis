%Exercise 1(a)

epsilon = 1e-8;
Sum = 0;
N = 0;

while 4/(2*N +3) > epsilon
    Sum = Sum + 4*((-1)^N) / (2*N +1);
    N = N + 1;
end

fprintf('Approximation of π: %.10f\n with thoeretical error: %.3e\n', Sum, 4/(2*N +3));