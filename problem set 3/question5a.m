%5(a)
syms h %without this lost

fprintf('forward first derivative \n');
% {x0, x0+h} -> dx: [0, h] 
c_fw1 = computeCoefficients(1, [0, h]);
disp(c_fw1.') 

fprintf('\n centered first derivative \n');
% {x0-h, x0, x0+h} -> dx: [-h, 0, h] 
c_c1 = computeCoefficients(1, [-h, 0, h]);
disp(c_c1.')

fprintf('\n centered second derivative \n');
%{x0-h, x0, x0+h} -> dxx: [-h, 0, h] 
c_c2 = computeCoefficients(2, [-h, 0, h]);
disp(c_c2.')