#' List R files in a package
#'
#' Lists all files in a package directory with the .R or .r extension.
#' @template pkg
#' @param ext character; regular expression for the file extension to look for. Default is to include .r and .R files.
#' @return vector; vector of file paths
#' @export
list_r_files <- function(pkg = ".", ext = ".[Rr]$") {
  pkg <- devtools::as.package(pkg, create = FALSE)
  list.files(pkg$path, pattern = ext, full.names = FALSE, recursive = TRUE)
}



#' Find the number of lines in a file
#'
#' Returns the number of lines in a file using the [`readLines()`] function
#'
#' @param path character; path to file
#' @return numeric; number of lines
#' @export
file_length <- function(path) {
  length(readLines(path))
}
