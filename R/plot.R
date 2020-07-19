#' Show a boxplot of a package's function lengths
#'
#' Create a ggplot2 graphic showing the range of function lengths in a package.
#' @template pkg
#' @return ggplot2; ggplot2 graphic (boxplot)
#' @export
plot_function_length <- function(pkg = ".") {
  raw <- function_list_to_tibble(list_functions(pkg, info = TRUE), info = TRUE)

  ggplot2::ggplot(raw, ggplot2::aes(y = length)) +
    ggplot2::geom_boxplot() +
    ggplot2::scale_y_continuous(name = "Function Length") +
    ggplot2::scale_x_continuous(name = "", labels = NULL, breaks = NULL)

}
