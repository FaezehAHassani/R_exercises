 # Interactive Visualisation in R

 - packages like `Plotly`, `Bokeh` can be used to addd basic interactions to the plots in `ggplot2`
 - `Leaflt` package can be used for interactive map visualisation
 - `Plotly` is a part of visualisation software that provides open source API for creating interactive visualisation in a various languages such as R, Matlab, Python and JavaScript.
  - you can first plot with `ggplot` and then wrap the plot with `ggplotly` to get the interactive plot
  - you can alternatively, plot with `plot_ly()` from the beginning, and then use `layout()` to define axis labels, title, and legend title similar to `labs()` and `theme()` commands in `ggplot2` 
