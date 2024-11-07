library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Hello Shiny!",
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  # Output: Histogram ----
  plotOutput(outputId = "distPlot")
)

#' Define server logic required to draw a histogram
#' @importFrom graphics hist
#' @importFrom utils data
#' @noRd
server <- function(input, output) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({

    x    <- datasets::faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    graphics::hist(x, breaks = bins, col = "#007bc2", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")

  })

}

#' Runs the shiny app
#' @param ... Further arguments passed to [shiny::shinyApp()].
#' @details
#' The app featured in this package is the one presented in the shiny demo:
#' <https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/index.html>.
#'
#' @return
#' Starts the execution of the app, printing the port
#' on the console.
#' @export
#' @examples
#' # To be executed interactively only
#' if (interactive()) {
#'   run_my_app()
#' }
#' @import shiny
run_my_app <- function(...) {
  shinyApp(ui = ui, server = server, ...)
}
