#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(maps)
library(mapdata)
library(ggplot2)

world<-map_data("world")
country_option <- c("")
country_option <- c(country_option, unique(world$region))
# Define UI for application displaying country on world map
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Displaying selected country on world map"),
  
  # 
  sidebarLayout(
    sidebarPanel(
      "Select a country to highlight:",
      selectInput("choose_country", "",country_option, selected = NULL, multiple=FALSE),
      h4("Detailed Instructions"),
      "This application allows you to choose a country from a drop menu and display
      it on world map."
    ),
    
    # Show the country plot
    mainPanel(
      h4("The selcted country is highlighted as shown"),
      plotOutput("mapPlot")
    )
  )
))
