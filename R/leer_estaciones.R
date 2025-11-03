#' lee datos de estaciones
#'
#' descarga y lee los datos de estaciones
#'
#' @param id_estacion código de la estación
#' @param ruta ruta local donde guardar/leer el CSV
#'
#' @returns un dataframe con los datos de la estación
#' @examples
#' leer_estacion("NH0437", tempfile(fileext = ".csv"))
#'
#' @export
leer_estacion <- function(id_estacion, ruta) {

  dir.create(dirname(ruta), showWarnings = FALSE, recursive = TRUE)

  if (!file.exists(ruta)) {
    url <- paste0(
      "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
      id_estacion, ".csv"
    )
    utils::download.file(url, ruta, mode = "wb")
  }

  datos <- readr::read_csv(ruta, show_col_types = FALSE)
  if (!"id" %in% names(datos)) datos$id <- id_estacion
  datos
}
