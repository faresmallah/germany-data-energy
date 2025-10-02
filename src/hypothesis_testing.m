% =====================
% Hypothesis Testing
% =====================
% Performs one-sample t-tests on YoY % change for oil and gas consumption,
% and paired t-test comparing their changes.
% Expected file: data/Germany_Sec4.xlsx
% Required columns: oil_cons_change_pct, gas_cons_change_pct

clear; clc;

T = readtable(fullfile('data','Germany_Sec4.xlsx'));

oil_change = T.oil_cons_change_pct;
gas_change = T.gas_cons_change_pct;

% --- Oil: H0: mean == 0 ---
[h1, p1, ci1, stats1] = ttest(oil_change, 0);
fprintf('Oil Change - t-test vs 0: h=%d, p=%.4f\n', h1, p1);
fprintf('Confidence Interval: [%.4f, %.4f]\n', ci1(1), ci1(2));

% --- Gas: H0: mean == 0 ---
[h2, p2, ci2, stats2] = ttest(gas_change, 0);
fprintf('Gas Change - t-test vs 0: h=%d, p=%.4f\n', h2, p2);
fprintf('Confidence Interval: [%.4f, %.4f]\n', ci2(1), ci2(2));

% --- Paired t-test: gas vs oil ---
[h3, p3, ci3, stats3] = ttest(oil_change, gas_change);
fprintf('Equality Test (Oil vs Gas) - paired t-test: h=%d, p=%.4f\n', h3, p3);
fprintf('Confidence Interval (Oil minus Gas): [%.4f, %.4f]\n', ci3(1), ci3(2));
