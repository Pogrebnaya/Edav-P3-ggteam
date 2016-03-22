library(shiny)
library(leaflet)

setwd("~/Documents/Columbia/Exploratory Data Analysis and Visualization/HW3/Edav-P3-ggteam/ce2330/")


park = read.csv("park.csv", as.is = TRUE)
police = read.csv("police.csv", as.is = TRUE)
restaurant = read.csv("restaurant.csv", as.is = TRUE)
school = read.csv("school.csv", as.is = TRUE)

parkIcon <- makeIcon(
  iconUrl = "Pine-512.png",
  iconWidth = 30, iconHeight = 30
)

policeIcon <- makeIcon(
  iconUrl = "noun_4404.png",
  iconWidth = 30, iconHeight = 30
)

restaurantIcon <- makeIcon(
  iconUrl = "red_food_restaurant_pixel_perfect_pika_kitchen-512.png",
  iconWidth = 30, iconHeight = 30
)

schoolIcon <- makeIcon(
  iconUrl = "538411-education_512x512.png",
  iconWidth = 30, iconHeight = 30
)

ui <- bootstrapPage(
  # tags$head(
  #   includeCSS("styles.css")
  # ),
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%")
  # absolutePanel(top = 10, right = 10, id = "controls", class = "panel panel-default", 
  #               fixed = TRUE, draggable = TRUE,height = "800px",
  #               sliderInput("date", "Pick a year", 
  #                           min=1985, max=2015, value=2010,
  #                           sep="", animate=TRUE, dragRange = FALSE),
  #               selectInput("component", "Pick a component", 
  #                           choices = 1:2, selected = 1),
  #               plotOutput("floodsMonth", height = 200),
  #               plotOutput("magnitudeMonth", height = 200),
  #               plotOutput("cause", height = 200)
  # ),
  # absolutePanel(top = 10, left = 25,headerPanel("Pressure Variation vs. Floods"))
)

server <- function(input, output, session) {
  # Reactive expression to subset data

  
  output$map <- renderLeaflet({
    # Aaspects of the map that  won't need to change dynamically
    leaflet() %>% 
      addProviderTiles("CartoDB.Positron") %>%
      addMarkers(lng = ~lng, lat = ~lat, icon = parkIcon, popup= ~name, 
                 clusterOptions = markerClusterOptions(),
                 group = "Parks",
                 data = park) %>%
      addMarkers(lng = ~lng, lat = ~lat, icon = policeIcon, popup= ~Name, 
                 clusterOptions = markerClusterOptions(),
                 group = "Police Stations",
                 data = police) %>%
      addMarkers(lng = ~lng, lat = ~lat, icon = restaurantIcon, popup= ~name, 
                 clusterOptions = markerClusterOptions(),
                 group = "Restaurants",
                 data = restaurant)%>%
      addMarkers(lng = ~lng, lat = ~lat, icon = schoolIcon, popup= ~SCHOOLNAME, 
                 clusterOptions = markerClusterOptions(),
                 group = "Schools",
                 data = school)%>%
      addLayersControl(
        overlayGroups = c("Parks", "Police Stations", "Restaurants", "Schools"),
        options = layersControlOptions(collapsed = FALSE)
      )
    
    
  })
}

shinyApp(ui, server)

