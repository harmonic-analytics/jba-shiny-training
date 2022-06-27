library(shiny)

selectNumberUI <- function(id){
  ns <- NS(id)
  numericInput(ns("num"), label = h3("Numeric input"), value = 1)
}

selectNumberServer <- function(id){

  moduleServer(id,function(input,output,session){

    my_row <- reactive(input$num)

    return(my_row)
  })
}

tableUI <- function(id){
  ns <- NS(id)
  tableOutput(ns("table"))
}

tableServer <- function(id, row_number){
  moduleServer(id,function(input,output,session){

    output$table <- renderTable({iris[row_number(),]})

  })
}


ui <- fluidPage(
  selectNumberUI("sel"),
  tableUI("tbl")
)

server <- function(input, output) {

  row_number <- selectNumberServer("sel")
  tableServer("tbl",row_number)

}

shinyApp(ui,server)
