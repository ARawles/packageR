total_function_count <- function(pkg = ".") {
  length(list_functions(pkg))
}

total_function_length <- function(pkg = ".") {
  fun_list <- list_functions(pkg, info = TRUE)
  lengths <- c()
  for (i in fun_list) {
    lengths <- c(lengths, i$length)
  }
  sum(lengths)
}
