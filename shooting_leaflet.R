# map of fatal police shooting using leaflet
------------------------------------------
  
library("leaflet")

------------------------------------------

shootings <- read.csv("data/police_shootings.csv", stringsAsFactors = FALSE)
View(shootings)

palette_fn <- colorFactor(palette = "Dark2", domain = shootings[["race"]])
