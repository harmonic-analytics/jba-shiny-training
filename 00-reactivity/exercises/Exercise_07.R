library(shiny)

ui <- fluidPage(
  selectInput("dataset", "Dataset", c("pressure", "iris", "mtcars")),
  selectInput("column", "Column", character(0)),
  verbatimTextOutput("summary"),
  plotOutput("hist")
)

server <- function(input, output, session) {
  # Assignment: Currently, if there is no column chosen, errors get persisted
  # through to the UI. Try using req() or validate() & need() to hide the errors
  # or show better error messages to the user

  df <- reactive({
    get(input$dataset)
  })

  observe({
    updateSelectInput(session, "column", choices = c("Choose"="", colnames(df())))
  })

  coldata <- reactive({
    df()[[input$column]]
  })

  output$summary <- renderPrint({
    summary(coldata())
  })

  output$hist <- renderPlot({
    hist(coldata())
  })
}

shinyApp(ui, server)
