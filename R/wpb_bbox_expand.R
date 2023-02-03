### wpb_bbox_expand
wpb_bbox_expand <- function(bb,ex=10) {
  if(ex > 50) ex=10
  xext <- bb[3] - bb[1]
  yext <- bb[4] - bb[2]
  dx <- xext*ex/100
  dy <- yext*ex/100
  bb[1] <- bb[1] - dx
  bb[2] <- bb[2] - dy
  bb[3] <- bb[3] + dx
  bb[4] <- bb[4] + dy
  return(bb)
}
