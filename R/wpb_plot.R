#' Plot occurrence points
#'
#' Plots occurrence points on a map of Italy
#'
#' @param xx a spatial dataframe such as that produced by \code{wpb_getByTaxon}
#' @param zoomLev one of "Italy", "occpts", zooming to Italy or occurrence points
#' @param occur_type one of "presenza", "dubbia","esclusione"
#' @param ... other parameters passed on
#'
#' @return a ggplot2 object
#' @export
#'
#' @examples
#' ce_plot <- wpb_plot(wpb_crocEtrOcc)
wpb_plot <- function(xx, zoomLev = "Italy", occur_type = c("presenza","dubbia","esclusione"), ...) {
  yy <- NULL
  for(i in 1:length(occur_type)) {
    yy <- dplyr::bind_rows(yy,dplyr::filter(xx,occurrence_type == occur_type[i]))
  }
  xx <- yy
  ggplot2::theme_set(ggplot2::theme_bw())
  u_nrep <- unique(xx$taxon_name)
  wpb_nomi <- paste(u_nrep,sep='', collapse = ', ')
  wpb_numb <- length(u_nrep)
  wpb_myBaseMap <- wikiplantbaser::wpb_italyBaseMap

  if(zoomLev=="occpts") {
    wpb_pts_bbox <- wpb_bbox_expand(sf::st_bbox(xx),20)

    wpb_myBaseMap <- sf::st_crop(wikiplantbaser::wpb_italyBaseMap,y=wpb_pts_bbox)
    message(paste("Bounding box:"))
    print(wpb_pts_bbox)
  }

  g <- ggplot2::ggplot() +
    ggplot2::geom_sf(data = wpb_myBaseMap) +
    ggplot2::geom_point(data = xx, ggplot2::aes(x = sf::st_coordinates(geometry)[,1],
                              y = sf::st_coordinates(geometry)[,2],
                              fill = stringr::str_wrap(factor(taxon_name),35),
                              shape = factor(occurrence_type)),
               size = 2, col = "black") +
    ggplot2::labs(x="Longitude", y="Latitude") +
    #size = 0.7, fill = factor(xx$nome_reperto)) +
    viridis::scale_fill_viridis(discrete = TRUE, option = "plasma") +
    ggplot2::scale_shape_manual(values = c(21,23,24)) +
    ggplot2::theme(legend.position = c(1,1),
          legend.justification = c(1,1),
          legend.box.just = "right",
          legend.text = ggplot2::element_text(size=9),
          legend.background = ggplot2::element_rect(color = "darkgrey", linetype = "solid"),
          legend.key.height=grid::unit(0.7, "cm"),
          legend.title = ggplot2::element_blank()) +
    #guides(fill = guide_legend(override.aes = list(size=3))) +
    ggplot2::guides(fill = ggplot2::guide_legend(override.aes=list(shape=21,size=3),order=1),shape = ggplot2::guide_legend(order=2)) +
    #scale_fill_manual(c("#000000","#FFFFFF","#88FF88","#55FFFF","#888888","#FF8888")) +
    ggplot2::ggtitle("Italian distribution map") +
    ggspatial::annotation_scale(location = "bl", width_hint = 0.5) +
    ggspatial::annotation_north_arrow(location = "bl", which_north = "true",
                           pad_x = grid::unit(1, "cm"), pad_y = grid::unit(1, "cm"),
                           style = ggspatial::north_arrow_fancy_orienteering())

    return(g)
}
