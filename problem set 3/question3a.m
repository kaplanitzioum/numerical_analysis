%nevilles algorith
x=[0,1,2];
y=[2,-1,4];
x_bar=1.3;

n=length(x);
Q=zeros(n,n);

for i=1:n
    Q(i, 1) = y(i); %copy data into 1st col
end

for j=2:n
    for i=j:n
        a=(x_bar-x(i-j+1))*Q(i,j-1) - (x_bar-x(i))*Q(i-1,j-1);
        b = x(i)-x(i-j+1);

        Q(i,j)=a/b;
    end
end

approximation = Q(n, n);

fprintf('nevilles table:\n');
disp(Q);
fprintf('approximaiton of x=1.3 is: %.2f\n',approximation);