
# Shiny ui for LM

library(shiny)

source('global.R')

# Define UI for the application

shinyUI(pageWithSidebar(


  # Application title
  headerPanel("Fit a Linear Model: Galton's height data"),

  sidebarPanel(

      sliderInput(inputId = 'Intercept', label = 'Intercept',
                 min = 0, max = 200, value = 100, step = 5),

      sliderInput(inputId = 'Slope', label = 'Slope',
                  min = -2, max = 2, value = 0, step = 0.05)

#      radioButtons(inputId = 'prob_type',
#                   label = 'Probability:',
#                   choices = c('Lower tail ' = 'lower',
#                               'Upper tail ' = 'upper'),
#                   selected = 'upper')
#
  ),


  mainPanel(
    tabsetPanel(
      tabPanel(title = 'Slope and intercept',
               plotOutput(outputId = 'fitted.plot'),
               plotOutput(outputId = 'RSE.plot'))
    )
  )


))


