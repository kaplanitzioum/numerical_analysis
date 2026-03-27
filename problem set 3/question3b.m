%newtons divided difference table algorith
x=[0,1,2];
y=[2,-1,4];
x_bar=1.3;

n=length(x);
F=zeros(n,n);

for i = 1:n
    F(i,1)=y(i);
end

for j=2:n %rest of cols
    for i=j:n
        a=F(i,j-1)-F(i-1,j-1);
        b=x(i)-x(i-j+1);
        F(i,j)=a/b;  % the coefficients i want are i,i
    end
end

coeff = diag(F);

val=coeff(1); %1st coeff a1

for k = 2:n
    term = coeff(k);
    for m = 1:k-1
        term = term * (x_bar - x(m));
    end
    val = val + term; % accumulate the value
end

fprintf('table:\n');
disp(F);
fprintf('approximation at x=1.3 is:%.2f\n',val); 

