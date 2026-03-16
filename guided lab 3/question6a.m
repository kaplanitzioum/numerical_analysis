%question 6(a)
days = [0; 6; 10; 13; 17; 20; 28];

avg_young_weight = [7; 18; 45; 40; 32; 30.5; 30];
avg_mature_weight =[7; 16; 19; 15; 12; 10.5; 10];

%3 days
xstar = 3;

ystar_young = cubic_spline(days, avg_young_weight, xstar);
ystar_mature = cubic_spline(days, avg_mature_weight, xstar);
%spline function
ml_young = spline(days, avg_young_weight,xstar);
ml_mature = spline(days, avg_mature_weight, xstar);


fprintf('natural bounds young = %.2f, matlab young = %.2f\n', ystar_young, ml_young);
fprintf('natural bounds mature = %.2f, matlab mature = %.2f\n',ystar_mature, ml_mature);