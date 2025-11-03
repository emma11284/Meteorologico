#' tabla resumen de temperatura
#'
#' devuelve una tabla de resumen de temperatura_abrigo_150cm para una o más estaciones.
#'
#' @param estaciones dataframe con las columnas "id" y "temperatura_abrigo_150cm"
#'
#' @returns un tibble con promedio y desvío estándar por estación
#' @examples
#' estaciones <- tibble::tibble(
#'   id  = c("A","A","B","B"),
#'   fecha = as.Date(c("2020-01-01","2020-02-01","2020-01-01","2020-02-01")),
#'   temperatura_abrigo_150cm = c(10, 12, 15, 11)
#' )
#' tabla_resumen_temperatura(estaciones)
#'
#' @export
tabla_resumen_temperatura <- function(estaciones) {

  resumen <- estaciones |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio_abrigo = mean(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      desvio          = sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}
