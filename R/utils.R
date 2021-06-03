#' @seealso https://github.com/ThinkR-open/golem/blob/main/R/utils.R

yesno <- function (...)
{
  cat(paste0(..., collapse = ""))
  utils::menu(c("Yes", "No")) == 1
}

darkgrey <- function(x) {
  x <- crayon::make_style("darkgrey")(x)
}

dp_sys <- function(
  ...,
  lib.loc = NULL,
  mustWork = FALSE
){
  system.file(
    ...,
    package = "usetheprocess",
    lib.loc = lib.loc,
    mustWork = mustWork
  )
}

cat_green_tick <- function(...){
  cli::cat_bullet(
    ...,
    bullet = "tick",
    bullet_col = "green"
  )
}
