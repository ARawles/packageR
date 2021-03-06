% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/files.R
\name{list_r_files}
\alias{list_r_files}
\title{List R files in a package}
\usage{
list_r_files(pkg = ".", ext = ".[Rr]$")
}
\arguments{
\item{pkg}{The package to use, can be a file path to the package or a
package object.  See [devtools::as.package()] for more information.}

\item{ext}{character; regular expression for the file extension to look for. Default is to include .r and .R files.}
}
\value{
vector; vector of file paths
}
\description{
Lists all files in a package directory with the .R or .r extension.
}
