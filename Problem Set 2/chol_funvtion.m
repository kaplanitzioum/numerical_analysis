function L = cholesky(A)
    [n, m] = size(A);
    if n ~= m
        error('input must be square matrix!!!!!!!!!');
    end
    
    L = zeros(n, n);
    
    for k = 1:n %col search
        %diagonal element (l_kk)
        %set sum for squared values of the current row's previous element
        sum_sq = 0;

        for j = 1:k-1 % left
            sum_sq = sum_sq + L(k,j)^2;
        end
        
        diag_val = A(k,k) - sum_sq; %
        if diag_val <= 0
            error('matrix not SPD :(');
        end
        L(k,k) = sqrt(diag_val);
        
        % (l_ik)
        for i = k+1:n % rows under the current diagonal kk
            sum_prod = 0;
            for j = 1:k-1
                sum_prod = sum_prod + L(i,j) * L(k,j);
            end
            L(i,k) = (1 / L(k,k)) * (A(i,k) - sum_prod);
        end
    end
end

A = [16, -28, 0; 
    -28, 53, 10; 
     0, 10, 29];
L_A = cholesky(A);
disp('Calculated L_A:');
disp(L_A);


B=[1 -2 3 -2;
  -2 20 -2 8
   3 -2 11 -5
   -2 8 -5 9];

L_B = cholesky(B);
disp('Calculated L_B:');
disp(L_B);
