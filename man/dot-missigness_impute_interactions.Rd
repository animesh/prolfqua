% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidyMS_missigness.R
\name{.missigness_impute_interactions}
\alias{.missigness_impute_interactions}
\title{Compute interaction averages and
impute data using mean of lowest 0.1 (default)}
\usage{
.missigness_impute_interactions(
  pdata,
  config,
  factors = config$table$factor_keys_depth(),
  probs = 0.1,
  global = TRUE
)
}
\arguments{
\item{pdata}{data.frame}

\item{config}{AnalysisConfiguration}

\item{factors}{factor to include (default up to factor depth)}

\item{probs}{quantile to take average from (default 0.1)}

\item{global}{global min value}
}
\value{
function with parameter `value`
`c("long", "nrReplicates", "nrMeasured", "meanAbundance", "imputed", "allWide", "all")`

function
}
\description{
used in Acetylation project p2916
}
\examples{

istar <- sim_lfq_data_peptide_config()
config <- istar$config
analysis <- istar$data
config$parameter$qVal_individual_threshold <- 0.01

xx <- prolfqua::remove_large_QValues(analysis, config)
xx <- complete_cases(xx, config)
nrPepTimesDilution <- length(unique(paste0(xx$protein_Id, xx$peptide_Id))) *
    length(unique(xx$dilution.))
tmp <- interaction_missing_stats(xx, config)
fun <- .missigness_impute_interactions(xx, config)

long <- fun("long")
alldata <- fun("all")
stopifnot(length(names(alldata)) == 5)

imputed <- fun("imputed")
stopifnot(nrow(imputed) == length(unique(paste0(xx$protein_Id, xx$peptide_Id))))
missing <- fun("nrMeasured")
stopifnot(nrow(missing) == length(unique(paste0(xx$protein_Id, xx$peptide_Id))))

 meanAbundance <- fun("mean")
stopifnot(nrow(meanAbundance) == length(unique(paste0(xx$protein_Id, xx$peptide_Id))))
 stopifnot(sum(is.na(imputed$mean.imp.group_A))==0)

}
\keyword{internal}
