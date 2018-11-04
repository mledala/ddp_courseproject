#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

# Define server logic required to draw the world map and selected country
shinyServer(function(input, output) {
  
  # load country data
  world <- map_data("world")
  choose_country <- reactive({
    subset(world, region %in% input$choose_country)
  })
  
  output$mapPlot <- renderPlot({
    
    # Show the world map with the selected country highlighted in orange
    ggplot(data = world) + 
      geom_polygon(aes(x = long, y = lat, group = group), fill = "grey", color = "black") + 
      coord_fixed(1.3) +
      guides(fill=FALSE) + geom_polygon(data=choose_country(), aes(x = long, y = lat, group = group), fill = "orange")
    })
  })

# Define server logic required to draw the world map and selected country
shinyServer(function(input, output) {
  
  # load country data
  world <- map_data("world")
  choose_country <- reactive({
    subset(world, region %in% input$choose_country)
  })
  
  output$mapPlot <- renderPlot({
    
    # Show the world map with the selected country highlighted in orange
    ggplot(data = world) + 
      geom_polygon(aes(x = long, y = lat, group = group), fill = "grey", color = "black") + 
      coord_fixed(1.3) +
      guides(fill=FALSE) + geom_polygon(data=choose_country(), aes(x = long, y = lat, group = group), fill = "orange")
  })
})