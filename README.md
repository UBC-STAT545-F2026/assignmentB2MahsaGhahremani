
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2MahsaGhahremani

This R package provides a function to count missing values in a dataset
by group. It helps users identify which columns have missing values and
compare missing data across different groups.

## Installation

You can install this package from GitHub using:

``` r
install.packages("devtools")
devtools::install_github(
  "UBC-STAT545-F2026/assignmentB2MahsaGhahremani",
  ref = "0.1.0"
)
```

## Example

The package includes the function `count_all_missing_by_group()`. It
counts missing values in each column for each group.

For example, we can use the built-in `airquality` dataset to count
missing values by month.

``` r
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

The output shows the number of missing values in each column for each
month.
