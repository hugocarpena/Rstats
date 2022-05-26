#Instalem packages
install.packages("viridis")
install.packages("viridisLite")
install.packages("tidyverse")
install.packages("sf")
install.packages("rayshader")
install.packages("magick")
install.packages("av")

#activem packages
library(viridis)
library(viridisLite)
library(tidyverse)
library(sf)
library(rayshader)
library(magick)
library(av)

#importem DATAFRAME
dades = st_read(dsn = "D:/R/rayshader_ggplot/ecu.shp")
#OBSERVEM DADES
print(dades)
dades = mutate(dades, Pop = COV)

#FEM PLOT EN 2D packages - ggplot2 
ggdades = ggplot(data = dades) + 
  geom_sf(aes(fill = Pop)) + 
  scale_color_viridis() +
  ggtitle("Població de l'Ecuador") +
  theme_bw()

print(ggdades)

#transformem a 3d
plot_gg(ggdades,multicore=TRUE,width=5,height=5,scale=300,windowsize=c(1280,720),
        zoom = 0.65, phi = 50)
render_snapshot()

#podem crear video, en el cas que volguem: - rayrender - package
Video <- file.path("D:/R/rayshader_ggplot/", "pop.mp4")
render_movie(filename = Video)

