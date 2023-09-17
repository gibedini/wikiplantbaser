#' CRS values
#'
#'
#' \code{base_crs()} returns the coordinate reference system (CRS)
#' to be used within Wikiplantbaser, i.e. WGS84 / UTM zone 32
#' (epsg: 32632), which covers the Italian territory.
#'
#' \code{point_crs()} returns the CRS of point occurrences as
#' extracted from wikiplantbase.
#'
#' @return a number matching the EPSG code of the selected CRS
#' @export
#'
#' @examples
#' base_crs <- base_crs()
base_crs <- function() {
  crs <- 32632
  return(crs)
}

#' CRS values
#'
#' @return a number matching the EPSG code of the selected CRS
#' @export
#'
#' @examples
#' point_crs <- point_crs()
point_crs <- function() {
  crs = 4326
  return(crs)
}
