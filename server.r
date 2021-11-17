shinyServer( function ( input, output, session ) {
  fijo <- rep(c("l", "b"), 4)
  retencion <- c(rep(11.50, 2), rep(14.50, 2), rep(10.75, 2), rep(12.25, 2))
  
  lapply(1:8, function(i){
    CalculadoraServer(paste0("calculadra_out_", i), fijo = fijo[i], retencion = retencion[i])
  })
})