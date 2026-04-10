%%forward Euler function

function [t,w] = forwardEuler(odefun, t_range, y0, h)
    t = t_range(1):h:t_range(2);
    n = length(t);
    w = zeros(1,n);
    w(1) = y0; % my init condition



    for i = 1:n-1
        w(i+1) = w(i) + h * odefun(t(i), w(i));
    end
end
