library(shiny)
library(stringr)


description <- "Calcular boleta de honorarios. Te presentamos una caluladora de 
boleta de honorario sencilla para calcular valor líquido o bruto."

source("modules/calculadora_module.r")
source("modules/calculadora_completa_module.r")

format_chile_money <- function(x = 150000000000) {
  formatC(x, format = "d", digits = 0,  big.mark = ",")
}

clear <- function(x = "2,000") {
  return(
    str_remove_all(x, "[:punct:]")
  )
}
defy <- function(year) return(
  switch (year,
          "2020" = 10.75,
          "2021" = 11.50,
          "2022" = 12.25,
          "2023" = 13.00
  )
)

desde_liquido <- function(l, tr) {
  b <- (l * 100)  / (100 - tr)
  r <- b - l
  return(list(retencion = r, bruto = b))
}

desde_bruto <- function(b, tr) {
  r <- b * (tr / 100)
  l <- b - r
  return(list(retencion = r, liquido = ceiling(l)))
}

preloaded <- list(
  retencion = defy(substr(as.character(Sys.Date()), 1, 4)),
  ayuda = F,
  valor = "l",
  choices = list(
    "Año 2020 (10.75%)" = 10.75,
    "Año 2021 (11.75%)" = 11.50,
    "Año 2022 (12.25%)" = 12.25,
    "Año 2023 (13.00%)" = 13.00
  )
)
