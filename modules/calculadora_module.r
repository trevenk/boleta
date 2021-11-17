CalculadoraUI <- function(id = "calculadra_out", fijo = "l", retencion = 0.1075) {
  ns <- NS(id)
  tags$span(
    class = "my_form",
    h3("Conociendo el valor ", ifelse(fijo == "l", "líquido", "bruto")),
    textInput(ns("entrada"), paste0("Valor ", ifelse(fijo == "l", "líquido", "bruto")), width = "100%"),
    textInput(ns("retencion"), paste0("Retención (", as.character(retencion * 100), "%)"), width = "100%"),
    textInput(ns("salida"), paste0("Valor ", ifelse(fijo != "l", "líquido", "bruto")), width = "100%")
  )
}

CalculadoraServer <- function(id, fijo = "l", retencion = 0.1075) {
  moduleServer(
    id,
    function(input, output, session) {
      observeEvent(req(input$entrada), {
        updateTextInput(session = session, inputId = "entrada", value = as.character(format_chile_money(as.numeric(clear(input$entrada)))))
        if((str_length(clear(input$entrada)) >= 1) & (str_length(clear(input$entrada)) < 10)) {
          
          if(fijo == "l") {
            val <- desde_liquido(l = as.numeric(clear(input$entrada)), tr = retencion)
            updateTextInput(session = session, inputId = "salida", value = as.character(format_chile_money(val$bruto)))
            updateTextInput(session = session, inputId = "retencion", value = as.character(format_chile_money(val$retencion)))
          } else {
            val <- desde_bruto(b = as.numeric(clear(input$entrada)), tr = retencion)
            updateTextInput(session = session, inputId = "salida", value = as.character(format_chile_money(val$liquido)))
            updateTextInput(session = session, inputId = "retencion", value = as.character(format_chile_money(val$retencion)))
          }
        } else {
          if(str_length(clear(input$entrada)) >= 10) {
            entrada <- substr(clear(input$entrada), start = 1, stop = 9)
            updateTextInput(session = session, inputId = "entrada", value = format_chile_money(clear(entrada)))
            showNotification("No se admiten valores de más de 10 cifras")
          }
        }
      })
      
    }
  )
}