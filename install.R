# Minimal installer for required CRAN packages
pkgs <- c(
  "tidyverse", "readr", "lubridate", "ggplot2", "ggfortify",
  "forecast", "tseries", "FinTS", "fGarch", "rugarch",
  "rmarkdown"
)
to_install <- setdiff(pkgs, rownames(installed.packages()))
if (length(to_install)) install.packages(to_install, repos = "https://cloud.r-project.org")
message("Packages ready. You can now run: rmarkdown::render('notebooks/model.Rmd')")