# map of fatal police shooting using leaflet
#------------------------------------------
  
library(shiny)
library(leaflet)
library(dplyr)

#------------------------------------------

shootings <- read.csv("data/police_shootings.csv", stringsAsFactors = FALSE)
View(shootings)

my_ui <- fluidPage(
  titlePanel("Fatal Police Shootings"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "analysis_var",
        label = "Level of analysis",
        choices = c("gender", "race", "body_camera", "threat_level")
      )
    ),
    
    mainPanel(
      leafletOutput(outputId = "shooting_map"),
      tableOutput(outputId = "grouped_table")
    )
  )  
)  

my_server <- function(input, output) {
  output$shooting_map <- renderLeaflet({
    palette_fn <- colorFactor(
      palette = "Dark2", 
      domain = shootings[[input$analysis_var]]
      )
  
    leaflet(data = shootings) %>%
      addProviderTiles("Stamen.TonerLite") %>%
      addCircleMarkers(
        lat = ~lat,
        lng = ~long,
        label = ~paste0(name, ", ", age),
        color = ~palette_fn(shootings[[input$analysis_var]]),
        fillOpacity = 0.7,
        radius =  4,
        stroke = FALSE
      ) %>%
      addLegend(
        position = "bottomright",
        title = input$analysis_var,
        pal = palette_fn,
        values = shootings[[input$analysis_var]],
        opacity = 1
      )  
  })
  
  output$grouped_table <- renderTable({
    table <- shootings %>%
      group_by(shootings[[input$analysis_var]]) %>%
      count() %>%
      arrange(-n)
    View(table)
    colnames(table) <- c(input$analysis_var, "Number of Victims")
    table
  })
} 
  
shinyApp(ui = my_ui, server = my_server)
