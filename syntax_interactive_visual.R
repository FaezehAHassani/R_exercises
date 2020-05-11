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
    popup =  ~label,  # this will allow the label to pop up as soon you click on the circle; label =  ~label will allow the labels to popup as soon as you hover on the circles
    radius =  500,
    stroke = FALSE
   )

#### plotting City of Seattle Land Use Permits data downloaded from https://data.seattle.gov
all_permits <- read.csv("data/Building_Permits.csv")

View(all_permits)

# filter to buildings from 2010 and later
new_buildings2010 <- all_permits %>%
  filter(
    PermitTypeDesc == "New",
    PermitClass != "N/A",  #!= not equal
    as.Date(all_permits$IssuedDate) >= as.Date("2010-01-01") # filter rows from IssudeDate columns after or on date of 2018-01-01
  )

View(new_buildings2010)

# want to count number of permits per year in new_buildings2010
new_buildings2010 <- new_buildings2010 %>%
  mutate(year = substr(IssuedDate, 1, 4))  # add a new column names "year" and extract the year from IssuedDate columns by using substr command that start character is the 1st character and end character is the 4th character

View(new_buildings2010)

# count number of permits per year, one column "year" and one column "n" that shows counts
by_year <- new_buildings2010 %>%
  group_by(year) %>%
  count()

View(by_year)

plot_ly(
  data = by_year,
  x = ~year,
  y = ~n,
  type = "bar",
  alpha = 0.7, # adjust the opacity of bar
  hoverinfo = "y" # show the y value when hover on a bar => had to use hoverinfo contary to hovertext in the book, hovertext showed both year and number whereas I required to show only number while hovering the bar
) %>%
  layout(
    title = " Number of New Building Permits per year in Seattle",
    xaxis = list(title = "Year"), # show x-axis name of Year but also show each year
    yaxis = list(title = "Number of Permits")
  )

# plotting leaflet map with circle markers
leaflet(new_buildings2010) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10) %>%
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    stroke = FALSE,  # remove border from each circle
    popup = ~Description
  )

# leaflet map with colored circles and legend
palette_fn <- colorFactor(palette = "Set3", domain = new_buildings2010$PermitClass) # a function to make a color based on the PermitClass column
leaflet(new_buildings2010) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10) %>%
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    stroke = FALSE,  
    popup = ~Description,
    color = ~palette_fn(PermitClass)
  ) %>%
  addLegend(
      position = "bottomright",
      title = "New Buildings in Seattle",
      pal = palette_fn,
      values = ~PermitClass,
      opacity = 1
   ) 




####### help commands
? substr
? layout
