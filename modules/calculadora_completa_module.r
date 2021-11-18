CalculadoraCompletaUI <- function(id, preloaded) {
  ns <- NS(id)
  fluidPage(
    tags$div(
      class = "my_form", 
      column(width = 12, "Valor ", textOutput(ns("tentrada"), inline = T)), 
      column(width = 12, tags$span(class = "entrada", textInput(ns("entrada"), "", width = "100%", placeholder = "$"))),
      column(width = 12, "Retención (", textOutput(ns("trecepcion"), inline = T), "%)"),
      column(width = 12, align = "right", tags$div(class = "outer", textOutput(ns("retencion")))),
      column(width = 12, "Valor ", textOutput(ns("tsalida"), inline = T)),
      column(width = 12, align = "right", tags$div(class = "outer", textOutput(ns("salida")))),
      column(
        width = 12, tags$div(
          class = "param",
          radioButtons(ns("radio"), label = "", choices = list( "Insertar valor líquido" = "l", "Insertar valor bruto" = "b"), selected = preloaded$valor, inline = F, width = "100%"), 
          selectInput(ns("retencion"), label = "", choices = preloaded$choices, selected = as.character(preloaded$retencion), width = "100%"),
          checkboxInput(ns("ayuda"), label = "Recibí la ayuda solidaria (+ 3%)", value = preloaded$ayuda, width = "100%")
        )
      )
    )
  )
}

CalculadoraCompletaServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      fijo <- reactive(req(input$radio))
      retencion <- reactive(as.numeric(req(input$retencion)))
      output$salida <- renderText({"$0,000"})
      output$retencion <- renderText({"$0,000"})
      observeEvent(req(input$entrada), {
        updateTextInput(session = session, inputId = "entrada", value = as.character(format_chile_money(as.numeric(clear(input$entrada)))))
        if((str_length(clear(input$entrada)) >= 1) & (str_length(clear(input$entrada)) < 10)) {
          
          if(fijo() == "l") {
            val <- desde_liquido(l = as.numeric(clear(input$entrada)), tr = (retencion() + (3 * as.numeric(input$ayuda))))
            output$salida <- renderText({as.character(format_chile_money(val$bruto))})
            output$retencion <- renderText({as.character(format_chile_money(val$retencion))})
          } else {
            val <- desde_bruto(b = as.numeric(clear(input$entrada)), tr = (retencion() + (3 * as.numeric(input$ayuda))))
            output$salida <- renderText({as.character(format_chile_money(val$liquido))})
            output$retencion <- renderText({as.character(format_chile_money(val$retencion))})
          }
        } else {
          if(str_length(clear(input$entrada)) >= 10) {
            entrada <- substr(clear(input$entrada), start = 1, stop = 9)
            updateTextInput(session = session, inputId = "entrada", value = format_chile_money(clear(entrada)))
            showNotification("No se admiten valores de más de 10 cifras", type = "error")
          }
        }
      })
      observeEvent(req(input$radio), {
        output$tentrada <- renderText({ifelse(input$radio == "l", "líquido", "bruto")})
        output$tsalida <- renderText({ifelse(input$radio != "l", "líquido", "bruto")})
        updateTextInput(session = session, inputId = "entrada", value = "")
        output$salida <- renderText({""})
        output$retencion <- renderText({""})
        
      })
      observeEvent(req(input$retencion), {
        output$trecepcion <- renderText({as.character(input$retencion)})
        updateTextInput(session = session, inputId = "entrada", value = "")
        output$salida <- renderText({""})
        output$retencion <- renderText({""})
      })
      observeEvent(input$ayuda, {
        output$trecepcion <- renderText({as.character(as.numeric(input$retencion) + (3 * as.numeric(input$ayuda)))})
        updateTextInput(session = session, inputId = "entrada", value = "")
        output$salida <- renderText({""})
        output$retencion <- renderText({""})
      })
    }
  )
}