<!-- badges: start -->
[![R-CMD-check](https://github.com/EpiForeSITE/shiny-demo-pkg/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/EpiForeSITE/shiny-demo-pkg/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# shinydemo

This is a simple R package that exemplifies how to create a package for a single R shiny app. Some features included in this package are:

- The usage of `roxygen2` for documentation.
- Using GitHub actions for checking the R package (CI).
- Using `system.file()` for accessing special files in the package (the app itself).
- Using the `www/` subfolder in the shinyapp.

The function that calls app is located in [R/run_my_app.R](R/run_my_app.R). The shinyapp is located in [inst/app/](inst/app).

## Installation

You can install the development version of shinydemo like so:

``` r
devtools::install_github("EpiForeSITE/shiny-demo-pkg")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(shinydemo)
run_shiny_app()
```

