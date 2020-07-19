list_r_files <- function(pkg = ".", ext = ".[Rr]$") {
  pkg <- devtools::as.package(pkg, create = FALSE)
  all_files <- list.files(pkg$path, pattern = ext, full.names = FALSE, recursive = TRUE)
  all_files
}

list_functions <- function(pkg = ".") {
  pkg <- devtools::as.package(pkg, create = FALSE)
  lsf.str(paste0("package:", pkg$package))
}

