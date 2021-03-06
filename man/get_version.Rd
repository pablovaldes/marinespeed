% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load.R
\name{get_version}
\alias{get_version}
\title{Get MarineSPEED version}
\usage{
get_version()
}
\value{
Character with the current version ("V1") or another version if the
  \code{marinespeed_version} has been set.
}
\description{
\code{get_version} returns the currently used MarineSPEED version, this can
be changed by setting \code{options(marinespeed_version="<version
information>")}.
}
\examples{
print(get_version())

}

