#' Creates the Shiny UI for twitter using uiOutput
#'
#' @param id The module id must match the Server
#' @inherit shiny::uiOutput
#' @export
#'
#' @examples
#' \dontrun{
#' LinkedInShareUI("LinkedInShare")
#' }
#'
LinkedInShareUI <- function(id, inline = TRUE, container = if (inline) span else div, ...) {
  ns <- NS(id)

  uiOutput(ns("LinkedInShare"), inline = inline, container = container, ... = ...)
}

#' Creates the Shiny server module for twitter using moduleServer
#'
#' @param id The module id must match the UI
#' @inheritParams share_message_linkedin
#' @export
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#'
#' @examples
#' \dontrun{
#' LinkedInShare("LinkedInShare")
#' }
LinkedInShare <- function(id,
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

        message_linkedin <- reactive({
          share_message_linkedin(
            url = url_shiny()
          )
        })
      } else {
        message_linkedin <- reactive({
          share_message_linkedin(
            url = url_server
          )
        })
      }


      output$LinkedInShare <- renderUI({
        socialButton(
          url = message_linkedin(),
          type = "linkedin"
        )
      })
    }
  )
}
