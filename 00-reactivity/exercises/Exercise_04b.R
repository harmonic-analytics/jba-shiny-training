library(shiny)

# Assignment: Draw the reactive graph for this app.

ui <- fluidPage(
  h1("Exercise 4b"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Dataset", c("pressure", "cars", "iris")),
      numericInput("nrows", "Number of rows", 10)
    ),
    mainPanel(
      plotOutput("plot"),
      tableOutput("table")
    )
  )
)

server <- function(input, output, session) {
  df <- reactive({
    head(get(input$dataset), input$nrows)
  })

  output$plot <- renderPlot({
    plot(df())
  })

  output$table <- renderTable({
    df()
  })
}

shinyApp(ui, server)
