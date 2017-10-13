#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    variables <- reactive({ as.character(input$variables) })
    # if (length(variables()) == 0) { output}
    # v <- unlist(strsplit(variables, " "))
    # fmla <- paste("mpg ~ ", paste(v, collapse = " + "))
    fmla <- reactive({ reformulate(variables(), "mpg") })
    fit <- reactive({ lm(fmla(), data = mtcars) })
    
    observeEvent(
      input$variables, {
        output$formula <- renderPrint({
          fmla()
        })
        output$modelSummary <- renderPrint({
          summary(fit())
        })
        output$modelPlot <- renderPlot({
          par(mfrow = c(2, 2))
          plot(fit())
        })
      }
    )
})
