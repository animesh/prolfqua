% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidyMS_plotting.R
\name{plot_pca}
\alias{plot_pca}
\title{plot PCA}
\usage{
plot_pca(data, config, PC = c(1, 2), add_txt = FALSE, plotly = FALSE)
}
\description{
plot PCA
}
\examples{




istar <- sim_lfq_data_protein_config(with_missing = FALSE)
config <- istar$config
analysis <- istar$data
tmp <- plot_pca(analysis, config, add_txt= TRUE)
stopifnot("ggplot" \%in\% class(tmp) )
tmp <- plot_pca(analysis, config, add_txt= FALSE)
stopifnot("ggplot" \%in\% class(tmp) )
tmp
tmp <- plot_pca(analysis, config, PC = c(1,2))
stopifnot("ggplot" \%in\% class(tmp) )
tmp <- plot_pca(analysis, config, PC = c(2,40))
stopifnot(is.null(tmp))

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
\code{\link{plot_estimate}()},
\code{\link{plot_heatmap_cor}()},
\code{\link{plot_heatmap}()},
\code{\link{plot_hierarchies_add_quantline}()},
\code{\link{plot_hierarchies_boxplot_df}()},
\code{\link{plot_hierarchies_line_df}()},
\code{\link{plot_hierarchies_line}()},
\code{\link{plot_intensity_distribution_violin}()},
\code{\link{plot_raster}()},
\code{\link{plot_sample_correlation}()},
\code{\link{plot_screeplot}()}
}
\concept{plotting}
\keyword{internal}
