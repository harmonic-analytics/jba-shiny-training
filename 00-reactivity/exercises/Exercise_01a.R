library(shiny)

ui <- fluidPage(
  h1("Exercise 1a"),
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

# Assignment: Given the above UI, find and fix the simple errors in each of
# these server functions. Try to spot the problem by reading the code first
# before running it.

server1 <- function(input, output, server) {
  input$greeting <- renderText(paste0("Hello ", name))
}

# shinyApp(ui, server1)

server2 <- function(input, output, server) {
  greeting <- paste0("Hello ", input$name)
  output$greeting <- renderText(greeting)
}

# shinyApp(ui, server2)

server3 <- function(input, output, server) {
  output$greting <- paste0("Hello", input$name)
}

# shinyApp(ui, server3)
