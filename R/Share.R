#' Creates the Shiny UI for social networks using uiOutput
#'
#' @inherit twitterShareUI
#'
#' @param social_media decides which social media buttons to include
#' @export
#' @examples
#' \dontrun{
#' ShareUI("Share")
#' }
ShareUI <- function(id,social_media = c("twitter","linkedIn"),inline = TRUE, container = if (inline) span else div, ...) {
  ns <- NS(id)
  list_tag <- list(
    twitter = twitterShareUI(ns("twitter"),inline = inline,container = container,... = ...),
    linkedIn = LinkedInShareUI(ns("linkedIn"),inline = inline,container = container,... = ...)
  )

  do.call(tagList, list_tag[social_media])

}


#' Creates the Shiny server module for social media using moduleServer
#'
#' @param id The module id must match the UI
#' @param text a string which will begin the share text
#' @param url a valid url to be shared on social media
#' @param hashtags the end of the text separated by commas
#'
#' @export
#' @examples
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
     twitterShare("twitter",text = text,hashtags = hashtags,url = url_server)
     LinkedInShare("linkedIn",url = url_server)
    }

  )
}
