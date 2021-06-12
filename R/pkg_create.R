#' Creates Package Skeleton
#'
#' @param path Name of folder to create package
#' @param pkg_name Package name to use. Defaults to basename(path)
#' @param install_deps Logical: install standard dependencies?
#' @param open Logical: open RStudio Project?
#'
#' @export

pkg_create <- function(path, pkg_name = basename(path), install_deps = FALSE, open = NULL){

  path <- fs::path_expand(path)

  if(fs::dir_exists(path)) {
    res <- yesno(glue::glue("Path {path} already exists, override?"))
    if(!res) return(invisible())
  }

  cli::cat_rule("Creating app directory")

  fs::dir_create(path, recurse = TRUE)

  cat_green_tick("Created app directory")

  cat_green_tick("RStudio project initialisation")

  rproj_path <- rstudioapi::initializeProject(path = path)

  cli::cat_rule("Copying package skeleton")

  from <- dp_sys("pkgtemplate")

  fs::dir_copy(path = from, new_path = path, overwrite = TRUE)

  cat_green_tick("Copied package skeleton")

  xfun::gsub_dir(pattern = "PkgName",
                 replacement = pkg_name,
                 recursive = TRUE,
                 dir = path)

  cat_green_tick(glue::glue("Substituted {pkg_name} for PkgName"))

  if(is.null(install_deps)) install_deps = yesno(glue::glue("Install standard dependencies?"))

  if(install_deps) remotes::install_deps(path, upgrade = "ask")

  fs::dir_tree(path = path, recurse = TRUE)

  cli::cat_rule("Done")

  if(is.null(open)) open <- yesno(glue::glue("Open {pkg_name} now?"))

  if(open) rstudioapi::openProject(path = path, newSession = TRUE)

  invisible(fs::path_abs(path))
}
