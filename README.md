
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wikiplantbaser

<!-- badges: start -->

<!-- badges: end -->

Wikiplantbaser provides an easy access to the floristic records stored
in the Wikiplantbase \#Italia online database
(<http://bot.biologia.unipi.it/wpb/italia>). As of November 2022, the
database stores around 700k georeferenced occurrence points for
approximately 4k plant names. Wikiplantbaser is not meant as a tool for
a massive download of hundreds of thousands of records. Instead, it is
geared to facilitate the download of subsets of data, especially at
genus or section level, and the production of publication-grade maps.

Its main workhorse is wpb\_getByTaxon(), that accepts a vector of plant
names as parameter and returns all occurrence points for those names.
Partial names are accepted: for instance, the name “Crocus” will return
all occurrences of all species of Crocus stored in the database.

## Installation

You can install the development version of wikiplantbaser from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gibedini/wikiplantbaser")
```

## Example

This is a basic example which shows you how to obtain all occurrence
points for Crocus etruscus Parl.:

``` r
library(wikiplantbaser)
wpb_getByTaxon(c("Crocus etruscus Parl."))
#> Rows: 240 Columns: 8
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (4): tipo_reperto, tiposegn, esotic, nome_reperto
#> dbl (4): accuratezza, annoreperto, lat_wgs84, lon_wgs84
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 240 × 8
#>    tipo_reperto tiposegn esotic accuratezza annoreperto lat_wg…¹ lon_w…² nome_…³
#>    <chr>        <chr>    <chr>        <dbl>       <dbl>    <dbl>   <dbl> <chr>  
#>  1 B            presenza nativa           3        2010     42.8    11.5 Crocus…
#>  2 B            presenza nativa           3        2010     42.9    11.0 Crocus…
#>  3 B            presenza nativa           4        2010     42.9    11.6 Crocus…
#>  4 O            presenza nativa           5        2021     42.8    10.8 Crocus…
#>  5 O            presenza nativa           5        2021     43.1    10.6 Crocus…
#>  6 B            presenza nativa           5        2019     43.2    11.3 Crocus…
#>  7 O            presenza nativa           5        2021     43.2    10.9 Crocus…
#>  8 O            presenza nativa           5        2021     43.2    10.9 Crocus…
#>  9 O            presenza nativa           5        2021     43.1    10.9 Crocus…
#> 10 O            presenza nativa           4        2022     43.1    10.6 Crocus…
#> # … with 230 more rows, and abbreviated variable names ¹​lat_wgs84, ²​lon_wgs84,
#> #   ³​nome_reperto
## basic example code
```

The above line will return a dataframe with eight columns and a number
of rows matching the number of records extracted from the database. A
call with a partial name, like this:

``` r
library(wikiplantbaser)
wpb_getByTaxon(c("Crocus"))
#> Rows: 0 Columns: 1
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): Error in converting to csv
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 0 × 1
#> # … with 1 variable: Error in converting to csv <chr>
```

will return all occurrences of all species of Crocus.
