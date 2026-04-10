%question 5b
odefun6 = @(t,y) sin(t)+y;
t_range = [0,1];
y0=0;
y_exact_1 = 0.5*(exp(1) - sin(1) - cos(1));

step_size= 1:20;
h_values = zeros(size(step_size));
errors = zeros(size(step_size));

for i= 1:length(step_size)
    Nh = 2^step_size(i);
    h = 1/Nh;

    [t,w] = forwardEuler(odefun6, t_range, y0, h);
    errors(i) = abs(y_exact_1 - w(end));%store error at t=1
    h_values(i) = h; %stpre h
end

figure; 
loglog(h_values, errors, '-o', 'LineWidth', 2);
grid on; 
xlabel('Step Size (h)');
ylabel('Error at t=1');
title('forwards euler');