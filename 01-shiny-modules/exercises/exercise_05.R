
## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = ""),
  dashboardSidebar(
    sidebarMenu(
      menuItem(),
      menuItem(),
      menuItem()
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(
      ),
      # Second tab content
      tabItem(
      ),
      # Third tab content
      tabItem(
      )
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
