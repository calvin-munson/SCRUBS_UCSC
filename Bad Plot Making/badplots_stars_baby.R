## Bad plot making
setwd("~/Desktop/SCRUBS_UCSC/Bad Plot Making")
library(tidyverse)
library(png) # For reading in PNGs
library(grid) # For converting PNGs to plotable objects


# Stars -------------------------------------------------------------------


# Read in the data
stars <- read_csv("stars.csv")

# Read in the png of the sun baby
sunbaby <- readPNG("Sun_Baby.png")
# Convert the sun baby png to be plotable
g <- rasterGrob(sunbaby, interpolate=TRUE)


# Make the bad plot!
stars %>% 
  # Plot with size and color representing different variables
  ggplot(aes(x = temp, y = magnitude, size = temp, color = magnitude)) +
  # Change the shape of the points to a weird one
  geom_point(shape = 13) +
  # Add the name of each star RIGHT in the middle of each point
  geom_text(aes(label = star),
            size = 3) +
  # Put the baby sun png in the top right
  annotation_custom(g, xmin=20000, xmax=35000, ymin=10, ymax=15) +
  # Choose a weirdish color gradient for the sun colors
  scale_color_gradient2(low = "red", mid = "blue", high = "black") +
  # Manually adjust the size range of the points to be large
  scale_size(range = c(-2,50)) +
  ggtitle("How bright vs hot stars are",
          subtitle = "and also their names") +
  labs(x = "temp (hot)",
       size = "temp (hot)",
       y = "magnitide (bright)",
       color = "magnitide (bright)") +
  # Weird theme
  # theme_dark() +
  # More theme elements
  theme(legend.position = "left", # Put the legend on the left
        panel.background = element_rect(fill = "red"), # Make the panel background red
        plot.background = element_rect(fill = "yellow")) # make the whole plot's background yellow

# Export with certain dimensions
ggsave("badplots_stars_baby.png",
       width = 8,
       height = 6)

