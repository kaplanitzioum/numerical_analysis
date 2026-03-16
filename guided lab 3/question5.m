%data from Example 5.17
%molality (x values)
x_data = [0.005; 0.010; 0.020; 0.050; 0.100; 0.200; 0.500; 1.000; 2.000];

%coefficient (y values)
y_data = [0.924; 0.896; 0.859; 0.794; 0.732; 0.656; 0.536; 0.430; 0.316];

%point to be evaluated
xstar = 0.032;

ystar = cubic_spline(x_data, y_data, xstar);

fprintf('The estimated activity coefficient at molality 0.032 is: %f\n', ystar);
