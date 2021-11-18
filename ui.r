ui <- fluidPage(
  #theme = "custom.css",
  title = "Calcular boleta de honorarios",
  lang = "es", 
  tags$head(
    includeHTML(("google-analytics-amp.html")),
    #tags$meta(charset="UTF-8"),
    tags$meta(name="description", content=description),
    #tags$meta(name="keywords", content="..."),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1.0")
  ),
  fluidRow(
    column(width = 7, h1("Calcular boleta de honorarios"),
           br(),
           br(),
           tags$div(
             class = "navegacion", 
             tags$li(tags$a(href = "#calcular-boleta-de-honorarios-2021", "Calcular boleta de honorarios 2021 con 11.5%")),
             tags$li(tags$a(href = "#calcular-boleta-de-honorarios-14.5-porciento", "Calcular boleta de honorarios 2021 con 14,5%")),
             tags$li(tags$a(href = "#calcular-boleta-de-honorarios-2020", "Calcular boleta de honorarios 2020 con 10,75%")),
             tags$li(tags$a(href = "#calcular-boleta-de-honorarios-2022", "Calcular boleta de honorarios 2022 con 12,25%")),
             tags$li(tags$a(href = "#cuando-calcular-usando-el-14.5", "¿Cuándo tengo que calcular usando el 14.5%?")),
             tags$li(tags$a(href = "#boleta-de-honorarios-sii", "Boleta de honorarios SII")),
           ), br()),
    column(width = 5, tags$div(class = "big-calc", CalculadoraCompletaUI(id = "calculadora_completa_out", preloaded)), br())
  ),
  tags$p("Para calcular la boleta de honorarios debes partir del valor líquido de 
         tus honorarios que es lo que realmente tu recibes por la prestación de 
         servicios. Sin embargo, para emitir la boleta de honorarios electrónica 
         en el sitio del SII debes ingresar el valor bruto de tus honorarios que 
         es la suma del valor líquido más la retención."),
  tags$p("Por eso debes tener a mano una herramienta que te permita calcular la 
         retención y el valor bruto cuando conoces el valor líquido de tus honorarios. 
         Pero a veces también es útil calcular la retención y el valor líquido 
         cuando lo que conoces es el valor bruto de tus honorarios."),
  tags$p("Además, si recibiste un préstamo solidario por la Covid 19, entonces debes 
         calcular con el aumento del 3%, o sea, 14.5%. "),
  br(),
  
  h2(id = "calcular-boleta-de-honorarios-2021", "Calcular boleta de honorarios 2021 con 11.5%"),
  tags$p("Calcula tu boleta teniendo en cuenta solamente la retención de 11.5%."),
  fluidRow(
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_1", fijo = "l", retencion = 0.1150), br())),
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_2", fijo = "b", retencion = 0.1150), br()))
  ),
  br(),
  
  h2(id = "calcular-boleta-de-honorarios-14-porciento", "Calcular boleta de honorarios 2021 con 14,5%"),
  tags$p("Calcula tu boleta teniendo en cuenta la retención de 11.5% más el abono del 3% del crédito solidario."),
  fluidRow(
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_3", fijo = "l", retencion = 0.1450))),
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_4", fijo = "b", retencion = 0.1450)))
  ),
  br(),
  
  h2(id = "calcular-boleta-de-honorarios-2020", "Calcular boleta de honorarios 2020 con 10,75%"),
  tags$p("Si quieres calcular tu boleta con el impuesto del 2020, ya sea para comparar o para realizar algún análisis usa esta otra calculadora."),
  fluidRow(
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_5", fijo = "l", retencion = 0.1075))),
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_6", fijo = "b", retencion = 0.1075)))
  ),
  br(),
  
  h2(id = "calcular-boleta-de-honorarios-2022", "Calcular boleta de honorarios 2022 con 12,25%"),
  tags$p("Si quieres calcular tu boleta con el impuesto del 2022, ya sea para comparar o para realizar algún análisis usa esta otra calculadora."),
  fluidRow(
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_7", fijo = "l", retencion = 0.1225))),
    column(width = 6, tags$div(class = "calculadora", CalculadoraUI(id = "calculadra_out_8", fijo = "b", retencion = 0.1225)))
  ),
  br(),
  
  h2(id = "cuando-calcular-usando-el-14.5", "¿Cuándo tengo que calcular usando el 14.5%?"),
  tags$p("El SII informa que la Ley 21.242 estableció un aumento del 3% en la retención vigente de las Boletas de Honorarios Electrónicas que sean 
         emitidas a partir del 01-09-2021. Dicho aumento se aplicará automáticamente y se destinará a apoyar el reintegro del Préstamo Solidario 
         del Estado que solicitó el contribuyente en 2020. Entonces, solo tienes que calcular usando el 14.5% en caso de haber recibido el préstamo 
         solidario."),
  h2("Boleta de honorarios SII", id = "boleta-de-honorarios-sii"),  
  tags$p("  La boleta de honorarios SII es el Documento Tributario Electrónico que emiten los contribuyentes registrados en la segunda categoría 
  cada vez que prestan un servicio remunerado a personas o empresas."),
  tags$p("Para emitir una boleta de honorarios en el servicio en línea del SII el contribuyente ingresa sus datos, los datos del cliente, la glosa 
         o el nombre del servicio y el valor bruto de los honorarios. El SII calcula el impuesto como un porcentaje del valor bruto, resta ese 
         porcentaje y calcula el valor líquido de los honorarios. La boleta se puede imprimir o enviar por correo electrónico.")
)