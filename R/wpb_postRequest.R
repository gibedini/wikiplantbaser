#' Send a PST request to Wikiplantbase API
#'
#' This function is not to be exposed to users; it is used by
#' wpb_getByXxxxx functions to retrieve data from Wikiplantbase
#'
#' @param url the URL to send the request to
#' @param body the data, as list(taxon=your_taxon_list) in JSON format
#' @param gc_prec the precision of geographic coordinates (number of decimals of lat/lon values)
#'
#' @return a spatial dataframe with 10 columns:
#'
#'   \item{id}{the record id (primary key) in Wikiplantbase}
#'
#'   \item{record_type}{a single character among
#'   'O' for unpublished field observation;
#'   'B' for bibliographic record;
#'   'H' for voucher-based record;
#'   'P' for published herbarium specimen.}
#'
#'   \item{occurrence_type}{three-state variable, it can be one of
#'   'presenza' for confirmed presence, 'dubbia' for doubtful record,
#'   'esclusione' for a confirmed absence}
#'
#'   \item{esotic}{either 'nativa' for natively occurring species or
#'   one among 'esotica' (alien), 'esotica casuale' (casual alien),
#'   'esotica naturalizzata' (naturalised alien), 'esotica invasiva'
#'   (invasive alien), 'coltivata' (cultivated)}
#'
#'   \item{occurrence year}{year when the species was reported}
#'
#'   \item{lat_wgs84}{latitude in decimal degrees and epsg:4326}
#'
#'   \item{lon_wgs84}{longitude in decimal degrees and espg: 4326}
#'
#'   \item{taxon_name}{the accepted taxon name according to the
#'   Checklist of the Italian Vascular Flora}
#'
#'   \item{geometry}{the occurrence point as a spatial object}
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
