library(shiny)

summary_UI <- function(id) {
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("summary"))
  )
}

summary_server <- function(id, dataset) {
  moduleServer(
    id,
    function(input, output, session) {
      output$summary <- renderText(summary(dataset))
    }
  )
}

ui <- fluidPage(
  
  fluidRow(column(4,summary_UI("iris"))),
  fluidRow(column(4,summary_UI("cars"))),
  fluidRow(column(4,summary_UI("pressure")))
)


server <- function(input, output, session) {
  summary_server("iris",iris)
  summary_server("cars",cars)
  summary_server("pressure",pressure)
}

shinyApp(ui, server)