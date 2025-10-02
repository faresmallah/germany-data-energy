% =====================================
% Probability Distributions & CI (Normal)
% =====================================
% Fits Normal distributions to population, oil, and gas; computes 95% CI for mean & std;
% and plots histogram + fitted PDF overlay.
% Expected file: data/Germany_Sec4.xlsx

clear; clc;

% --- Load ---
T = readtable(fullfile('data','Germany_Sec4.xlsx'));
population      = T.population;
oil_consumption = T.oil_consumption;
gas_consumption = T.gas_consumption;

alpha = 0.05;

% ---- Population ----
mu_population    = mean(population);
sigma_population = std(population);
n_population     = numel(population);
se_population    = sigma_population / sqrt(n_population);

ci_mean_population = [mu_population - tinv(1-alpha/2, n_population-1)*se_population, ...
                      mu_population + tinv(1-alpha/2, n_population-1)*se_population];

chi2_lower_population = chi2inv(alpha/2, n_population-1);
chi2_upper_population = chi2inv(1-alpha/2, n_population-1);
ci_std_population = [sigma_population*sqrt((n_population-1)/chi2_upper_population), ...
                     sigma_population*sqrt((n_population-1)/chi2_lower_population)];

fprintf('Population Mean: %.2f | Std: %.2f\n', mu_population, sigma_population);
fprintf('95%% CI Mean: [%.2f, %.2f] | 95%% CI Std: [%.2f, %.2f]\n\n', ...
        ci_mean_population(1), ci_mean_population(2), ci_std_population(1), ci_std_population(2));

% ---- Oil ----
mu_oil    = mean(oil_consumption);
sigma_oil = std(oil_consumption);
n_oil     = numel(oil_consumption);
se_oil    = sigma_oil / sqrt(n_oil);

ci_mean_oil = [mu_oil - tinv(1-alpha/2, n_oil-1)*se_oil, ...
               mu_oil + tinv(1-alpha/2, n_oil-1)*se_oil];

chi2_lower_oil = chi2inv(alpha/2, n_oil-1);
chi2_upper_oil = chi2inv(1-alpha/2, n_oil-1);
ci_std_oil = [sigma_oil*sqrt((n_oil-1)/chi2_upper_oil), ...
              sigma_oil*sqrt((n_oil-1)/chi2_lower_oil)];

fprintf('Oil Mean: %.2f | Std: %.2f\n', mu_oil, sigma_oil);
fprintf('95%% CI Mean: [%.2f, %.2f] | 95%% CI Std: [%.2f, %.2f]\n\n', ...
        ci_mean_oil(1), ci_mean_oil(2), ci_std_oil(1), ci_std_oil(2));

% ---- Gas ----
mu_gas    = mean(gas_consumption);
sigma_gas = std(gas_consumption);
n_gas     = numel(gas_consumption);
se_gas    = sigma_gas / sqrt(n_gas);

ci_mean_gas = [mu_gas - tinv(1-alpha/2, n_gas-1)*se_gas, ...
               mu_gas + tinv(1-alpha/2, n_gas-1)*se_gas];

chi2_lower_gas = chi2inv(alpha/2, n_gas-1);
chi2_upper_gas = chi2inv(1-alpha/2, n_gas-1);
ci_std_gas = [sigma_gas*sqrt((n_gas-1)/chi2_upper_gas), ...
              sigma_gas*sqrt((n_gas-1)/chi2_lower_gas)];

fprintf('Gas Mean: %.2f | Std: %.2f\n', mu_gas, sigma_gas);
fprintf('95%% CI Mean: [%.2f, %.2f] | 95%% CI Std: [%.2f, %.2f]\n\n', ...
        ci_mean_gas(1), ci_mean_gas(2), ci_std_gas(1), ci_std_gas(2));

% ---- Visual Goodness of Fit ----
figure('Name','Goodness of Fit (Normal)');
subplot(3,1,1);
histogram(population,'Normalization','pdf'); hold on;
x_population = linspace(min(population), max(population), 100);
plot(x_population, normpdf(x_population, mu_population, sigma_population), 'r-','LineWidth',2);
title('Population: Goodness of Fit'); xlabel('Population'); ylabel('PDF'); hold off;

subplot(3,1,2);
histogram(oil_consumption,'Normalization','pdf'); hold on;
x_oil = linspace(min(oil_consumption), max(oil_consumption), 100);
plot(x_oil, normpdf(x_oil, mu_oil, sigma_oil), 'r-','LineWidth',2);
title('Oil Consumption: Goodness of Fit'); xlabel('Oil Consumption (TWh)'); ylabel('PDF'); hold off;

subplot(3,1,3);
histogram(gas_consumption,'Normalization','pdf'); hold on;
x_gas = linspace(min(gas_consumption), max(gas_consumption), 100);
plot(x_gas, normpdf(x_gas, mu_gas, sigma_gas), 'r-','LineWidth',2);
title('Gas Consumption: Goodness of Fit'); xlabel('Gas Consumption (TWh)'); ylabel('PDF'); hold off;

% saveas(gcf, fullfile('figures','goodness_of_fit.png'));
