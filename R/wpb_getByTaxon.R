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
#' @return A dataframe
#' @export
#'
#' @examples wpb_getByTaxon(c("Crocus etruscus Parl.","Crocus il"))
wpb_getByTaxon <- function(taxon = c('Crocus etruscus Parl.')) {
  url <- 'http://bot.biologia.unipi.it/wpbold/php/wpb_getByTaxon.php'
  #taxon = 'Crocus etruscus Parl.'
  bodi <- rjson::toJSON(list(taxon=taxon))
  a <- httr::POST(url,body = bodi,encode = "json")
  b <- httr::content(a, as="text")
  c <- readr::read_csv(b)
  return(c)
}
