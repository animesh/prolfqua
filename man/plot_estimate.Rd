% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidyMS_aggregation.R
\name{plot_estimate}
\alias{plot_estimate}
\title{Plot feature data and result of aggregation}
\usage{
plot_estimate(data, config, data_aggr, config_reduced, show.legend = FALSE)
}
\arguments{
\item{data}{data.frame before aggregation}

\item{config}{AnalyisConfiguration}

\item{data_aggr}{data.frame after aggregation}

\item{config_aggr}{AnalysisConfiguration of aggregated data}
}
\description{
Plot feature data and result of aggregation
}
\examples{

istar <- sim_lfq_data_peptide_config()
config <- istar$config
analysis <- istar$data

analysis <- prolfqua::transform_work_intensity(analysis, config, log2)
bbMed <- estimate_intensity(analysis, config, .func = medpolish_estimate_dfconfig)
tmpMed <- plot_estimate(analysis, config, bbMed$data, bbMed$config)
stopifnot("ggplot" \%in\% class(tmpMed$plots[[1]]))
stopifnot("ggplot" \%in\% class(tmpMed$plots[[2]]))

bbRob <- estimate_intensity(analysis, config, .func = rlm_estimate_dfconfig)
tmpRob <- plot_estimate(analysis, config, bbRob$data, bbRob$config)
stopifnot("ggplot" \%in\% class(tmpRob$plots[[1]]))
stopifnot("ggplot" \%in\% class(tmpRob$plots[[2]]))


}
\seealso{
Other plotting: 
\code{\link{ContrastsPlotter}},
\code{\link{INTERNAL_FUNCTIONS_BY_FAMILY}},
\code{\link{UpSet_interaction_missing_stats}()},
\code{\link{UpSet_missing_stats}()},
\code{\link{medpolish_estimate_df}()},
\code{\link{missigness_histogram}()},
\code{\link{missingness_per_condition_cumsum}()},
\code{\link{missingness_per_condition}()},
\code{\link{plot_NA_heatmap}()},
\code{\link{plot_heatmap_cor}()},
\code{\link{plot_heatmap}()},
\code{\link{plot_hierarchies_add_quantline}()},
\code{\link{plot_hierarchies_boxplot_df}()},
\code{\link{plot_hierarchies_line_df}()},
\code{\link{plot_hierarchies_line}()},
\code{\link{plot_intensity_distribution_violin}()},
\code{\link{plot_pca}()},
\code{\link{plot_raster}()},
\code{\link{plot_sample_correlation}()},
\code{\link{plot_screeplot}()}

Other aggregation: 
\code{\link{INTERNAL_FUNCTIONS_BY_FAMILY}},
\code{\link{aggregate_intensity_topN}()},
\code{\link{estimate_intensity}()},
\code{\link{intensity_summary_by_hkeys}()},
\code{\link{medpolish_estimate_dfconfig}()},
\code{\link{medpolish_estimate_df}()},
\code{\link{medpolish_estimate}()},
\code{\link{medpolish_protein_estimates}()},
\code{\link{plot_hierarchies_add_quantline}()},
\code{\link{plot_hierarchies_line_df}()},
\code{\link{plot_hierarchies_line}()},
\code{\link{rlm_estimate_dfconfig}()},
\code{\link{rlm_estimate}()}
}
\concept{aggregation}
\concept{plotting}
\keyword{internal}
