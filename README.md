# EUR/USD Volatility Lab — ARIMA + GARCH (end‑to‑end)

A reproducible **R** workflow that models **EUR/USD daily returns** with an **ARIMA** mean and **GARCH(1,1)** volatility, including diagnostics and simple risk backtests (**VaR/ES**). The goal is a clear, finance‑oriented pipeline: data → returns → stationarity → ARIMA → GARCH → rolling forecasts → VaR coverage.

---

## 1) Dataset
- Source: EUR/USD daily OHLCV (e.g., Yahoo Finance).  
- Local path expected: `data/eurusd.csv` **or** `data/EURUSD=X.csv` with columns `Date, Open, High, Low, Close, ...` (first row header).  
- This repo **does not** commit raw market data. See `data/README_download.md` for options.

## 2) Method (overview)
- **Returns:** log returns from adjusted close; basic cleaning.
- **Stationarity:** ADF/KPSS; ACF/PACF; Ljung‑Box; ARCH effects.
- **Models:** `auto.arima` for mean; `GARCH(1,1)` (Gaussian or Student‑t) for volatility.
- **Evaluation:** holdout or rolling 1‑step‑ahead forecasts; compare naive RW vs. ARIMA vs. ARIMA+GARCH.
- **Risk:** **VaR/ES** at 95%/99% using conditional volatility; simple coverage tests.

## 3) Reproduce
```r
# 1) Install required packages (one-time)
source("install.R")

# 2) Place data (CSV) -> see data/README_download.md

# 3) Render the analysis (creates HTML next to the Rmd)
rmarkdown::render("notebooks/model.Rmd")
```
To knit in RStudio: open `notebooks/model.Rmd` → **Knit**.

## 4) Repository layout
```
/data/                      # raw data kept locally only; see data/README_download.md
/figs/                      # exported plots (key_plot.png etc.)
/notebooks/model.Rmd        # main analysis (end-to-end)
/src/                       # helper functions (metrics, plotting)
/docs/                      # optional write-ups
.github/workflows/          # CI scaffold (disabled by default)
install.R                   # installs CRAN packages used in the project
README.md
```

## 5) Notes
- This is an educational time‑series/risk exercise; not investment advice.
- Numbers depend on time window and data vendor adjustments.
- `rugarch` (for GARCH) may require Rtools on Windows; `fGarch::garch()` is provided as a fallback.

## 6) References
- Tsay, Ruey S. *Analysis of Financial Time Series.*
- Hyndman & Athanasopoulos. *Forecasting: Principles and Practice.*
- CRAN packages: forecast, rugarch, fGarch, tseries, FinTS, ggplot2, ggfortify, lubridate, readr, dplyr