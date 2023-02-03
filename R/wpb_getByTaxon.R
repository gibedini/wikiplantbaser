#' Easy access to Wikiplantbase
#'
#' Get georeferenced records for taxa of the Italian vascular flora
#' passed as character vector. It is not meant for massive downloads:
#' you should be able to obtain several thousands records in seconds,
#' but for tens or hundreds of thousands of records please contact
#' Wikiplantbase coordinators.
#' @param taxon A vector of valid scientific names of vascular plant
#' according to the online Checklist of the Ittalian flora
#' (https://dryades.units.it/floritaly). Partial names (e.g. "Crocus il")
#' will be retrieved as all names starting with the partial value.
#'
#' @param gc_prec A number, matching the desired number of decimals in
#' the geographic coordinates.This parameter is used by helper functions
#' to reduce possible bias caused by overlapping records of the same taxon.
#'
#' @return A spatial dataframe
#' @export
#'
#' @examples wpb_getByTaxon(c("Crocus etruscus Parl.","Crocus il"))
wpb_getByTaxon <- function(taxon = c('Crocus etruscus Parl.'),gc_prec = 2) {
  if("" %in% taxon) taxon <- c('Crocus etruscus Parl.')
  url <- 'http://bot.biologia.unipi.it/wpbold/php/wpb_getByTaxon.php'
  bodi <- rjson::toJSON(list(taxon=taxon))
  r <- wpb_postRequest(url = url, body = bodi, gc_prec = gc_prec)
  return(r)
}
