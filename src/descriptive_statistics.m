% ==============================
% Descriptive Statistics & EDA
% ==============================
% Loads Germany energy dataset and computes descriptive statistics with basic visuals.
% Expected file: data/Germany_Sec4.xlsx
% Required columns: year, population, oil_consumption, gas_consumption

clear; clc;

% --- Load ---
T = readtable(fullfile('data','Germany_Sec4.xlsx'));

year            = T.year;
population      = T.population;
oil_consumption = T.oil_consumption;
gas_consumption = T.gas_consumption;

% --- Descriptive Statistics ---
pop_mean   = mean(population);   pop_median = median(population);   pop_std = std(population);
oil_mean   = mean(oil_consumption); oil_median = median(oil_consumption); oil_std = std(oil_consumption);
gas_mean   = mean(gas_consumption); gas_median = median(gas_consumption); gas_std = std(gas_consumption);

fprintf('Population - Mean: %.2f, Median: %.2f, Std Dev: %.2f\n', pop_mean, pop_median, pop_std);
fprintf('Oil Consumption - Mean: %.2f, Median: %.2f, Std Dev: %.2f\n', oil_mean, oil_median, oil_std);
fprintf('Gas Consumption - Mean: %.2f, Median: %.2f, Std Dev: %.2f\n', gas_mean, gas_median, gas_std);

% --- Histogram: Population ---
figure('Name','Histogram of Population');
histogram(population,'EdgeColor','k','FaceAlpha',0.7);
title('Histogram of Population'); xlabel('Population'); ylabel('Frequency'); grid on;
% saveas(gcf, fullfile('figures','hist_population.png'));

% --- Time Series ---
figure('Name','Population Over Years');
plot(year, population,'-o'); title('Population Over Years');
xlabel('Year'); ylabel('Population'); grid on;
% saveas(gcf, fullfile('figures','ts_population.png'));

figure('Name','Oil Consumption Over Years');
plot(year, oil_consumption,'-o','Color',[1,0.5,0]); title('Oil Consumption Over Years');
xlabel('Year'); ylabel('Oil Consumption (TWh)'); grid on;
% saveas(gcf, fullfile('figures','ts_oil.png'));

figure('Name','Gas Consumption Over Years');
plot(year, gas_consumption,'-o','Color','green'); title('Gas Consumption Over Years');
xlabel('Year'); ylabel('Gas Consumption (TWh)'); grid on;
% saveas(gcf, fullfile('figures','ts_gas.png'));

% --- Boxplots ---
figure('Name','Boxplot of Population');
boxplot(population,'orientation','horizontal');
title('Boxplot of Population'); xlabel('Population'); grid on;
% saveas(gcf, fullfile('figures','box_population.png'));

figure('Name','Boxplot of Oil and Gas Consumption');
boxplot([oil_consumption, gas_consumption], 'Labels', {'Oil Consumption','Gas Consumption'});
title('Boxplot of Oil and Gas Consumption'); xlabel('Consumption (TWh)'); grid on;
% saveas(gcf, fullfile('figures','box_oil_gas.png'));
