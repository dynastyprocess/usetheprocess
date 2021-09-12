pkgload::load_all()

ui <- dashboardPage(
  dark = NULL,
  title = glue("{pkgload::pkg_name()} v{pkgload::pkg_version()}"),
  # sidebar_collapsed = TRUE,
  header = dp_header(glue("DP: {pkgload::pkg_name()} ",
                          "v{pkgload::pkg_version()}")),
  sidebar = dp_sidebar(
    menuItem("Tab 1", tabName = "first_tab", icon = icon("quidditch")),
    # menuItem("Dev News",  tabName = "news", icon = icon("news")),
    debug = TRUE),
  body = dashboardBody(
    useShinyjs(),
    use_sever(),
    dp_cssjs(),
    tabItems(
      tabItem(
        tabName = "news",
        box(width = 12, status = "gray-dark", includeMarkdown("NEWS.md"))
      ),
      tabItem(
        tabName = "first_tab"
      )
    )
  ) # end of body ----
) # end of UI ----

# Server ----
server <- function(input, output, session) {

  #### FUNCTION LOAD ####

  sever_dp()

  observeEvent(input$debug, browser())

} # end of server ####

shinyApp(ui, server)
