% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qc-7-embed_and_cluster.R
\name{find_group_columns_cl_metadata}
\alias{find_group_columns_cl_metadata}
\title{Find group columns for cell-level metadata}
\usage{
find_group_columns_cl_metadata(cl_metadata)
}
\arguments{
\item{cl_metadata}{data.table}
}
\value{
vector of column names
}
\description{
Find columns that can be used to group cells with sample granularity in
cell-level metadata. The only requirement is that the column has the same
value for all cells in a sample.
}
