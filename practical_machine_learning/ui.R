#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Build your own linear model to predict miles/gallon"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Dataset mtcars"),
      selectInput("variables",
                  "Please select model features",
                  names(mtcars)[-1],
                  multiple = TRUE
                 ),
      submitButton("submit", "submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Model Summary"),
      h3("1. Formula"),
      verbatimTextOutput("formula", placeholder = TRUE),
      h3("2. Model statistics"),
      verbatimTextOutput("modelSummary", placeholder = TRUE),
      h3("3. Model plots"),
      plotOutput("modelPlot")
    )
  )
))

