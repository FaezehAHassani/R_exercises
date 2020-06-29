# map of fatal police shooting using leaflet
------------------------------------------
  
library("leaflet")

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
