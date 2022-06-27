ui <- fluidPage(
  
  fluidRow(
    column(1,
    actionButton("addButton","add 1")),
    column(1,
    textOutput("addText")
    )
  )
)

server <- function(input, output, session) {
  
  count <- reactiveVal(0)
  
  observeEvent(input$addButton,{
    
   count(count()+1)
    
  })
  
  output$addText <- renderText({
    count()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)