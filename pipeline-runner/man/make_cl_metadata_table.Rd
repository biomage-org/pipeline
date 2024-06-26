% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qc-7-embed_and_cluster.R
\name{make_cl_metadata_table}
\alias{make_cl_metadata_table}
\title{make cell-level metadata - cell_ids table}
\usage{
make_cl_metadata_table(cl_metadata, barcode_cell_id_map)
}
\arguments{
\item{cl_metadata}{data.table with cell-level metadata}

\item{barcode_cell_ids}{data.table of barcodes, cell_ids and samples from scdata}
}
\value{
data.table of cell_ids and cell-level metadata
}
\description{
Joins user supplied tsv file with the barcode-cell_id map, so that each cell_id
is assigned to the corresponding values of the cell-level metadata variables
provided.
}
\details{
If a samples column is available, join is performed using the primary key
samples + barcode, to avoid duplicated barcodes.
}
