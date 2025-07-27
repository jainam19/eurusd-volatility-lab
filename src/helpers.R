suppressPackageStartupMessages({
  library(tidyverse); library(lubridate); library(readr)
  library(forecast); library(tseries); library(FinTS)
  library(ggplot2); library(ggfortify)
  .rugarch_ok <- requireNamespace("rugarch", quietly = TRUE)
  .fGarch_ok <- requireNamespace("fGarch", quietly = TRUE)
})

read_eurusd <- function() {
  if (file.exists("data/eurusd.csv")) {
    df <- readr::read_csv("data/eurusd.csv", show_col_types = FALSE)
  } else if (file.exists("data/EURUSD=X.csv")) {
    df <- readr::read_csv("data/EURUSD=X.csv", show_col_types = FALSE)
  } else {
    stop("Place data at data/eurusd.csv or data/EURUSD=X.csv (see data/README_download.md).")
  }
  names(df) <- tolower(names(df))
  if (!"close" %in% names(df) && !"adj close" %in% names(df)) {
    stop("CSV must have 'Close' or 'Adj Close' column.")
  }
  close_col <- if ("close" %in% names(df)) "close" else "adj close"
  df <- df %>% mutate(date = as.Date(date)) %>% arrange(date) %>%
    transmute(date, close = .data[[close_col]])
  df
}

compute_returns <- function(df) {
  df %>% mutate(ret = log(close) - dplyr::lag(log(close))) %>% tidyr::drop_na()
}