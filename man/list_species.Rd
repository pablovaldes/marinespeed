% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load.R
\name{list_species}
\alias{list_species}
\title{List species}
\usage{
list_species()
}
\description{
\code{list_species} returns a dataframe with all the species names and their
WoRMS identifier (\code{aphia_id}).
}
\details{
If the file with the list of species is not present on the hard disk
  then it is downloaded and stored in the data directory. The data directory
  can be set with \code{options(marinespeed_datadir = ".")}. By default data
  is downloaded to \code{tempdir()}.
}
\examples{
species <- list_species()
head(species)

}
\seealso{
\code{\link{lapply_kfold_species}}, \code{\link{lapply_species}},
  \code{\link{get_fold_data}}, \code{\link{get_occurrences}},
  \code{\link{species_traits}}
}

