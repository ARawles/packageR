#' Convert a language object to a character
#'
#' Converts a language object (like the body of a function) to a vector of character strings that roughly translate to one line per entry
#' @param lang language; language object to be converted
#' @return vector; vector of character strings with roughly one line per entry
#' @export
#' @examples
#' language_to_character(functionBody(language_to_character))
language_to_character <- function(lang) {
  if (is.character(lang)) {
    return(lang)
  }
  raw_char <- as.character(lang)
  # Remove the first "{" that will always be there
  raw_char <- raw_char[2:length(raw_char)]
  if (raw_char[[length(raw_char)]] == "}") {
    # Remove the last "}" if there is one
    raw_char <- raw_char[1:(length(raw_char) - 1)]
  }
  g1 <- gsub(x = raw_char, pattern = "\n", replacement = "")
  g2 <- gsub(x = g1, pattern = "\\s{3}", replacement = "\\1\n")
  unlist(strsplit(g2, "\n"))
}


#' Convert a list of functions to a tibble
#'
#' This converts the long function format (a list with names, bodies, etc.) to a tibble. This makes things like plotting much easier.
#' @param function_list list; a list of the functions. Must contain sublists with a 'name' item
#' @param info logical; should the function info (body and length) be included (default is FALSE)? This information must be in the provided list
#' @return tibble; tibble with 1 column ('name') if `info` is FALSE, or 3 columns ('name', 'body' and 'length') if `info` is TRUE
#' @export
function_list_to_tibble <- function(function_list, info = FALSE) {
  names <- c()

  if (info) {
    bodies <- c()
    lengths <- c()
    for (i in function_list) {
      names <- c(names, i$name)
      lengths <- c(lengths, i$length)
      bodies <- c(bodies, paste0(language_to_character(i$body), collapse = " "))
    }
    tibble::tibble(name = names,
               body = bodies,
               length = lengths)
  } else {
    for (i in function_list) {
      names <- c(names, i$name)
    }
    tibble::tibble(name = names)
  }



}
