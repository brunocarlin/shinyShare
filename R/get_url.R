#' Title
#'
#' @param id the id of the module, not really needed for this use case
#'
#' @return the url of the current shiny page, it will only execute it once reducing waiting times
#' @export
#'
#' @examples
#' \dontrun{
#' get_url()
#' }
get_url <- function(id = "url") {
  moduleServer(
    id,
    function(input, output, session) {
      isolate(
        reactive(
          paste0(
            session$clientData$url_protocol,
            "//",
            session$clientData$url_hostname,
            session$clientData$url_pathname,
            session$clientData$url_port,
            session$clientData$url_search
          )
        )()
      )
    }
  )
}
