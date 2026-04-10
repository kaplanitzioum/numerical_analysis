% forward euler on 5b

odefun5 = @(t,y) sin(t) +y;
t_range = [0,1];
y0=0; %init cond
Nh=2;
h = (t_range(2) - t_range(1))/ Nh;

[t,w] = forwardEuler(odefun, t_range, y0, h);

%approx val @ t=1 is last element
approx_y1 = w(end);

y_exact = @(t) 0.5*(exp(t) - sin(t) - cos(t));
exact_val = y_exact(1); %compute at t=1
%error between the approximate and exact values
error = abs(approx_y1 - exact_val);

fprintf('Approximate y(1): %.4f\n', approx_y1);
fprintf('error: %.4f\n', error);