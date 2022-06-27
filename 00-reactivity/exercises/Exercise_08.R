library(shiny)

ui <- fluidPage(
  actionButton("rnorm", "Normal"),
  actionButton("runif", "Uniform"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  # Assignment: Write a server function that draws a histogram of 100 random
  # numbers from a normal distribution when normal is clicked, and 100 random
  # uniform distributions when uniform is clicked.
}

shinyApp(ui, server)
