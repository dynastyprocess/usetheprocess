pkgload::load_all()

ui <- dashboardPage(
  title = glue("CHAP: {pkgload::pkg_name()}"),
  sidebar_collapsed = TRUE,
  navbar = chap_header(glue("CHAP: {pkgload::pkg_name()} ",
                            "v{pkgload::pkg_version()}")),
  sidebar = chap_sidebar(debug = TRUE),
  body = dashboardBody(
    useShinyjs(),
    use_sever(),
    chap_cssjs(),
    tabItems(
      tabItem(
        tabName = "news",
        box(width = 12, status = "dark", includeMarkdown("NEWS.md"))
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

  sever_chap()

  observeEvent(input$debug, browser())

} # end of server ####

shinyApp(ui, server)
