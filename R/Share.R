#' Creates the Shiny UI for social networks using uiOutput
#'
#' @inherit twitterShareUI
#'
#' @examples
#' \dontrun{
#' ShareUI("Share")
#' }
ShareUI <- function(id, inline = TRUE, container = if (inline) span else div, ...) {
  ns <- NS(id)
  tagList(
    twitterShareUI(ns("twitter1"),inline = inline,container = container,... = ...),
    twitterShareUI(ns("twitter2"),inline = inline,container = container,... = ...)
  )

}


#' Creates the Shiny server module for socual networks using moduleServer
#'
#' @inherit twitterShare
#' #' @examples
#' \dontrun{
#' Share("Share")
#' }
Share <- function(id,
                         text = "This is my shiny app!",
                         hashtags = "rstats,r",
                         url = NULL) {
  moduleServer(
    id,
    function(input,
             output,
             session,
             url_server = url) {
     twitterShare("twitter1",text = text,hashtags = hashtags,url = url_server)
     twitterShare("twitter2",text = text,hashtags = hashtags,url = url_server)
    }

  )
}
