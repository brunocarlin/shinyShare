#' Creates the twitter message to be shared
#'
#' @param text a string which will begin the tweet
#' @param url a valid url to be shared on twitter
#' @param hashtags the end of the tweet separated by commas
#'
#' @return a string with the concatenation of the arguments plus the required skeleton.
#' @export
#'
#' @examples
#' share_message_twitter(text = "see", url = "how", "it works")
share_message_twitter <- function(text, url, hashtags) {
  paste0(
    "https://twitter.com/intent/tweet?text=",
    utils::URLencode(paste0(text, "\n")),
    "&url=", utils::URLencode(paste0(url, "\n")), "&hashtags=",
    utils::URLencode(hashtags)
  )
}
