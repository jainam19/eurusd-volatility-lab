# EUR/USD Volatility Lab — ARIMA + GARCH (end‑to‑end)

A reproducible **R** workflow that models **EUR/USD daily returns** with an **ARIMA** mean and **GARCH(1,1)** volatility, including diagnostics and simple risk backtests (**VaR/ES**). The goal is a clear finance pipeline: data → returns → stationarity → ARIMA → GARCH → rolling forecasts → VaR coverage.

## 1) Dataset
- Source: EUR/USD daily OHLCV (e.g., Yahoo Finance `EURUSD=X`).
- Local path expected: `data/eurusd.csv` **or** `data/EURUSD=X.csv`.
- Raw data is **not** committed; see `data/README_download.md`.

## 2) Method (overview)
Returns from adjusted close; ADF/KPSS, ACF/PACF; ARIMA for mean; GARCH(1,1) for volatility (Gaussian or Student‑t); holdout or rolling 1‑step‑ahead; VaR/ES @95/99 with simple coverage checks.

## 3) Reproduce
```r
# 1) Install packages
source("install.R")
# 2) Place CSV under data/ (see data/README_download.md)
# 3) Render
rmarkdown::render("notebooks/model.Rmd")
```
To knit in RStudio: open `eurusd-volatility-lab.Rproj`, then Knit.

## 4) Layout
```
/data/                      # local data only; see data/README_download.md
/figs/                      # exported figures (key_plot.png)
/notebooks/model.Rmd        # main analysis
/src/helpers.R              # data + return helpers
/docs/                      # (optional) write-ups
/.github/workflows/         # CI scaffold (disabled)
install.R                   # CRAN packages installer
```

## 5) Notes
Educational time‑series/risk exercise; not investment advice.
