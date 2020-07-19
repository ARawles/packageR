#' Change to format of a list of function names to match that returned from [`function_info()`]
#' @examples
#' list_to_function_list(
#' list = list("sum", "mean")
#' )
list_to_function_list <- function(list) {
  ret_list <- list()
  for (i in list) {
    ret_list <- c(ret_list, list(list(name = i)))
  }
  ret_list
}
