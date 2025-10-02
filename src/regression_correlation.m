% ===================================
% Regression & Correlation (Population vs Oil)
% ===================================
% Fits linear model: oil_consumption ~ population, plots scatter + regression,
% predicts for example population values, and computes Pearson correlation.
% Expected file: data/Germany_Sec4.xlsx

clear; clc;

T = readtable(fullfile('data','Germany_Sec4.xlsx'));
population      = T.population;
oil_consumption = T.oil_consumption;

% --- Linear regression with fitlm ---
mdl = fitlm(population, oil_consumption);
disp(mdl);

% --- Scatter with regression line ---
figure('Name','Regression Line for Population vs Oil Consumption');
scatter(population, oil_consumption, 'filled'); hold on;
plot(population, mdl.Fitted, '-r', 'LineWidth', 2);
title('Regression Line for Population vs. Oil Consumption');
xlabel('Population'); ylabel('Oil Consumption (TWh)');
legend('Data points','Regression line','Location','best'); grid on; hold off;
% saveas(gcf, fullfile('figures','regression_population_oil.png'));

% --- Plain scatter plot ---
figure('Name','Scatter Plot of Population vs Oil Consumption');
scatter(population, oil_consumption, 'filled');
title('Scatter Plot of Population vs. Oil Consumption');
xlabel('Population'); ylabel('Oil Consumption (TWh)'); grid on;
% saveas(gcf, fullfile('figures','scatter_population_oil.png'));

% --- Predictions for example populations ---
population_10m = 10e6;
population_30m = 30e6;
beta0 = mdl.Coefficients.Estimate(1);
beta1 = mdl.Coefficients.Estimate(2);

pred_10m = beta0 + beta1*population_10m;
pred_30m = beta0 + beta1*population_30m;

fprintf('Predicted oil consumption at 10 million: %.2f (TWh)\n', pred_10m);
fprintf('Predicted oil consumption at 30 million: %.2f (TWh)\n', pred_30m);

% --- Pearson correlation ---
rho = corr(population, oil_consumption);
fprintf('Pearson correlation coefficient: %.2f\n', rho);
