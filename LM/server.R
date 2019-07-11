
# Shiny server for fitting normal LM to Galton's data (subset)
library(shiny)

source('global.R')

# Define server logic
shinyServer(function(input, output) {

      inputVal <- reactive({
          list(Intercept= input$Intercept,
               Slope= input$Slope)
      })

      output$fitted.plot <- renderPlot({
          fn.fitted.plot(inputVal())
      })


      output$RSE.plot <- renderPlot({
        fn.SSE.plot(inputVal())
      })

})


