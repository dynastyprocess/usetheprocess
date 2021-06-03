
suppressPackageStartupMessages({

  # Data Import
  library(DBI)
  library(odbc)
  library(arrow)

  # Data Manipulation
  library(tidyverse)
  library(glue)
  library(magrittr)
  library(janitor)
  library(lubridate)
  library(hrbrthemes)

  # hrbrthemes::import_plex_sans()

  # Shiny libraries
  library(shiny)
  library(bs4Dash)
  library(shinyjs)
  library(shinyWidgets)
  library(DT)
  library(reactable)
  library(joker)
  library(sever)
  #library(ggiraph)
  library(details)

  # Report libraries
  library(writexl)

  options(shiny.reactlog = TRUE)
  options(stringsAsFactors = FALSE)
  options(scipen = 999)
  options(dplyr.summarise.inform = FALSE)
  # extrafont::loadfonts()
})
