library(shiny)

randUI <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = "Generate"),
    verbatimTextOutput(ns("out"))
  )
}

randServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      output$out <- renderText({
        
        input$button
        
        runif(1)
        
      })
      
    }
  )
}


ui <- fluidPage(
  randUI("randomNumber")
)

server <- function(input, output, session) {
  randServer("randomNumber")
}

shinyApp(ui, server)