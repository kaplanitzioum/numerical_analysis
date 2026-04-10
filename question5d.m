%question 5d 

odefun7 = @(t,y) sin(t) + y;
t_range = [0,1];
y0=0;
y_exact_1 = 0.5*(exp(1) - sin(1) - cos(1));

step_size= 1:10;
h_values = zeros(size(step_size));
errors = zeros(size(step_size));

for i= 1:length(step_size)
    Nh = 2^step_size(i);
    h = 1/Nh;

    [t,w] = backwardEuler(odefun7, t_range, y0, h);
    errors(i) = abs(y_exact_1 - w(end));%store error at t=1
    h_values(i) = h; %store h
end 
fprintf('loop done\n');

figure; 
loglog(h_values, errors, '-o', 'Color','r', 'LineWidth',2);
grid on; 
xlabel('step size h');
ylabel('Error');
title('Backward Euler Method');

