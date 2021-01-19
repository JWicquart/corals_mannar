# 1. Required packages ----

library(tidyverse) # Core tidyverse packages
library(ncdf4)
library(raster)
library(sp)

# 2. List of NetCDF4 files ----

ncdf_files <- list.files(path = "F:/Recherche/Projets/2020-07-30 - Resilience and disturbance characteristics/disturbance/data/05_sst_raw/", pattern = "\\.nc$", full.names = TRUE)

#ncdf_files <- list.files(path = "data/sst_raw/", pattern = "\\.nc$", full.names = TRUE)

# 3. Check if files are missing ----

real_files_list <- str_remove_all(str_split_fixed(ncdf_files, "_", n = 5)[,5], "\\.nc")
  
theoric_files_list <- str_remove_all(seq(as.Date("1985-01-01"), as.Date("2019-12-31"), by = "days"), "-")

setdiff(theoric_files_list, real_files_list)

rm(theoric_files_list, real_files_list)

# 4. File of sites coordinates ----

site_coordinates <- read.csv2("data/raw/Benthic community structure - GPS with depth.csv") %>% 
  mutate(island = str_split_fixed(Site.details, "_", 3)[,2],
         island = str_to_sentence(island),
         site = str_split_fixed(Site.details, "_", 3)[,3],
         site = replace(site, row_number() == 4, 4)) %>% 
  dplyr::select(-Depth_m, -Site.details) %>% 
  rename(lat = Lat, long = Long)

coordinates(site_coordinates) = ~ long + lat

# 5. Loop to extract SST for each site and each NetCDF4 file ----

# 5.1 Initialize the dataframe --

ncdf_i <- brick(ncdf_files[1], varname = "analysed_sst")

# plot(ncdf_i) # Make the plot

values_sst <- extract(ncdf_i, site_coordinates) %>% 
  as.data.frame(.) %>% 
  rename(sst = 1) %>%
  cbind(site_coordinates, .) %>% 
  as.data.frame(.) %>% 
  mutate(date = ncdf_i@z[[1]]) # Extract the date

# 5.2 Loop for other iterations --

for(i in 2:length(ncdf_files)){
  
  ncdf_i <- brick(ncdf_files[i], varname = "analysed_sst")
  
  values_sst_i <- extract(ncdf_i, site_coordinates) %>% 
    as.data.frame(.) %>% 
    rename(sst = 1) %>%
    cbind(site_coordinates, .) %>% 
    as.data.frame(.) %>% 
    mutate(date = ncdf_i@z[[1]]) # Extract the date
  
  values_sst <- rbind.data.frame(values_sst, values_sst_i)
  
}

# 6. Export data ----

write.csv(values_sst, "data/02_sst-extracted.csv", row.names = FALSE)
