# `ggplot2`

## grammar of graphics
 - data
 - geometric objects (e.g. circles, lines, etc)
 - aesthetics (appearance) of geometric objects
 - position adjustment to avoid overlap
 - scale for each aesthetics mapping
 - coordinate system to organise geometric objects
 - facets or groups of data


 **Fun fact:** `ggplot2` comes with built-in data sets.
 - `qplot()` is a function within `ggplot2` that creates quick plots but better to use `ggplot2` for ability in changing parameters

 - `geom_function`:

  - `geom_point()`: draw a dot for each data point
  - `geom_line()`: draw a line
  - `geom_smooth()`: make a smooth line
  - `geom_col()`: draw columns for a bar chart
  - `geom_polyon()` draw a polygon for each data point

- `ggplot2` does some aggregation on data similar to `group_by` or `summarise` in `dplyr` but without actual changing of data sets.
- aesthetic mapping can attribute position, colour, size or shape to a specific part of data

- scale:

  - `scale_x/y_continuous()`for continuous set of numbers whereas `scale_discrete()` is for limited number of colours
  - `scale_x_reverse()` reverse the x-axis order
  - `scale_x_log10() makes the scale logarithmic`

- colour:

  - `scale_color_manual()` to set your own set of colours
  - `scale_color_gradient()` for using continuous colour scales

- coordinate system:

  - `coord_cartesian()` for cartesian values
  - `coord_flip()` for flipping x and y-axis
  - `coord_fixed()` to define fixed aspect ratio for screen
  - `coord_polar()` is best for pie charts
  - `coord_quickmap()` helps to get good aspect ratio for maps

- facet:

 - `facet_wrap()` allows putting multiple pieces of plots in several rows based on a categorical variable
 - `facet_function` acts as `group_by()` or `summarize()` in `dplyr` while it put all the pieces in one row

- label:
 - `labs()` can bu used for adding title, labels to x and y-axis, and legend title
 - `geom_text()` add plain text to data points whereas `geom_label()` for adding boxed text to data points
 - `geom_label_repel` helps to add boxed texts without overlapping

- map:
 - two types of maps: choropleth map/heatmap and dot distribution maps can be plotted with ggplot2
 - `geom_polygon()` can be used to define the outlines in the map. To do this, related data files/shapefiles need to be loaded that describes the geometries (outlines).
 - shapefiles can be downloaded from online sources but ggplot2 itself includes a handful of shapefiles.
 - shapefiles in ggplot2 can be loaded with   `map_data("state"/"usa"/"world")`command and then use `geom_polygon()` to render the map with these shapefiles.
 - `coord_map()` can be used to define an appropriate aspect ratio for the map. 
