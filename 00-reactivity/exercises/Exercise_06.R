library(shiny)

ui <- fluidPage(
  h1("Exercise 6"),
  selectInput("dataset", "Dataset", choices = c("pressure", "cars", "iris")),
  numericInput("nrows", "Number of rows", 10),
  actionButton("save", "Save sample")
)

server <- function(input, output, session) {

  df <- reactive({get(input$dataset)})

  # Assignment: Modify the server function so that, when the "Save sample" button
  # is pressed, the chosen dataset with the nrows rows gets written to a csv
  # called "sample.csv".
  #
  # Bonus: Add a textInput to allow the user to specify the name of the file.

}
