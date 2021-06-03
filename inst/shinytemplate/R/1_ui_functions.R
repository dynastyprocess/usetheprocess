chap_header <- function(title) {
  bs4Dash::dashboardHeader(
    skin = "dark",
    fixed = TRUE,
    border = TRUE,
    shiny::span(title, style = "font-size:1.5em;color:#ffffff")
  )
}

externalMenuItem <- function(text = NULL, href = NULL, icon = NULL) {
  tags$li(tags$a(span(icon(icon), style = "font-size:1.1rem;"),
                 span(text, style = "margin-left: .2rem;"),
                 class = "nav-link", href = href
  ), class = "nav-item")
}

chap_sidebar <- function(debug = FALSE) {

  if(debug)(debug_button <- actionButton("debug","debug"))
  if(!debug)(debug_button <- shinyjs::hidden(actionButton("debug","debug")))

  bs4Dash::dashboardSidebar(
    width = 250,
    title = "CHAP",
    fixed = TRUE,
    skin = "dark",
    elevation = 3,
    collapsed = TRUE,
    opacity = 0.8,
    expand_on_hover = TRUE,
    url = "http://shiny.caivan.com",
    br(),
    sidebarMenu(
      menuItem("Tab 1", tabName = "first_tab", icon = "balance-scale-right"),
      menuItem("Dev News",  tabName = "news", icon = "news")
    ),
    br(),
    hr(),
    br(),
    sidebarMenu(
      id = "nav",
      actionButton("log_out",
                   "Log Out",
                   icon = icon("power-off"),
                   onclick = "window.open('/logout')"
      )
    ),
    debug_button
  )
}

chap_cssjs <- function() {
  tags$head( # JS and CSS ----
             # tags$script(
             #   "
             #            Shiny.addCustomMessageHandler('unbinding_table_elements', function(x) {
             #            Shiny.unbindAll($(document.getElementById(x)).find('.dataTable'));
             #            });
             #
             #        "
             # ),
             tags$style(includeHTML("chap.css"))
  )
}

sever_chap <- function() {
  sever(
    tagList(
      h1("Disconnected"),
      p(glue("Oops, looks like the app got disconnected.
              If this is an error, please send Tan the inputs so he can reproduce the issue!
             ")),
      br(),
      shiny::tags$button(
        "Reload",
        style = "color:#000;background-color:#fff;",
        class = "button",
        onClick = "location.reload();"
      )
    ),
    bg_color = "#000"
  )
}

chap_errorhandler <- function(app_state, e, title = "Oh no, we've hit an error!") {
  showModal(modalDialog(title = title, e$message))
  app_state$error <- "ERROR"
  # stop()
}

