%function that computes the coefficitnts 
%n->order of deriv and dx=xj-xbar row vector 
function coeffs = computeCoefficients(n,dx)

k=length(dx);
U=sym(zeros(k,k));

for i=1:k
    U(i, :) = dx.^ (i-1); %h terms, row vextor 
end

%solve hte system but i want all dx but the nth one to be 0
b=zeros(k,1); %column vextor k rows 1 col
b(n+1) = factorial(n); %to cancel out the 1/n! in taylors exp bc i want the plain coeff
coeffs = U\b;
