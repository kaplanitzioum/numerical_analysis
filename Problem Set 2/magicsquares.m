%% exercise 1
clear all;
n_values = 100:100:10000;
duration = zeros(size(n_values));
determinants = zeros(size(n_values));
for i= 1:length(n_values)
    n = n_values(i);

    init_time = cputime;

    M = magic(n);
    d = det(M);
    duration(i) = cputime-init_time;
    determinants(i) = d;


   % print
    fprintf('n = %d\n', n);
    fprintf('Determinant: %.6e\n', d);   
    fprintf('Duration = %.6f sec\n', duration(i));
end

%find C such that computation time scales approximately as tn approaches Cn^3 
C = duration(end) / (n_values(end)^3);

figure;
semilogy(n_values, duration, 'r');
hold on;
semilogy(n_values, C * n_values.^3, 'b-', 'LineWidth', 1.5);
grid on;
xlabel('matrix order (n)');
ylabel('CPU time (sec)');
legend('actual CPU time', 'approximate scaling (Cn^3)');
title('time to compute det');