%%backwards euler functoin

function [t,w] = backwardEuler(odefun, t_range, y0, h)
    t = t_range(1):h:t_range(2);
    n = length(t);
    w = zeros(1,n);    
    w(1) = y0; % my init condition


    options = optimoptions('fsolve', 'Display', 'off');
    for i = 1:(n-1)
        %odefun loos at time value at next step
        %fsolve: w_dummy is the next w1+1 using fsolve (rearranged
        %backwards euler since we dont know the next value
        %w(i) as the 2nd param is the where fsolve starts looking 
        w(i+1) = fsolve(@(w_dummy) w_dummy - w(i) - h*odefun(t(i+1), w_dummy), w(i), options);
    end 
end