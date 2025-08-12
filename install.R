# Minimal installer for required CRAN packages
pkgs <- c(
  "tidyverse", "readr", "lubridate", "timechange", "here",
  "ggplot2", "ggfortify",
  "forecast", "tseries", "FinTS",
  "fGarch", "rugarch",
  "rmarkdown", "quantmod"
)
to_install <- setdiff(pkgs, rownames(installed.packages()))
if (length(to_install)) install.packages(to_install, repos = "https://cloud.r-project.org")
message("Packages ready. Run: rmarkdown::render('notebooks/model.Rmd')")
