setwd("C:\\Users\\HS\\Desktop\\school\\classes\\VIS\\HW3\\git3\\Edav-P3-ggteam\\hs2865")

library(ggplot2)
library(ggmap)


ue = read.csv("restaurant_UE.csv", as.is = TRUE)
ha = read.csv("restaurant_HA.csv", as.is = TRUE)

ue_f = data.frame(ue)
ha_f = data.frame(ha)

# average value of price level
mean(ue_f$price_level)
mean(ha_f$price_level)

### map drawing
# harlem
map_nyc_ha <- get_googlemap(center = c(lon=-73.937571, lat=40.804670), maptype = "satellite", zoom = 15)
ggmap(map_nyc_ha, extent = "device") + 
  geom_jitter(data=ha_f, aes(lng, lat, color = price_level, size = 5), alpha = 0.5) +
  scale_colour_gradientn(colours = rainbow(2, start = 0.15, alpha = 0.5)) +
  labs(title = "Price level of restaurants in Harlem", color = "Price level", size = ".")

# upper east
map_nyc_ue <- get_googlemap(center = c(lon=-73.960927, lat=40.771333), maptype = "satellite", zoom = 15)
ggmap(map_nyc_ue, extent = "device") + 
  geom_jitter(data=ue_f, aes(lng, lat, color = price_level, size = 5), alpha = 0.5) +
  scale_colour_gradientn(colours = rainbow(3, start = 0.15, alpha = 0.5)) +
  labs(title = "Price level of restaurants in Upper East Side", color = "Price level", size = ".")

# overall


# park = read.csv("park.csv", as.is = TRUE)
# police = read.csv("police.csv", as.is = TRUE)
# restaurant = read.csv("restaurant.csv", as.is = TRUE)
# school = read.csv("school.csv", as.is = TRUE)
# 
# park_f = data.frame(park)
# police_f = data.frame(police)
# restaurant_f = data.frame(restaurant)
# school_f = data.frame(school)
# 
# map_nyc <- get_map(location = "new york", maptype = "satellite", zoom = 11)
# 
# ggmap(map_nyc, extent = "device") + 
#   geom_point(aes(x=park_f$lng, 
#                  y=park_f$lat),
#              data=park_f, col="red", size=1)+
#   ggtitle("Park")
# 
# ggmap(map_nyc, extent = "device") + 
#   geom_point(aes(x=restaurant_f$lng, 
#                  y=restaurant_f$lat),
#              data=restaurant_f, col="red", size=1)+
#   ggtitle("Restaurant")
# 
# ggmap(map_nyc, extent = "device") + 
#   geom_point(aes(x=police_f$lng, 
#                  y=police_f$lat),
#              data=police_f, col="red", size=1)+
#   ggtitle("Police")
# 
# ggmap(map_nyc, extent = "device") + 
#   geom_point(aes(x=school_f$lng, 
#                  y=school_f$lat),
#              data=school_f, col="red", size=1)+
#   ggtitle("School")
# 

