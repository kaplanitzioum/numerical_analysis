syms y(t)
% Define the ODE: y' = y + sin(t) with y(0) = 0
ode = diff(y,t) == y + sin(t);
cond = y(0) == 0;

% Solve analytically
y_exact = dsolve(ode, cond)