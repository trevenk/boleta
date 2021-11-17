library(shiny)
library(stringr)

description <- "Calcular boleta de honorarios. Te presentamos una caluladora de 
boleta de honorario sencilla para calcular valor líquido o bruto."

source("modules/calculadora_module.r")

format_chile_money <- function(x = 150000000000) {
  formatC(x, format = "d", digits = 0,  big.mark = ",")
}

clear <- function(x = "2,000") {
  return(
    str_remove_all(x, "[:punct:]")
  )
}
defy <- function() return(
  switch (as.character(year(today())),
          "2020" = 0.1075,
          "2021" = 0.1150,
          "2022" = 0.1225,
          "2023" = 0.1300
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