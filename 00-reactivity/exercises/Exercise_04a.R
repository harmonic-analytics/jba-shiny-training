library(shiny)

# Assignment: Draw the reactive graph for this app.

ui <- fluidPage(
  h1("Exercise 4a"),
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

  output$plot <- renderPlot({
    plot(head(get(input$dataset), input$nrows))
  })

  output$table <- renderTable({
    head(get(input$dataset), input$nrows)
  })
}

shinyApp(ui, server)
