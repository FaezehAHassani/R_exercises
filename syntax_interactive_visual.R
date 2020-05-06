########## Interactive visualisation in R ##########

install.packages("plotly")
library("plotly")

devtools::install_github("hafen/rbokeh")
library("rbokeh")

install.packages("leaflet")
library("leaflet")

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



####### help commands
