library(shiny)
library(leaflet)
library(maptools)
library(spatialEco)
library(dplyr)

setwd("~/Documents/Columbia/Exploratory Data Analysis and Visualization/HW3/Edav-P3-ggteam/Gary/shiny2/")

nycShape = readShapePoly("cb_2014_us_state_500k/cb_2014_us_state_500k.shp")
nycData = read.csv("s_us_selected_feature.csv") %>% mutate(median_rent = Median_gross_rent, mean_income = Mean_income) %>%
  select(-Median_gross_rent, -Mean_income)

nycShape@data = left_join(nycShape@data, nycData, by = c("AFFGEOID" = "Id")) 
nycShape = sp.na.omit(nycShape, col.name = "Id2", margin = 1)

pal <- function(x) {colorBin("YlGnBu", x)}


namesMap = list("Median Age" = "median_age", "Married" = "married", 
                "High School and Higher" = "high_school_and_higher", 
                "Mean Income" = "mean_income", "Unemployment Rate" = "Unemployment_rate",
                "Median Rent" = "median_rent")

ui <- bootstrapPage(
  tags$head(
    includeCSS("styles.css")
  ),
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%"),
  absolutePanel(top = 10, right = 10, id = "controls", class = "panel panel-default",
                fixed = TRUE, draggable = TRUE,height = "100px", width =  "250px",
                selectInput("feature", "Feature",
                            choices = names(namesMap))
  ),
  absolutePanel(top = 10, left = 35,headerPanel("USA Explorer"))
)

server <- function(input, output, session) {
  # Reactive expression to subset data
  selectedFeature <- reactive({
    selected = input$feature
    return(list(feature = namesMap[[selected]], name = selected))
    
  })
  
  output$map <- renderLeaflet({
    leaflet(nycShape) %>%
    # map.panTo(new L.LatLng(40.737, -73.923));
    addProviderTiles("CartoDB.Positron") %>%
      setView(lat = 40, lng =-100, zoom=4) %>%
      addLayersControl(
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  
  observe({
    feature = unlist(nycShape@data[selectedFeature()[["feature"]]])
    featureName = selectedFeature()[["name"]]
    
    # notSelected = names(namesMap)[!names(namesMap) %in% featureName]
    leafletProxy("map") %>%
      clearControls() %>%
      addPolygons(data = nycShape, color = pal(feature)(feature),stroke = TRUE, weight = 1,
                  popup = ~paste(NAME, "<br>",featureName,": ",feature, sep=""), fillOpacity = 0.7)%>%
      addLegend(pal = pal(feature),
                values = feature,
                position = "bottomright",
                title = featureName)
    
  })
  
}

shinyApp(ui, server)



