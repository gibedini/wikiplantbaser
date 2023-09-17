#' Occurrence points of Crocus etruscus Parl.
#'
#'
#' A dataset containing the list of occurrence points of
#' Crocus etruscus Parl. extracted from Wikiplantbase as of Nov 2022
#' @docType data
#' @name wpb_crocEtrOcc
#'
#'
#' @source \url{https://bot.biologia.unipi.it/wpb/italia}
#' @format
#' wpb_crocEtrOcc is a spatial dataframe with 118 observations and 10 variables:
#' \describe{
#'  \item{id}{unique identifier of the plant record in Wikiplantbase}
#'  \item{record_type}{single character, one of O=field observation,
#'  B=bibliographic record, H=herbarium specimen, P=published herbarium specimen}
#'  \item{occurrence_type}{one of presenza (present), dubbia (doubtful), esclusione (exclusion)}
#'  \item{esotic}{one of nativa (native), esotica (exotic), coltivata (cultivated)}
#'  \item{accuracy}{1=unknown, 2=adm.region, 3=50km, 4=10km, 5=1km}
#'  \item{lat_wgs84}{geographic latitude N, decimal degrees, epsg code 4326}
#'  \item{lon_wgs84}{geographic longitude E, decimal degrees, epsg code 4326}
#'  \item{taxon_name}{scientific name}
#'  \item{geometry}{geometry, set of points}
#' }
#'
#'
c("wpb_crocEtrOcc")
