
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinyShare

<!-- badges: start -->

    [![R build status](https://github.com/brunocarlin/shinyShare/workflows/R-CMD-check/badge.svg)](https://github.com/brunocarlin/shinyShare/actions)

[![R build
status](https://github.com/brunocarlin/shinyShare/workflows/R-CMD-check/badge.svg)](https://github.com/brunocarlin/shinyShare/actions)
<!-- badges: end -->

The goal of shinyShare is to …

## Installation

You can install the released version of shinyShare from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("shinyShare")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brunocarlin/shinyShare")
```

## Example

This is a basic shiny app using the package to create a twitter share
button

``` r
library(shinyShare)

body <- dashboardBody(
  box(
    title = "Social Buttons",
    status = NULL,
    twitterShareUI("twitterShareText",inline = FALSE),
    twitterShareUI("twitterShareUrl",container = tags$li, class = "custom-li-output"),
  ),
  twitterShareUI("twitterShareHashtags")
)


ui = dashboardPage(header = dashboardHeader(title = "Social"),
                   sidebar = dashboardSidebar(),
                   body = body)

server <- function(input, output,session) {
  # 
  # http://twitter.com/share?text=text goes here&url=http://url goes here&hashtags=hashtag1,hashtag2,hashtag3
  # 
  
  url_shiny <- reactive({
    paste0(
      session$clientData$url_protocol,
      session$clientData$url_hostname,
      session$clientData$url_pathname,
      session$clientData$url_port,
      session$clientData$url_search
    )
  })


  twitterShare("twitterShareText",text = "test")
  twitterShare("twitterShareUrl",url = "test")
  twitterShare("twitterShareHashtags",hashtags = "test")

}

shinyApp(ui = ui,server = server)
```
