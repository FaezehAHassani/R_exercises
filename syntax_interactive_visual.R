########## Interactive visualisation in R ##########

install.packages("plotly")
library("plotly")

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
  color = Species,
  type = "scatter",
  mode = "markers"
)



####### help commands
