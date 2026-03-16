function ystar = cubic_spline(x,y,xstar)

%question 1
%n is the number of subintervals [cite: 401]
n = length(x) - 1;

%initialize A and rvec (the RHS) 
A = zeros(n+1, n+1);
rvec = zeros(n+1, 1);

%calculate vector of h values (spacing between points) 
h = zeros(n,1);
for j = 1:n
    h(j) = x(j+1) - x(j);
end

%natural boundary conditions: A(1,1) and A(n+1,n+1) = 1 
A(1,1) = 1;
A(n+1,n+1) = 1;

%populate rest of matrix A and rvec
for i = 2:n
    A(i, i-1) = h(i-1);          
    A(i, i)   = 2*(h(i-1) + h(i)); 
    A(i, i+1) = h(i);            
    
    % The right-hand side vector rvec 
    term1 = (y(i+1) - y(i)) / h(i);
    term2 = (y(i) - y(i-1)) / h(i-1);
    rvec(i) = 3 * (term1 - term2);
end

%question 2
% Use MATLAB's backslash operator to solve A*c = rvec
c = A \ rvec;

%question 3
%(a) a_j are simply the y values
a = y; 

%(b-c) Calculate d and b for each subinterval 
d = zeros(n,1);
b = zeros(n,1);
for j = 1:n
    d(j) = (c(j+1) - c(j)) / (3 * h(j));
    b(j) = (y(j+1) - y(j)) / h(j) - (h(j) / 3) * (2*c(j) + c(j+1));
end

%question 4
coeffs = [];
for k = 1:n
    coeffs(k,:) = [d(k) c(k) b(k) a(k)];
end

breaks = x;
pp = mkpp(breaks, coeffs); 
ystar = ppval(pp, xstar);  

end