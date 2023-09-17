### wpb_bbox_expand
wpb_bbox_expand <- function(bb,ex=10) {
  if(ex > 50) ex=10
  xext <- bb[3] - bb[1]
  yext <- bb[4] - bb[2]
  dx <- xext*ex/100
  dy <- yext*ex/100
  bb[1] <- bb[1] - dx/2
  bb[2] <- bb[2] - dy/2
  bb[3] <- bb[3] + dx*4
  bb[4] <- bb[4] + dy/2
  return(bb)
}
