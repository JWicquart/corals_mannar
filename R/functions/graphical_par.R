# 1. Recquired packages ----

require(extrafont) # For fonts
require(RColorBrewer) # For palettes

# 2. Set the default font family ----

font_choose_graph <- "Century"
font_choose_map <- "Century Gothic"

# 3. Set the colors ----

# 3.1 For map --

col_fill_map <- "#ECECEC"
col_color_map <- "#95A5A6"
col_background_map <- "#f0f8ff"
col_fill_map_area <- "#d91e18"
col_color_map_area <- "#2e3131"

# 3.2 For graphs --

col_fill_graph <- "#59abe3"
col_color_graph <- "#2C3E50"

# 4. Define colors and shapes for each area ----

palette_area <- c("Caribbean" = "#9E0142", 
                  "Australia" = "#D53E4F", 
                  "Pacific" = "#F46D43", 
                  "South East Asia" = "#FDAE61", 
                  "South Asia" = "#FEE08B",
                  "Western Indian Ocean" = "#2e3131",
                  "ROPME Area" = "#ABDDA4",
                  "Red Sea" = "#66C2A5",
                  "Eastern Tropical Pacific" = "#3288BD",
                  "Atlantic" = "#5E4FA2")

# Created from "RColorBrewer" package:
# brewer.pal(n = 10, name = 'Spectral')

# To visualize the color palette:
# display.brewer.pal(n = 10, name = 'Spectral')
# or
# image(1:length(palette_area), 1, as.matrix(1:length(palette_area)), col = palette_area, xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n")

shape_area <- c("Caribbean" = 21, 
                "Australia" = 22, 
                "Pacific" = 23, 
                "South East Asia" = 24, 
                "South Asia" = 21,
                "Western Indian Ocean" = 25,
                "ROPME Area" = 22,
                "Red Sea" = 23,
                "Eastern Tropical Pacific" = 22,
                "Atlantic" = 25)

shape_map_area <- 21

# 5. Set the color palette ----

palette_continuous <- c("#2c82c9", "#f5ab35", "#cf000f")

palette_discrete <- "RdBu"

# 6. Define colors for benthic categories ----

benthic_palette <- c("Hard living coral" = "#be90d4",
                     "Abiotic" = "#f2d984",
                     "Other fauna" = "#ec644b",
                     "Algae" = "#68c3a3")


