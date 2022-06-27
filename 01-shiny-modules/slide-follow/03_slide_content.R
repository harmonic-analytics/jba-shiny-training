library(shiny)

playerBreakDownUI <- function(id){
  ns <- NS(id)
  tagList(plotOutput(ns("plot")),
          tableOutput((ns("table"))),
          verbatimTextOutput(ns("summary_text"))
  )
}

overviewPageUI <- function(id){
  ns <- NS(id)

  fluidRow(column(6,
                  playerBreakDownUI(ns("player"))
  ),
  column(6,
         teamBreakDownUI(ns("team"))
  )
  )

}

ui <- fluidPage(
  tabsetPanel(type = "tabs",
              tabPanel("Overview",
                       overviewPageUI("overview")),
              tabPanel("Plots",
                       plotPageUI("plot"))
  )
)

server <- function(input, output) {}

shinyApp(ui,server)
