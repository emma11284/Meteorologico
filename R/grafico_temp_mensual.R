#' gráfico de la temperatura mensual
#'
#' grafica la temperatura mensual por estación
#'
#' @param estaciones dataframe con columnas "fecha", "temperatura_abrigo_150cm" y "id"
#' @param colores vector de colores para las series (opcional)
#' @param titulo título del gráfico. Por defecto "Temperatura"
#'
#' @returns un objeto ggplot
#' @examples
#' estaciones <- tibble::tibble(
#'   id  = c("A","A","B","B"),
#'   fecha = as.Date(c("2020-01-01","2020-02-01","2020-01-01","2020-02-01")),
#'   temperatura_abrigo_150cm = c(10, 12, 15, 11)
#' )
#' grafico_temperatura_mensual(estaciones)
#'
#' @export
grafico_temperatura_mensual <- function(estaciones, colores = c("darkgreen", "lightblue", "darkred","pink","purple"), titulo = "Temperatura Mensual"){

  promedio_temp <- estaciones |>
    dplyr::group_by(id,meses = lubridate::floor_date(lubridate::date(fecha), "month")) |>
    dplyr::summarise(promedio_temp_mensual = mean(temperatura_abrigo_150cm, na.rm = TRUE))

  ggplot2::ggplot(data = promedio_temp)+
    ggplot2::aes(y = promedio_temp_mensual, x = meses, color = id)+
    ggplot2::scale_color_manual(values = colores)+
    ggplot2::geom_line(linewidth = 0.7)+
    ggplot2::labs(title = titulo, x ="Tiempo", y ="Temperatura Promedio")
}
