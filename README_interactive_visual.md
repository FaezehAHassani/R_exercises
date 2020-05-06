 # Interactive Visualisation in R

 - packages like `Plotly`, `Bokeh` can be used to addd basic interactions to the plots in `ggplot2`
 - `Bokeh` was developed for Python but `rbokeh` can be used in R
 - `Leaflet` package can be used for interactive map visualisation
 - `Plotly` is a part of visualisation software that provides open source API for creating interactive visualisation in a various languages such as R, Matlab, Python and JavaScript.

 ## `Plotly`
  - you can first plot with `ggplot` and then wrap the plot with `ggplotly` to get the interactive plot
  - you can alternatively, plot with `plot_ly()` from the beginning, and then use `layout()` to define axis labels, title, and legend title similar to `labs()` and `theme()` commands in `ggplot2`

  ## `Bokeh`
  - `figure()` is defining the plotting area similar to `ggplot()` and `plot_ly` on which you can add `ly_prefix` to add points, a and y-axis
  -`Bokeh` uses pipelining style with %>% rather than + used in `ggplot`
  -`Bokeh` add the interaction menu on the right side of the plot while in `Plotly` this interaction menu is not visible in the plot.

  ## `Leaflet`
  - `Leaflet` is an open source JavaScript library for interactive maps
  - `leaflet()` makes the blank canvas for your plot similar to `ggplot()`
  - map tiles can then be added by using `addTiles()` function by piping method using %>%. You can mention the name of tile set or add the URL schema for the tiles
  - `Leaflet` by default uses OpenSreetMap tiles
  - you can alternatively use the map tiles from other providers by using `addProviderTiles()` function and mentioning the name of the tile set
