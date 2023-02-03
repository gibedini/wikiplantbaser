#' Thin out occurrence tibble
#'
#' This function is useful when you are interested in the analysis of biodiversity patterns
#' of vascular plants through a density scan to identify clusters in the spatial pattern
#' and the occurrence tibble shows an uneven frequency of occurrences for different taxa,
#' i.e. some taxa are oversampled, others undersampled. Heterogeneous taxon sampling might
#' lead to clusters in areas where a single species is oversampled, while undersampled taxa
#' might be overlooked.
#'
#' The idea is to remove overlapping records of the same taxon. The scope of overlapping is
#' defined by how coordinates values are rounded, which in turn reflect the extent to which
#' you consider two close points to overlap. With 11 decimals, points are mapped to micron-
#' scales, with no purpose because a) the measurement accuracy is six or seven orders of
#' magnitude higher, and b) the organism size itself may be four or five orders of magnitude
#' higher.
#'
#' On the other hand, a single decimal causes the coordinates to span 11.1 km in the temperate
#' belt, which might lead to too coarse an analysis, where you might miss dense cluster of
#' several co-occurring species that become apparent at a finer scale.
#'
#' With coordinate rounding, occurrences of the same species set at given distance from one
#' another are treated as a single record of that species.
#'
#' @param wpb_occurrences the occurrence tibble of wbp_occurrences class to be thinned out
#' (i.e. to be turned into a tibble with less rows)
#' @param coord_decimals the number of decimals of the geographic coordinates in the tibble.
#'
#' @return a tibble as the passed parameter, with less rows but two more columns with the
#'         values of the rounded coordinates (rlat = latitude and rlon = longitude). As it
#'         operates on tibbles, the function can be part of a pipe
#' @export
#'
#' @examples
#' w <- wpb_getByTaxon(taxon=c("Globularia"))
#' y <- wpb_thinner(w,2)
#'
#'
wpb_thinner <- function(wpb_occurrences,coord_decimals) {
  df <- dplyr::mutate(wpb_occurrences,rlat = round(lat_wgs84,coord_decimals),
              rlon = round(lon_wgs84,coord_decimals))
  dg <- dplyr::distinct(df,taxon_name,rlat,rlon, .keep_all=TRUE)
  return(dg)
}
