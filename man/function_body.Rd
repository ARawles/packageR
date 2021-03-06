% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{function_body}
\alias{function_body}
\title{Get the body of a function}
\usage{
function_body(.f, character = FALSE)
}
\arguments{
\item{.f}{character/function; function object or character string of the function name}

\item{character}{logical; whether to return the body of the function as a vector of character strings with (roughly) one line per entry (TRUE)
or as a language object (FALSE, default). Returning a character object is only really useful to understand function length,
it is not useful for understanding the content.}
}
\value{
character/language; body of the function as a language or character object depending on
`character`
}
\description{
This wraps around the [`functionBody()`] function to return a list containg the function name and body
}
\examples{
function_body(function_body)
function_body("function_body", character = TRUE)
}
