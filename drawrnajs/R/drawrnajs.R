#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
drawrnajs <- function(rna, dotbr, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    rna = rna,
    dotbr = dotbr
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'drawrnajs',
    x,
    width = width,
    height = height,
    package = 'drawrnajs'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
drawrnajsOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'drawrnajs', width, height, package = 'drawrnajs')
}

#' Widget render function for use in Shiny
#'
#' @export
renderDrawrnajs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, drawrnajsOutput, env, quoted = TRUE)
}
