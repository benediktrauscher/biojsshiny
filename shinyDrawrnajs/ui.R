
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(drawrnajs)

shinyUI(fluidPage(

  # Application title
  titlePanel("Draw an RNA"),

    # Show a plot of the generated distribution
    mainPanel(
      drawrnajsOutput("draw")
    )
  )
)
