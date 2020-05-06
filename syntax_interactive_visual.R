########## Interactive visualisation in R ##########

library("dplyr")

library("tidyr")

library("ggplot2")

install.packages("plotly")
library("plotly")

devtools::install_github("hafen/rbokeh")
library("rbokeh")

install.packages("leaflet")
library("leaflet")

devtools::install_github("rstudio/leaflet.providers")
library(leaflet.providers)
####### plotting iris built-in data set within ggplot2 #####
View(iris)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Width, y = Petal.Width, color = Species))

# use plot_ly to create an interactive plot from iris data => first plot with ggplot and then wrap it wioth ggplotly
flowerplot <- ggplot(iris) +
  geom_point(mapping = aes(x = Sepal.Width, y = Petal.Width, color = Species))
ggplotly(flowerplot)

# similar to the above, below codes with plot_ly can create a similar interactive plot
plot_ly(
  data = iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  type = "scatter",
  mode = "markers"
)

# to add labels to the created plot with plot_ly
plot_ly(
  iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  type = "scatter",
  mode ="markers"
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = "cm"), # add xaxis title as well as adding cm to each valu on xa-axis
    yaxis = list(title = "Petal Width", ticksuffix = "cm")
  )

# use rbokeh to create interactive plot
figure(data = iris, title = "Iris data set visualisation") %>%
  ly_points(
    Sepal.Width,
    Petal.Width,
    color = Species
  ) %>%
  x_axis(
    label = "Sepal Width",
    number_formatter = "printf", # define a specific tick along the x-axis
    format = "%s cm", # don't forget , even for the last line; this add cm with a space after each number along the x-axis
  ) %>%
  y_axis(
    label = "Petal Width",
    number_formatter = "printf",
    format = "%s cm",
  )

# use leaflet to build interactive maps
leaflet() %>%  # making a blank tile set
  addProviderTiles("CartoDB.Positron") %>%  # first this didn't load the map so I download new RStudio from "https://dailies.rstudio.com" and run all the libraries again, then it started to work correctly 
  setView(lng = -122.3321, lat = 47.6062, zoom = 10) # center the map on Seattle

# create data frame of 2 locations to be added to the above blank map tile
locations <- data.frame(
  label = c("University of Washington", "Seattle Central College"),
  lattitude = c(47.6553, 47.6163),
  longitude = c(-122.3035, -122.3216)
)

View(locations)

leaflet(data = locations) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = -122.3321, lat = 47.6062, zoom =11) %>%
  addCircles(
    lat = ~lattitude,
    lng = ~longitude,
    popup = ~label,  # this will allow the label to pop up as soon you hover on the circle
    radius =  500,
    stroke = FALSE
   )
####### help commands
