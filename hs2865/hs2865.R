setwd("C:\\Users\\HS\\Desktop\\school\\classes\\VIS\\HW3\\source")

library(ggplot2)
library(ggmap)


park = read.csv("park.csv", as.is = TRUE)
police = read.csv("police.csv", as.is = TRUE)
restaurant = read.csv("restaurant.csv", as.is = TRUE)
school = read.csv("school.csv", as.is = TRUE)

park_f = data.frame(park)
police_f = data.frame(police)
restaurant_f = data.frame(restaurant)
school_f = data.frame(school)

map_nyc <- get_map(location = "new york", maptype = "satellite", zoom = 11)

ggmap(map_nyc, extent = "device") + 
  geom_point(aes(x=park_f$lng, 
                 y=park_f$lat),
             data=park_f, col="red", size=1)+
  ggtitle("Park")

ggmap(map_nyc, extent = "device") + 
  geom_point(aes(x=restaurant_f$lng, 
                 y=restaurant_f$lat),
             data=restaurant_f, col="red", size=1)+
  ggtitle("Restaurant")

ggmap(map_nyc, extent = "device") + 
  geom_point(aes(x=police_f$lng, 
                 y=police_f$lat),
             data=police_f, col="red", size=1)+
  ggtitle("Police")

ggmap(map_nyc, extent = "device") + 
  geom_point(aes(x=school_f$lng, 
                 y=school_f$lat),
             data=school_f, col="red", size=1)+
  ggtitle("School")



