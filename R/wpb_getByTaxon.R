wpb_getByTaxon <- function(taxon = c('Crocus etruscus Parl.')) {
  url <- 'http://bot.biologia.unipi.it/wpbold/php/wpb_getByTaxon.php'
  #taxon = 'Crocus etruscus Parl.'
  bodi <- rjson::toJSON(list(taxon=taxon))
  a <- httr::POST(url,body = bodi,encode = "json")
  b <- httr::content(a, as="text")
  c <- readr::read_csv(b)
  return(c)
}
