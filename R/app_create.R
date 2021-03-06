#' Creates DynastyProcess Shiny App
#'
#' @param path Name of folder to create app
#' @param app_name Package name to use. Defaults to basename(path)
#' @param install_deps Logical: install packages?
#' @param open Logical: open RStudio Project?
#'
#' @export

app_create <- function(path, app_name = basename(path), install_deps = interactive(), open = interactive()){

  path <- fs::path_expand(path)

  if(fs::dir_exists(path) & !interactive()) return(invisible())

  if(fs::dir_exists(path)) {
    res <- yesno(glue::glue("Path {path} already exists, override?"))
    if(!res) return(invisible())
  }

  cli::cat_rule("Creating dir")

  fs::dir_create(path, recurse = TRUE)

  cat_green_tick("Created app directory")

  cat_green_tick("RStudio project initialisation")
  rproj_path <- rstudioapi::initializeProject(path = path)

  cli::cat_rule("Copying app skeleton")

  from <- dp_sys("shinytemplate")

  fs::dir_copy(path = from, new_path = path, overwrite = TRUE)

  cat_green_tick("Copied app skeleton")

  xfun::gsub_dir(pattern = "AppName",
                 replacement = app_name,
                 recursive = TRUE,
                 dir = path)

  cat_green_tick(glue::glue("Substituted {app_name} for AppName"))

  if(is.null(install_deps)) install_deps = yesno(glue::glue("Install standard dependencies?"))

  if(install_deps) remotes::install_deps(path, upgrade = "ask")

  fs::dir_tree(path = path, recurse = TRUE)

  cli::cat_rule("Done")

  if(is.null(open)) open <- yesno(glue::glue("Open {app_name} now?"))

  if(open) rstudioapi::openProject(path = path, newSession = TRUE)

  invisible(fs::path_abs(path))
}
