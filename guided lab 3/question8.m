filename = 'observed-timeseries-of-a.csv';
%set options to read semicolon-delimited files
%treat temperature column as 'text' first to fix the commas
opts = detectImportOptions(filename, 'Delimiter', ';');
opts = setvartype(opts, [2, 3], 'char'); 
tbl = readtable(filename, opts);

%extract col1 and convert to a numeric array
x_time = tbl{:, 1};

% extract col2 and get the raw string data
temp_strings = tbl{:, 2};

%replace commas with dots and convert to double
y_temp = strrep(temp_strings, ',', '.');
y_temp = str2double(y_temp);

%every other point
x_half = x_time(1:2:end);
y_half = y_temp(1:2:end);

%points NOT used
x_skipped_half = x_time(2:2:end);
y_skipped_half = y_temp(2:2:end);

%interpolate the half
split_days = min(x_time):0.1:max(x_time);
ystar_half = zeros(size(split_days));
for i = 1:length(split_days)
    ystar_half(i) = cubic_spline(x_half, y_half, split_days(i));
end

%interpolate at skipped points for error comparison
ystar_at_skipped_half = zeros(size(x_skipped_half));
for i = 1:length(x_skipped_half)
    ystar_at_skipped_half(i) = cubic_spline(x_half, y_half, x_skipped_half(i));
end

%errors at skipped points
errors_half = abs(ystar_at_skipped_half - y_skipped_half);
fprintf('Every other point, max error: %.4f °C, mean error: %.4f °C\n', max(errors_half), mean(errors_half));

figure;
plot(x_time, y_temp, 'ro', 'MarkerSize', 4, 'DisplayName', 'All Data');
hold on;
plot(x_half, y_half, 'b^', 'MarkerSize', 6, 'DisplayName', 'Used Points (every other)');
plot(split_days, ystar_half, 'b-', 'LineWidth', 1.2, 'DisplayName', 'Spline (every other)');
plot(x_skipped_half, y_skipped_half, 'rx', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Skipped Points');
plot(x_skipped_half, ystar_at_skipped_half, 'g+', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Interpolated at Skipped');
xlabel('Year');
ylabel('Temperature (°C)');
title('Question 8: Spline with Every Other Point');
legend('Location', 'best');
grid on;

%every 3rd point
x_third = x_time(1:3:end);
y_third = y_temp(1:3:end);

%points NOT used, so all points not in x_third
mask_third = true(size(x_time));
mask_third(1:3:end) = false;
x_skipped_third = x_time(mask_third);
y_skipped_third = y_temp(mask_third);

%interpolate every third
ystar_third = zeros(size(split_days));
for i = 1:length(split_days)
    ystar_third(i) = cubic_spline(x_third, y_third, split_days(i));
end

%interpolate at skipped points 
ystar_at_skipped_third = zeros(size(x_skipped_third));
for i = 1:length(x_skipped_third)
    ystar_at_skipped_third(i) = cubic_spline(x_third, y_third, x_skipped_third(i));
end

%errors at skipped points
errors_third = abs(ystar_at_skipped_third - y_skipped_third);
fprintf('Every 3rd point, max error: %.4f °C, mean error: %.4f °C\n', max(errors_third), mean(errors_third));

figure;
plot(x_time, y_temp, 'ko', 'MarkerSize', 4, 'DisplayName', 'All Data');
hold on;
plot(x_third, y_third, 'b^', 'MarkerSize', 6, 'DisplayName', 'Used Points (every 3rd)'); %triangle
plot(split_days, ystar_third, 'b-', 'LineWidth', 1.2, 'DisplayName', 'Spline (every 3rd)');
plot(x_skipped_third, y_skipped_third, 'mx', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Skipped Points'); %red x
plot(x_skipped_third, ystar_at_skipped_third, 'g+', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Interpolated at Skipped');
xlabel('Year');
ylabel('Temperature (°C)');
ylabel('Temperature (°C)');
title('Question 8: Spline with Every 3rd Point');
legend('Location', 'best');
grid on;