test_that("tabla_resumen_temperatura funciona", {
  df <- tibble::tibble(id = "A", temperatura_abrigo_150cm = 10)

  res <- tabla_resumen_temperatura(df)

  expect_s3_class(res, "data.frame")
  expect_true("promedio_abrigo" %in% names(res))
})
