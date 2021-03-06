
<!-- README.md is generated from README.Rmd. Please edit that file -->

# usetheprocess

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

This package sets up a usethis-like framework for R and app dev.

## Installation

You can install `usetheprocess` from either r-universe or remotes:

``` r
install.packages("usetheprocess",repos = "https://dynastyprocess.r-universe.dev")

# or

# install.packages("remotes")
remotes::install_github("dynastyprocess/usetheprocess") 
```

## Usage

Create the framework for a new Shiny app by running:

``` r
usetheprocess::app_create(path = "demo/new_app")
#> -- Creating dir ----------------------------------------------------------------
#> v Created app directory
#> v RStudio project initialisation
#> -- Copying app skeleton --------------------------------------------------------
#> v Copied app skeleton
#> v Substituted new_app for AppName
#> demo/new_app
#> +-- app.R
#> +-- DESCRIPTION
#> +-- Dockerfile
#> +-- dp.css
#> +-- LICENSE
#> +-- LICENSE.md
#> +-- NEWS.md
#> +-- new_app.Rproj
#> +-- R
#> |   +-- 0_packages.R
#> |   \-- 1_ui_functions.R
#> \-- tests
#>     \-- test_pipeline.R
#> -- Done ------------------------------------------------------------------------
```

and it will build an app skeleton.

Create the skeleton of a new package by running: Create the framework
for a new Shiny app by running:

``` r
usetheprocess::pkg_create(path = "demo/new_pkg")
#> -- Creating app directory ------------------------------------------------------
#> v Created app directory
#> v RStudio project initialisation
#> -- Copying package skeleton ----------------------------------------------------
#> v Copied package skeleton
#> v Substituted new_pkg for PkgName
#> demo/new_pkg
#> +-- codecov.yml
#> +-- DESCRIPTION
#> +-- LICENSE
#> +-- LICENSE.md
#> +-- man
#> |   \-- pipe.Rd
#> +-- NAMESPACE
#> +-- new_pkg.Rproj
#> +-- pkgdown
#> |   +-- extra.css
#> |   \-- _pkgdown.yml
#> +-- PkgName.Rproj
#> +-- R
#> |   \-- utils.R
#> +-- README.md
#> +-- README.Rmd
#> \-- tests
#>     +-- testthat
#>     |   \-- setup.R
#>     \-- testthat.R
#> -- Done ------------------------------------------------------------------------
```
