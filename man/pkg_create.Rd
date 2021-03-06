% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pkg_create.R
\name{pkg_create}
\alias{pkg_create}
\title{Creates Package Skeleton}
\usage{
pkg_create(path, pkg_name = basename(path), install_deps = FALSE, open = NULL)
}
\arguments{
\item{path}{Name of folder to create package}

\item{pkg_name}{Package name to use. Defaults to basename(path)}

\item{open}{Logical: open RStudio Project?}

\item{install_dependencies}{Logical: install standard dependencies?}
}
\description{
Creates Package Skeleton
}
