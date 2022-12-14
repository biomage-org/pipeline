% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/init-functions.R
\name{load_config}
\alias{load_config}
\title{Load the pipeline step config}
\usage{
load_config(development_aws_server)
}
\arguments{
\item{development_aws_server}{}
}
\value{
list with config parameters
}
\description{
Waits for the activity ARN to be assigned. Once it is, it creates a config
list with pod, AWS, api, and debug information.
}
