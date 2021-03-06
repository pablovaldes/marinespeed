% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kfold.R
\name{kfold_occurrence_background}
\alias{kfold_occurrence_background}
\title{Create k folds of occurrence and background data for cross-validation}
\usage{
kfold_occurrence_background(occurrence_data, background_data,
  occurrence_fold_type = "disc", k = 5, pwd_sample = TRUE, lonlat = TRUE,
  background_buffer = 200*1000)
}
\arguments{
\item{occurrence_data}{Dataframe. Occurrence points of the species, the first
column should be the scientific name of the species followed by two columns
representing the longitude and latitude (or x,y coordinates if \code{lonlat
= FALSE}).}

\item{background_data}{Dataframe. Background data points, the first column is
a dummy column followed by two columns representing the longitude and
latitude (or x,y coordinates if \code{lonlat = FALSE}).}

\item{occurrence_fold_type}{Character vector. How occurrence folds should be
generated, currently \code{"disc"} (see \code{\link{kfold_disc}}),
\code{"grid"} (see \code{\link{kfold_grid}}) and \code{"random"} are
supported.}

\item{k}{Integer. The number of folds (partitions) that have to be created.
By default 5 folds are created.}

\item{pwd_sample}{Logical. Whether backgound points should be picked by doing
pair-wise distance sampling (see \code{\link[dismo]{pwdSample}}). It is
recommended to install the FNN package if you want to do pair-wise distance
sampling.}

\item{lonlat}{Logical. If \code{TRUE} (default) then Great Circle distances
are calculated else if \code{FALSE} Euclidean (planar) distances are
calculated.}

\item{background_buffer}{Positive numeric. Distance in meters around species
test points where background data should be excluded from. Use \code{NA} or
a negative number to disable background point filtering.}
}
\value{
A list with 2 dataframes, \code{occurrence} and \code{background},
  with as first column the scientifc name or \code{"background"} and k
  columns containing \code{TRUE}, \code{FALSE} or \code{NA}.
}
\description{
\code{kfold_occurrence_background} creates a k-fold partitioning of
occurrence and background data for cross-validation using random and
stratified folds. Returns a list with the occurrence folds and the background
folds, folds are represented as TRUE/FALSE/NA columns of a dataframe, 1
column for each fold.
}
\details{
Note that which and how many background points get selected in each
  fold depends on the \code{fold_type}, \code{pwd_sample} and the
  \code{background_buffer} and whether \code{pwd_sample} is \code{TRUE} or
  \code{FALSE}, even leading in some cases to the selection of no background
  data. Background points that are neither selected for the training fold nor
  for the test fold are set to \code{NA} in the background folds. Random
  assignment of background points to the folds can be achieved by setting
  \code{pwd_sample} to \code{FALSE} and \code{background_buffer} to 0. Note
  also that when \code{pwd_sample} is \code{TRUE}, the same background point
  might be assigned to different folds.
}
\examples{
set.seed(42)
occurrence_data <- data.frame(species = rep("Abalistes stellatus", 50),
                              longitude = runif(50, -180, 180),
                              latitude = runif(50, -90, 90))

# REMARK: this is NOT how you would want to create random background point.
# Use special functions for this like dismo::randomPoints, especially for
# lonlat data
background_data <- data.frame(species = rep("background", 500),
                              longitude = runif(500, -180, 180),
                              latitude = runif(500, -90, 90))
disc_folds <- kfold_occurrence_background(occurrence_data, background_data,
                                          "disc")
random_folds <- kfold_occurrence_background(occurrence_data, background_data,
                                            "random", pwd_sample = FALSE,
                                            background_buffer = NA)

}
\references{
Hijmans, R. J. (2012). Cross-validation of species distribution
  models: removing spatial sorting bias and calibration with a null model.
  Ecology, 93(3), 679-688. doi:10.1890/11-0826.1 Radosavljevic, A., &
  Anderson, R. P. (2013). Making better Maxent models of species
  distributions: complexity, overfitting and evaluation. Journal of
  Biogeography. doi:10.1111/jbi.12227
}
\seealso{
\code{\link{lapply_kfold_species}}, \code{\link{kfold_disc}},
  \code{\link{kfold_grid}}, \code{\link{geographic_filter}}
  \code{\link[dismo]{pwdSample}}, \code{\link[dismo]{kfold}}
}

