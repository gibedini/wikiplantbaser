test_that("result is a dataframe", {
  expect_s3_class(wpb_getByTaxon(c("Crocus etruscus","Crocus il")), "data.frame")
  expect_s3_class(wpb_getByTaxon(c("")), "data.frame")
  expect_s3_class(wpb_getByTaxon(c("Crocus")),"data.frame")
})

test_that("fields are the right type", {
  expect_type(wpb_getByTaxon("Athamanta cortiana")$record_type,"character")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$occurrence_type,"character")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$esotic,"character")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$occurrence_year,"character")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$taxon_name,"character")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$accuracy,"integer")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$lat_wgs84,"double")
  expect_type(wpb_getByTaxon("Athamanta cortiana")$lon_wgs84,"double")

})
