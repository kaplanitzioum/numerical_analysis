function Q = gram_schmidt(X)
% Q = gram_schmidt(X)
% X is input matrix
% Q is output matrix with orthonomal set of vectors spanning the same set as X aka the basis 
% this function implements the gram_schmidt method to produce a set of linearly independent and orthogonal vectors of X
% Kat Tzioumakis
% 2/9/2026

    [m, n] = size(X); 
    Q = zeros(m,0); %empty Q  
    %counter for orthonormal vectors
    nq = 0; 

    %--- main loop over cols of X---%
    for j = 1:n
        v = X(:,j);     %go to next col

        %loop over every vector in Q
        for i = 1:nq
            r_ij = Q(:,i)' * v;     %compute the projection of x_j on q_i

            v = v - r_ij *Q(:, i);  %subtract it from x_j to orthogonize v
        end

        r_jj = norm(v);     %compute norm of v

        if r_jj > 1e-16     %if norm is greater than roundoff error
            nq = nq + 1;    %add 1 to counter
            Q(:, nq) = v/r_jj;  %divide by its norm and add to final matrix Q
        end
    end
end


% --- 1(b) ---%
X_b = [1 1 1; 
       0 1 1; 
       0 0 1];
Q_b = gram_schmidt(X_b);

fprintf('Exercise 1(b)\n');
disp(Q_b);

% --- 1(c) ---%
X_c = [1 1 1;
       1 1 0;
       1 0 0];
Q_c = gram_schmidt(X_c);

fprintf('Exercise 1(c)\n');
disp(Q_c);

X_d = [2 -1 0;
       0 -1 2;
      -1 0 0;
      -1 2 -1];
Q_d = gram_schmidt(X_d);

fprintf('Exercise 1(d)\n');
disp(Q_d);
%--- check the norms of Q_c & Q_d ---%
norms = zeros(1, size(Q_c, 2));     % row=1 and col size the colsizeof Q_c 
for k = 1:size(Q_c,2)
    norms(k) = norm(Q_c(:,k));
end

fprintf('norms of Q_c cols:\n', norms);
disp(norms);

%--- check the orthogonality of the vectors---
fprintf('Dot products for Q_c:\n');
for i = 1:size(Q_c,2)
    for j = i+1:size(Q_c,2)
        dp = Q_c(:,i)' * Q_c(:,j);
        fprintf('Dot product of col %d and %d = %e\n', i, j, dp);
    end
end

fprintf('norms of Q_d columns:\n');
for k = 1:size(Q_d,2)
    fprintf('Norm of column %d in Q_d = %f\n', k, norm(Q_d(:,k)));
end

fprintf('Dot products for Q_d:\n');
for i = 1:size(Q_d,2)
    for j = i+1:size(Q_d,2)
        dp = Q_d(:,i)' * Q_d(:,j);
        fprintf('Dot product of col %d and %d = %e\n', i, j, dp);
    end
end

fprintf('Q_d'' * Q_d = \n');
disp(Q_d' * Q_d);

fprintf('Q_d * Q_d'' = \n');
disp(Q_d * Q_d');