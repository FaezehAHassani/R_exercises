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
 - types of ``geom_function`

  - `geom_point()`: draw a dot for each data point
  - `geom_line()`: draw a line
  - `geom_smooth()`: make a smooth line
  - `geom_col()`: draw columns for a bar chart
  - `geom_polyon()` draw a polygon for each data point

- `ggplot2` does some aggregation on data similar to `group_by` or `summarise` in `dplyr` but without actual changing of data sets.
- aesthetic mapping can attribute position, color, size or shape to a specific part of data
