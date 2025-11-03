test_that("grafico_temperatura_mensual funciona", {
  df <- tibble::tibble(
    id = "A",
    fecha = as.Date("2020-01-01"),
    temperatura_abrigo_150cm = 10
  )

  g <- grafico_temperatura_mensual(df)
  expect_s3_class(g, "ggplot")
})
