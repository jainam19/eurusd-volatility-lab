suppressPackageStartupMessages({
  library(tidyverse); library(lubridate); library(readr)
  library(forecast); library(tseries); library(FinTS)
  library(ggplot2); library(ggfortify); library(here)
})

read_eurusd <- function() {
  f1 <- here::here("data","eurusd.csv")
  f2 <- here::here("data","EURUSD=X.csv")
  p  <- if (file.exists(f1)) f1 else if (file.exists(f2)) f2 else NA
  if (is.na(p)) stop("Place data at data/eurusd.csv or data/EURUSD=X.csv (see data/README_download.md).")
  df <- readr::read_csv(p, show_col_types = FALSE)
  names(df) <- tolower(names(df))
  if (!"close" %in% names(df) && !"adj close" %in% names(df)) {
    stop("CSV must have 'Close' or 'Adj Close' column.")
  }
  close_col <- if ("close" %in% names(df)) "close" else "adj close"
  df |> mutate(date = as.Date(date)) |> arrange(date) |> transmute(date, close = .data[[close_col]])
}

compute_returns <- function(df) {
  df |> mutate(ret = log(close) - dplyr::lag(log(close))) |> tidyr::drop_na()
}
