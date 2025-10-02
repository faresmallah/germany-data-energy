# 🇩🇪 NGN 211 – Analyzing Yearly Energy Consumption in Germany

This repository contains MATLAB code extracted and organized from the project report for **NGN 211 – Introduction to Engineering Probability and Statistics**. It analyzes population, oil consumption, and natural gas consumption in Germany using descriptive statistics, probability distributions, hypothesis testing, and correlation/regression.

## 📂 Project Structure
```
ngn211-energy-germany/
├── README.md
├── data/
│   └── README.md                     # data schema & sourcing notes
├── src/
│   ├── descriptive_statistics.m
│   ├── probability_distributions.m
│   ├── hypothesis_testing.m
│   └── regression_correlation.m
├── figures/                          # figures saved by scripts (if you add saving)
└── results/                          # tables/exports you may save
```

## ▶️ How to Run (MATLAB)
1. Place the dataset file `Germany_Sec4.xlsx` in the `data/` folder.
2. Open MATLAB and set the repo as your **Current Folder**.
3. Run the scripts under `src/` in this order (or independently as needed):
   - `descriptive_statistics.m`
   - `probability_distributions.m`
   - `hypothesis_testing.m`
   - `regression_correlation.m`

> **Note:** The scripts assume the sheet has the following columns (see `data/README.md`).

## ✅ Expected Columns
- `year`
- `population`
- `oil_consumption` (TWh)
- `gas_consumption` (TWh)
- `oil_cons_change_pct` (% change YoY)
- `gas_cons_change_pct` (% change YoY)

## 🔧 Optional: Save Figures & Tables
The scripts currently **display** figures. If you prefer saving, uncomment the `saveas(...)` lines (already included, commented out).

## 📜 License
MIT (or your course policy). Modify as needed.
