% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handle_data.R
\name{cbind_cellset_type}
\alias{cbind_cellset_type}
\title{add cellset type column to cellsets data.table}
\usage{
cbind_cellset_type(dt, col)
}
\arguments{
\item{dt}{data.table}

\item{col}{string of corresponding cellset type}
}
\value{
data.table with cellset_type column
}
\description{
helper to correctly name the cellset type column. some cellsets already
contain a "type" slot, which complicates matters, so we chose \code{cellset_type},
}
