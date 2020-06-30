# map of fatal police shooting using leaflet
------------------------------------------
  
library("leaflet")
library("dplyr")

------------------------------------------

shootings <- read.csv("data/police_shootings.csv", stringsAsFactors = FALSE)
View(shootings)

palette_fn <- colorFactor(palette = "Dark2", domain = shootings[["race"]])

leaflet(data = shootings) %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircleMarkers(
    lat = ~lat,
    lng = ~long,
    label = ~paste0(name, ", ", age),
    color = ~palette_fn(shootings[["race"]]),
    fillOpacity = 0.7,
    radius =  4,
    stroke = FALSE
  ) %>%
  addLegend(
    position = "bottomright",
    title = "race",
    pal = palette_fn,
    values = shootings[["race"]],
    opacity = 1
    )

table <- shootings %>%
  group_by(shootings[["race"]]) %>%
  count() %>%
  arrange(-n)

colnames(table) <- c("race", "Number of Victims")

View(table)

my_ui <- fluidPage(
  titlePanel("Fatal Police Shootings"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "analysis_var",
        label = "Level of nalysis",
        choices = c("gender", "race", "body_camera", "threat_level")
      )
    ),
    
    mainPanel(
      leafletOutput(outputId = "shooting_map"),
      tableOutput(outputId = "grouped_table")
    )
  )  
)  

server <- function(input, output) {
  
}