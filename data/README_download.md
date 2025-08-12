# Data download / placement (EUR/USD daily)

Place a CSV at either path:
- `data/eurusd.csv`  (preferred) or
- `data/EURUSD=X.csv` (Yahoo export)

Columns required: `Date`, `Close` (or `Adj Close`).

## Option A — Manual (fastest)
1. Export EURUSD daily from Yahoo Finance (symbol: `EURUSD=X`).
2. Save as `data/EURUSD=X.csv`.

## Option B — quantmod (R)
```r
install.packages("quantmod", repos = "https://cloud.r-project.org")
library(quantmod)
x <- getSymbols("EURUSD=X", src = "yahoo", from = "2013-01-01", auto.assign = FALSE)
df <- data.frame(Date = index(x), Close = as.numeric(Cl(x)))
readr::write_csv(df, "data/eurusd.csv")
```
