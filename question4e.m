% use to solve y'=ycost, y(0)=1

odefun4 = @(t,y) y*cos(t);
t_range= [0,2*pi];

y0=1;
h=pi/4;
y_exact = @(t)exp(sin(t));


%forwards euler
[forward_t, forward_w] = forwardEuler(odefun4, [0,pi/2], y0,h);
fprintf('fe approximation of pi/2: %.5f\n', forward_w(end));

%backwards euler
[backwards_t, backwards_w] = backwardEuler(odefun4, [0,pi/2], y0, h);
fprintf('be approximation of pi/2: %.5f\n', backwards_w(end));

%exact solution
t_exact = linspace(0,pi/2, 100);
y_exact = exp(sin(t_exact));


figure; 
plot(t_exact, y_exact, 'k-', 'LineWidth',2);
hold on;
plot(forward_t, forward_w, 'r-o', 'LineWidth', 1.5, 'DisplayName', 'forward euler');
plot(backwards_t, backwards_w, 'b-s', 'LineWidth',1.5, 'DisplayName','backwards euler');
grid on; 
legend;