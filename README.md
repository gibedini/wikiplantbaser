
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
#> # A tibble: 1,760 × 9
#>        id record_type occurrenc…¹ esotic accur…² occur…³ lat_w…⁴ lon_w…⁵ taxon…⁶
#>     <int> <chr>       <chr>       <chr>    <int> <chr>     <dbl>   <dbl> <chr>  
#>  1 289269 O           presenza    nativa       4 2005       44.5    9.01 Crocus…
#>  2 289268 O           presenza    nativa       4 2010       44.4    8.73 Crocus…
#>  3 402415 O           presenza    nativa       5 2019       45.8   10.9  Crocus…
#>  4 402424 O           presenza    nativa       5 2013       46.3   12.9  Crocus…
#>  5 784903 P           presenza    nativa       4 g 09       44.3    7.96 Crocus…
#>  6 402366 O           presenza    nativa       5 2015       45.8   10.9  Crocus…
#>  7 289267 O           presenza    nativa       4 2005       44.5    9.03 Crocus…
#>  8 400177 H           presenza    nativa       4 1907       44.5    9.49 Crocus…
#>  9 402376 O           presenza    nativa       5 2007       44.4    6.90 Crocus…
#> 10 289266 O           presenza    nativa       4 2010       44.4    9.21 Crocus…
#> # … with 1,750 more rows, and abbreviated variable names ¹​occurrence_type,
#> #   ²​accuracy, ³​occurrence_year, ⁴​lat_wgs84, ⁵​lon_wgs84, ⁶​taxon_name
## basic example code
```

The above line will return a dataframe with nine columns and a number of
rows matching the number of records extracted from the database. A call
with a partial name, like this:

``` r
library(wikiplantbaser)
wpb_getByTaxon(c("Crocus"))
#> # A tibble: 1,760 × 9
#>        id record_type occurrenc…¹ esotic accur…² occur…³ lat_w…⁴ lon_w…⁵ taxon…⁶
#>     <int> <chr>       <chr>       <chr>    <int> <chr>     <dbl>   <dbl> <chr>  
#>  1 289267 O           presenza    nativa       4 2005       44.5    9.03 Crocus…
#>  2 289271 O           presenza    nativa       4 2005       44.5    9.44 Crocus…
#>  3 402376 O           presenza    nativa       5 2007       44.4    6.90 Crocus…
#>  4 414636 B           presenza    nativa       4 0          44.3    9.85 Crocus…
#>  5 784903 P           presenza    nativa       4 g 09       44.3    7.96 Crocus…
#>  6 289266 O           presenza    nativa       4 2010       44.4    9.21 Crocus…
#>  7 289265 O           presenza    nativa       4 2004       44.5    9.02 Crocus…
#>  8 289264 O           presenza    nativa       4 2011       44.4    9.03 Crocus…
#>  9 402424 O           presenza    nativa       5 2013       46.3   12.9  Crocus…
#> 10 502552 B           presenza    nativa       4 1985       44.2    7.93 Crocus…
#> # … with 1,750 more rows, and abbreviated variable names ¹​occurrence_type,
#> #   ²​accuracy, ³​occurrence_year, ⁴​lat_wgs84, ⁵​lon_wgs84, ⁶​taxon_name
```

will return all occurrences of all species of Crocus.

## Dataframe columns

1.  ID, an integer, primary key of the record in the database.

2.  record\_type, one character: B = bibliographic record; O =
    unpublished field observation; H = unpublished herbarium specimen; P
    = published herbarium specimen.

3.  occurrence\_type, character: presenza = occurrence; dubbia =
    doubtful occurrence; esclusione = confirmed absence,

4.  esotic, character: nativa = native; esotica casuale = casual alien;
    esotica avventizia = adventitious alien; esotica naturalizzata =
    naturalised alien; coltivata = cultivated.

5.  accuracy, integer: 5 = \< 1km; 4 = \< 10km; 3 = \< 50km; 2 = within
    an administrative region; 1 = unknown.

6.  occurrence\_year, character: year of occurrence (might be a range in
    the form y1-y2).

7.  lat\_wgs84, double: latitude N in decimal degrees, datum 4326 (WGS84
    ellipsoid)

8.  lon\_wgs84, double: longitude E in decimal degrees, datum 4326
    (WGS84 ellipsoid)

9.  taxon\_name, character: a scientific name included in the Checklist
    of the Italian flora (<https://dryades.units.it/floritaly>)
