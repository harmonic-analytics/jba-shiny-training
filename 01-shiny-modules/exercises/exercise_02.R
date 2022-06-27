library(shiny)

ui <- fluidPage(
  
  titlePanel("Histograms"),
  
  fluidPage(
    plotOutput("cars_hist"),
    plotOutput("attitude_hist"),
    plotOutput("iris_hist")
  )
)

server <- function(input, output, session) {
  
  output$cars_hist <- renderPlot({
    hist(cars$speed, xlab = "", ylab = "", main = paste("Histogram of Car Speed"))
  })
  
  output$attitude_hist <- renderPlot({
    hist(attitude$rating, xlab = "", ylab = "", main = paste("Histogram of Attitude Rating"))
  })
  
  output$iris_hist <- renderPlot({
    hist(iris$Sepal.Length, xlab = "", ylab = "", main = paste("Histogram of Iris Sepal Length"))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)