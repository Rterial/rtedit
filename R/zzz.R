.global <- new.env()

initResourcePaths <- function() {
  if (is.null(.global$loaded)) {
    shiny::addResourcePath(
      prefix = 'rtedit',
      system.file('inst/www', package='rtedit',mustWork = T)
    )

    .global$loaded <- TRUE
  }
  HTML("")
}
