% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidyMS_R6_Modelling.R
\name{linfct_all_possible_contrasts}
\alias{linfct_all_possible_contrasts}
\title{create all possible contrasts}
\usage{
linfct_all_possible_contrasts(lin_int)
}
\description{
create all possible contrasts
}
\examples{
m <- prolfqua_data('data_basicModel_p1807')
m
linfct <- linfct_from_model(m)

xl <- prolfqua::linfct_all_possible_contrasts(linfct$linfct_factors)
xx <- prolfqua::linfct_all_possible_contrasts(linfct$linfct_interactions)

}
\seealso{
Other modelling: 
\code{\link{ContrastsMissing}},
\code{\link{ContrastsModerated}},
\code{\link{ContrastsPlotter}},
\code{\link{ContrastsProDA}},
\code{\link{ContrastsROPECA}},
\code{\link{ContrastsSAINTexpress}},
\code{\link{ContrastsTable}},
\code{\link{Contrasts}},
\code{\link{INTERNAL_FUNCTIONS_BY_FAMILY}},
\code{\link{LR_test}()},
\code{\link{Model}},
\code{\link{build_model}()},
\code{\link{contrasts_fisher_exact}()},
\code{\link{get_anova_df}()},
\code{\link{get_complete_model_fit}()},
\code{\link{get_imputed_contrasts}()},
\code{\link{get_p_values_pbeta}()},
\code{\link{isSingular_lm}()},
\code{\link{linfct_factors_contrasts}()},
\code{\link{linfct_from_model}()},
\code{\link{linfct_matrix_contrasts}()},
\code{\link{merge_contrasts_results}()},
\code{\link{model_analyse}()},
\code{\link{model_summary}()},
\code{\link{moderated_p_limma_long}()},
\code{\link{moderated_p_limma}()},
\code{\link{my_contest}()},
\code{\link{my_contrast_V1}()},
\code{\link{my_contrast_V2}()},
\code{\link{my_contrast}()},
\code{\link{my_glht}()},
\code{\link{pivot_model_contrasts_2_Wide}()},
\code{\link{plot_lmer_model_and_data}()},
\code{\link{plot_lmer_peptide_noRandom}()},
\code{\link{plot_lmer_peptide_predictions}()},
\code{\link{plot_lmer_predicted_interactions}()},
\code{\link{strategy_lmer}()},
\code{\link{summary_ROPECA_median_p.scaled}()}
}
\concept{modelling}
\keyword{internal}
