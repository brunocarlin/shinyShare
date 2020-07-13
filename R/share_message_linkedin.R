#' Creates the twitter message to be shared
#'
#' @param url a valid url to be shared on LinkedIn
#'
#' @return a string with the concatenation of the arguments plus the required skeleton.
#' @export
#'
#' @examples
#' share_message_twitter(text = "see", url = "how", "it works")
share_message_linkedin <- function(url) {
  paste0(
    "https://www.linkedin.com/sharing/share-offsite/?url=",
    "&url=",utils::URLencode(paste0(url, "\n"))
  )
}
