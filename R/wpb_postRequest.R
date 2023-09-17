#' Send a PST request to Wikiplantbase API
#'
#' This function is not to be exposed to users; it is used by
#' wpb_getByXxxxx functions to retrieve data from Wikiplantbase
#'
#' @param url the URL to send the request to
#' @param body the data, as list(taxon=your_taxon_list) in JSON format
#' @param gc_prec the precision of geographic coordinates (number of decimals of lat/lon values)
#'
#' @return a spatial dataframe
#' @export
#'
#' @examples
#' url <- "http://bot.biologia.unipi.it/wpbold/php/wpb_getByTaxon.php"
#' body <- rjson::toJSON(list(taxon=c("Crocus etruscus")))
#' gc_prec <- 2
#' w <- wpb_postRequest(url = url, body = body, gc_prec = gc_prec)
wpb_postRequest <- function(url, body, gc_prec) {
  a <- httr::POST(url = url,body = body,encode = "json")
  b <- httr::content(a, as="text")
  c <- readr::read_csv(b,col_types = "icccicddc")
  d <- wpb_thinner(c,gc_prec)
  e <- sf::st_as_sf(d,coords = c("rlon","rlat"),crs = point_crs())
  f <- sf::st_transform(e, crs = base_crs())
  return(f)
}
