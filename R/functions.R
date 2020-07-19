#' List all functions in a package
#'
#' List all exported functions in a package.
#' @template pkg
#' @param info logical; whether to return additional info (e.g. body and length) for each function. Default is FALSE
#' @param character logical; if `info` is TRUE, then should the body of the function be returned as a character string (default) or language object
#' @return list; list of function names only if `info` is FALSE, otherwise a list of names, function bodies and lengths
#' @export
list_functions <- function(pkg = ".", info = FALSE, character = TRUE) {
  pkg <- devtools::as.package(pkg)
  fun_list <- as.list(lsf.str(paste0("package:", pkg$package)))
  if (info) {
    lapply(fun_list, function_info)
  } else {
    list_to_function_list(fun_list)
  }
}

function_info <- function(.f) {
  if (is.character(.f)) {
    f_name <- .f
  } else if (is.function(.f)) {
    f_name <- substitute(.f)
  } else {
    stop(".f must be a character string or function")
  }
  f_body <- function_body(.f)
  f_length <- function_length(function_body(.f, character = TRUE))
  list(name = f_name,
       body = f_body,
       length = f_length)

}

#' Get the body of a function
#'
#' This wraps around the [`functionBody()`] function to return a list containg the function name and body
#'
#' @param .f character/function; function object or character string of the function name
#' @param character logical; whether to return the body of the function as a vector of character strings with (roughly) one line per entry (TRUE)
#'  or as a language object (FALSE, default). Returning a character object is only really useful to understand function length,
#'  it is not useful for understanding the content.
#' @return character/language; body of the function as a language or character object depending on
#' `character`
#' @examples
#' function_body(function_body)
#' function_body("function_body", character = TRUE)
#' @export
function_body <- function(.f, character = FALSE) {
  if (character) {
    language_to_character(functionBody(.f))
  } else {
    functionBody(.f)
  }

}

#' Approximate the length of a function
#'
#' Returns an estimation of the length of a function (in number of lines)
#' @param body character; function body as a character vector that has already been passed to the [`language_to_character()`] function
#' @return numeric; length as number
#' @export
function_length <- function(body) {
  if (!is.character(body)) {
    warning("body of the function is not character, the output may not be reflective of the function length")
  }
  length(body)
}


