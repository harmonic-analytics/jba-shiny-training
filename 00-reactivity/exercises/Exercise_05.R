library(shiny)

ui <- fluidPage(
  h1("Exercise 5"),
  selectInput("dataset", "Dataset", choices = c("pressure", "cars", "iris")),
  selectInput("col", "Columns", choices = character(0)),
  verbatimTextOutput("summary")
)

server <- function(input, output, session) {

  df <- reactive({get(input$dataset)})

  # Assignment: Modify the server script so that the column select input
  # gets updated with the choice of column names when the dataset is selected.

  output$summary <- renderPrint({
    # Warning: This currently doesn't work!
    summary(df()[, input$col])
  })
}
