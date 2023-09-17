#' Map of Italy
#'
#'
#' A dataset containing the administrative boundaries of Italy
#' sourced from ISTAT
#' @docType data
#' @name wpb_italyBaseMap
#'
#'
#' @source \url{https://www.istat.it}
#' @format
#' wpb_italyBaseMap is a spatial dataframe of the administrative boundaries of Italy with 20 observations and 6 variables:
#' \describe{
#'  \item{COD_RIP}{geographic areas, integer, 1=North-West,2=North-East,3=Center, 4=South, 5=Islands}
#'  \item{COD_REG}{unique identifier for regions, integer}
#'  \item{DEN_REG}{name of regions, character}
#'  \item{SHAPE_AREA}{area of regions in square meters, integer}
#'  \item{SHAPE_LEN}{length of region perimeter, meters, decimal number}
#'  \item{geometry}{geometry, multipolygons}
#' }
#'
#'
c("wpb_italyBaseMap")
