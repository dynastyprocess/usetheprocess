dp_header <- function(title) {
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

dp_sidebar <- function(debug = FALSE) {

  if(debug)(debug_button <- actionButton("debug","debug"))
  if(!debug)(debug_button <- shinyjs::hidden(actionButton("debug","debug")))

  bs4Dash::dashboardSidebar(
    src = "https://raw.githubusercontent.com/dynastyprocess/graphics/main/.dynastyprocess/logohexonly.png",
    width = 250,
    title = "DynastyProcess",
    fixed = TRUE,
    skin = "dark",
    elevation = 3,
    collapsed = TRUE,
    opacity = 0.8,
    expand_on_hover = TRUE,
    url = "http://dynastyprocess.com",
    br(),
    sidebarMenu(
      menuItem("Tab 1", tabName = "first_tab", icon = "quidditch"),
      menuItem("Dev News",  tabName = "news", icon = "news")
    ),
    br(),
    hr(),
    br(),
    debug_button
  )
}

dp_cssjs <- function() {
  tags$head( # JS and CSS ----
             # tags$script(
             #   "
             #            Shiny.addCustomMessageHandler('unbinding_table_elements', function(x) {
             #            Shiny.unbindAll($(document.getElementById(x)).find('.dataTable'));
             #            });
             #
             #        "
             # ),
             tags$style(includeHTML("dp.css"))
  )
}

sever_dp <- function() {
  sever(
    tagList(
      h1("Disconnected"),
      em(joker::dadjoke()),
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

dp_errorhandler <- function(app_state, e, title = "Oh no, we've hit an error!") {
  showModal(modalDialog(title = title, e$message))
  app_state$error <- "ERROR"
  # stop()
}

