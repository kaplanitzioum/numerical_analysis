%question 4
f = @(x) x .* exp(-x);
xrng = [-1, 3]; %range of x
deg = 4; %polynomial degree
n_pts = deg + 1; %number of actual points

%grid for errors
x_grid = linspace(xrng(1), xrng(2), 1000);
y_grid = f(x_grid);

%% (a)uniformly points
x_unif = linspace(xrng(1), xrng(2), n_pts);
y = f(x_unif);
n = length(x_unif); % bc i want 5
F = zeros(n, n);
for i = 1:n
    F(i, 1) = y(i);
end
for j = 2:n 
    for i = j:n
        a = F(i, j-1) - F(i-1, j-1);
        b = x_unif(i) - x_unif(i-j+1);
        F(i, j) = a / b;  
    end
end
coeff = diag(F);

%newton polynomial on grid
y_pol_unif = zeros(size(x_grid));
for cnt = 1:length(x_grid) 
    x_bar = x_grid(cnt); 
    val = coeff(1);
    for k = 2:n
        term = coeff(k);
        for m = 1:k-1, term = term * (x_bar - x_unif(m)); end
        val = val + term;
    end
    y_pol_unif(cnt) = val;
end
err_unif = abs(y_grid - y_pol_unif);
fprintf('uniform:   L_inf = %.6f, L2 = %.6f\n', max(err_unif), sqrt(trapz(x_grid, err_unif.^2)));

%% (b)Chebyshev points 
t_cheb = cos((2*(0:deg)+1)/(2*(deg+1))*pi);  
x_cheb = 0.5*diff(xrng)*t_cheb + mean(xrng); 
y = f(x_cheb);
F = zeros(n, n);
for i = 1:n
    F(i, 1) = y(i);
end
for j = 2:n 
    for i = j:n
        a = F(i, j-1) - F(i-1, j-1);
        b = x_cheb(i) - x_cheb(i-j+1);
        F(i, j) = a / b;  
    end
end
coeff = diag(F);

%chebyshev evaluation on grid
y_pol_cheb = zeros(size(x_grid));
for cnt = 1:length(x_grid)
    x_bar = x_grid(cnt); val = coeff(1);
    for k = 2:n
        term = coeff(k);
        for m = 1:k-1, term = term * (x_bar - x_cheb(m)); end
        val = val + term;
    end
    y_pol_cheb(cnt) = val;
end
err_cheb = abs(y_grid - y_pol_cheb);
fprintf('chebyshev: L_inf = %.6f, L2 = %.6f\n', max(err_cheb), sqrt(trapz(x_grid, err_cheb.^2)));

%% (c)legendre points
try
    syms xs 
    t_lgnd = double(vpasolve(legendreP(n_pts, xs) == 0))'; %remember 5 points
    x_lgnd = 0.5*diff(xrng)*t_lgnd + mean(xrng); 
    y = f(x_lgnd);
    F = zeros(n, n);
    for i = 1:n
        F(i, 1) = y(i);
    end
    for j = 2:n 
        for i = j:n
            a = F(i, j-1) - F(i-1, j-1);
            b = x_lgnd(i) - x_lgnd(i-j+1);
            F(i, j) = a / b;  
        end
    end
    coeff = diag(F);

    %legendre evaluation on grid
    y_pol_lgnd = zeros(size(x_grid));
    for cnt = 1:length(x_grid)
        x_bar = x_grid(cnt); val = coeff(1);
        for k = 2:n
            term = coeff(k);
            for m = 1:k-1, term = term * (x_bar - x_lgnd(m)); end
            val = val + term;
        end
        y_pol_lgnd(cnt) = val;
    end
    err_lgnd = abs(y_grid - y_pol_lgnd); 
    fprintf('legendre: L_inf = %.6f, L2 = %.6f\n', max(err_lgnd), sqrt(trapz(x_grid, err_lgnd.^2)));
catch
    fprintf('Legendre:syms not here :(d\n');
end