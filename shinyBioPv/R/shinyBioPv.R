#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
library('htmlwidgets')
shinyBioPv <- function(pdbcode, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    pdbcode = pdbcode
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'shinyBioPv',
    x,
    width = width,
    height = height,
    package = 'shinyBioPv'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
shinyBioPvOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'shinyBioPv', width, height, package = 'shinyBioPv')
}

#' Widget render function for use in Shiny
#'
#' @export
renderShinyBioPv <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, shinyBioPvOutput, env, quoted = TRUE)
}
