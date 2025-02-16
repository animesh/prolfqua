% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidyMSFragger.R
\name{tidy_FragPipe_psm}
\alias{tidy_FragPipe_psm}
\title{read psm.tsv produced by FragPipe and convert into long format}
\usage{
tidy_FragPipe_psm(
  psm_file,
  purity_threshold = 0.5,
  PeptideProphetProb = 0.9,
  abundance_threshold = 0
)
}
\arguments{
\item{psm_file}{path to psm.tsv file}

\item{purity_threshold}{purity threshold default = 0.5}

\item{PeptideProphetProb}{default 0.9}
}
\description{
read psm.tsv produced by FragPipe and convert into long format
}
