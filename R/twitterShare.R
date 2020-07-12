#' Creates the Shiny UI for twitter using uiOutput
#'
#' @param id The module id must match the Server
#' @inherit shiny::uiOutput
#' @examples
#' \dontrun{
#' twitterShareUI("TwitterShare")
#' }
#' @import shiny
#'
twitterShareUI <- function(id, inline = TRUE, container = if (inline) span else div, ...) {
  ns <- NS(id)

  uiOutput(ns("twitterShare"), inline = inline, container = container, ... = ...)
}

#' Creates the Shiny server module for twitter using moduleServer
#'
#' @param id The module id must match the UI
#' @inheritParams share_message_twitter
#' @export
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#'
#' @examples
#' \dontrun{
#' twitterShare("TwitterShare")
#' }
twitterShare <- function(id,
                         text = "This is my shiny app!",
                         hashtags = "rstats,r",
                         url = NULL) {
  moduleServer(
    id,
    function(input,
             output,
             session,
             url_server = url) {
      if (is.null(url_server)) {
        url_shiny <- reactive(
          paste0(
            session$clientData$url_protocol,
            session$clientData$url_hostname,
            session$clientData$url_pathname,
            session$clientData$url_port,
            session$clientData$url_search
          )
        )

        message_twitter <- reactive({
          share_message_twitter(
            text = text,
            url = url_shiny(),
            hashtags = hashtags
          )
        })
      } else {
        message_twitter <- reactive({
          share_message_twitter(
            text = text,
            url = url_server,
            hashtags = hashtags
          )
        })
      }


      output$twitterShare <- renderUI({
        socialButton(
          url = message_twitter(),
          type = "twitter"
        )
      })
    }
  )
}
