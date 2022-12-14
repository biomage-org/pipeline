% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qc-1-filter_emptydrops.R
\name{filter_emptydrops}
\alias{filter_emptydrops}
\title{Filter empty droplets}
\usage{
filter_emptydrops(
  scdata_list,
  config,
  sample_id,
  cells_id,
  task_name = "classifier",
  num_cells_to_downsample = 6000
)
}
\arguments{
\item{config}{list containing the following information
- enable: true/false. Refering to apply or not the filter.
- auto: true/false. 'True' indicates that the filter setting need to be changed depending on some sensible value (it requires
to call generate_default_values_mitochondrialContent)
- filterSettings: slot with thresholds
- method: String. Method to be used {absoluteThreshold}
- methodSettings: List with the method as key and contain all the filterSettings for this specific method.
* absoluteThreshold: based on a cut-off threshold
- maxFraction: Float. maximun pct MT-content that we considere for a alive cell
- binStep: Float. Bin size for the histogram
* we are supposed to add more methods ....}
}
\value{
a list with the filtered seurat object by mitochondrial content, the config and the plot values
}
\description{
filters seurat objects based on edrops scores.
}
