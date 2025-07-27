# Data download / placement (EUR/USD daily)

Place a CSV at either path:
- `data/eurusd.csv`  (preferred name), or
- `data/EURUSD=X.csv` (Yahoo export)

The file should have at least: `Date` and `Close` (or `Adj Close`).

## Option A — Manual (fastest)
1. Export EURUSD daily from Yahoo Finance (symbol: `EURUSD=X`).
2. Save as `data/EURUSD=X.csv`.

## Option B — quantmod (R)
```r
install.packages("quantmod")
library(quantmod)
getSymbols("EURUSD=X", src = "yahoo", from = "2013-01-01")
df <- data.frame(Date = index(`EURUSD=X`), Close = as.numeric(Cl(`EURUSD=X`)))
readr::write_csv(df, "data/eurusd.csv")
```

> The notebook will check both `data/eurusd.csv` and `data/EURUSD=X.csv`.