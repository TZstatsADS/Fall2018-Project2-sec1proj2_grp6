# server.R

library(maps)
library(mapproj)
employ <- read.csv("employ.csv")
heat_index <- read.csv("heat_index.csv")
income <- read.csv("income.csv")
source("helpers.R")


shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      args <- switch(input$var,
                     "Heat index" = list(heat_index$index, "orange", "Heat index"),
                     "unemployment rate" = list(employ$Rate, "black", "unemployment rate"),
                     
)
      args$min <- input$range[1]
      args$max <- input$range[2]
      
      do.call(percent_map, args)
    })
  }
)
