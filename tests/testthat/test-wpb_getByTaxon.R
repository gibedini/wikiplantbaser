test_that("result is a dataframe", {
  expect_s3_class(wpb_getByTaxon(c("Crocus etruscus","Crocus il")), "data.frame")
  expect_s3_class(wpb_getByTaxon(c("")), "data.frame")
})
