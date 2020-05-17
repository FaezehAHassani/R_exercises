# I would like to add this R code file to my .Rmd file by using source() command

library("ggplot2")

plot_example <- ggplot(midwest) +  
  geom_point(mapping = aes( 
    x = percollege, y = percadultpoverty, color = state) 
    ) + 
    scale_color_brewer(palette = "Set3")



