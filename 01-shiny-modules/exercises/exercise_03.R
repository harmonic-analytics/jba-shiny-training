ui <- fluidPage(
  
  selectInput("dataset",
              "Dataset:",
              choices = c("iris","cars","pressure")),
  
  selectInput("dataset_col",
              "Dataset column:",
              choices = NULL),
  
  plotOutput("dataset_hist")
  
)


server <- function(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset)
    })
  
  observe({
                 updateSelectInput(session,
                                   "dataset_col",
                                   choices = colnames(dataset()))
                 
               })

  output$dataset_hist <- renderPlot({

    hist(dataset()[[input$dataset_col]])
      
    
  })
  
}

shinyApp(ui, server)