test_that("leer_estacion funciona", {
  ruta <- tempfile(fileext = ".csv")
  writeLines("fecha,temperatura_abrigo_150cm\n2020-01-01,10", ruta)
  expect_silent(leer_estacion("TEST", ruta))
})
