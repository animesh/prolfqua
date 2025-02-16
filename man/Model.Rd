% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Model.R
\name{Model}
\alias{Model}
\title{R6 class representing modelling result}
\description{
R6 class representing modelling result

R6 class representing modelling result
}
\examples{



istar <- prolfqua_data('data_ionstar')$normalized()
istar$config <- old2new(istar$config)
istar_data <- dplyr::filter(istar$data ,protein_Id \%in\% sample(protein_Id, 100))
modelName <- "f_condtion_r_peptide"
formula_randomPeptide <-
  strategy_lmer("transformedIntensity  ~ dilution. + (1 | peptide_Id)",
   model_name = modelName)
pepIntensity <- istar_data
config <- istar$config
config$table$hierarchy_keys_depth()
mod <- prolfqua::build_model(
 pepIntensity,
 formula_randomPeptide,
 modelName = modelName,
 subject_Id = config$table$hierarchy_keys_depth())

mod$modelDF
aovtable  <- mod$get_anova()
mod$get_coefficients()
mod$coef_histogram()
mod$coef_volcano()
mod$coef_pairs()
mod$anova_histogram()

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
\code{\link{build_model}()},
\code{\link{contrasts_fisher_exact}()},
\code{\link{get_anova_df}()},
\code{\link{get_complete_model_fit}()},
\code{\link{get_imputed_contrasts}()},
\code{\link{get_p_values_pbeta}()},
\code{\link{isSingular_lm}()},
\code{\link{linfct_all_possible_contrasts}()},
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
\section{Super class}{
\code{\link[prolfqua:ModelInterface]{prolfqua::ModelInterface}} -> \code{Model}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{modelDF}}{data.frame with modelling data and model.}

\item{\code{modelName}}{name of model}

\item{\code{subject_Id}}{e.g. protein_Id}

\item{\code{model_strategy}}{function to create the models}

\item{\code{anova_df}}{function to compute anova}

\item{\code{p.adjust}}{function to adjust p-values}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Model-new}{\code{Model$new()}}
\item \href{#method-Model-get_coefficients}{\code{Model$get_coefficients()}}
\item \href{#method-Model-get_anova}{\code{Model$get_anova()}}
\item \href{#method-Model-write_coefficients}{\code{Model$write_coefficients()}}
\item \href{#method-Model-coef_histogram}{\code{Model$coef_histogram()}}
\item \href{#method-Model-coef_volcano}{\code{Model$coef_volcano()}}
\item \href{#method-Model-coef_pairs}{\code{Model$coef_pairs()}}
\item \href{#method-Model-anova_histogram}{\code{Model$anova_histogram()}}
\item \href{#method-Model-write_anova_figures}{\code{Model$write_anova_figures()}}
\item \href{#method-Model-write_coef_figures}{\code{Model$write_coef_figures()}}
\item \href{#method-Model-clone}{\code{Model$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-new"></a>}}
\if{latex}{\out{\hypertarget{method-Model-new}{}}}
\subsection{Method \code{new()}}{
initialize
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$new(
  modelDF,
  model_strategy,
  modelName,
  subject_Id = "protein_Id",
  p.adjust = prolfqua::adjust_p_values
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{modelDF}}{dataframe with modelling results}

\item{\code{model_strategy}}{model_strategy see \code{\link{strategy_lmer}}}

\item{\code{modelName}}{name of model}

\item{\code{subject_Id}}{subject column name}

\item{\code{p.adjust}}{method to adjust p-values}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-get_coefficients"></a>}}
\if{latex}{\out{\hypertarget{method-Model-get_coefficients}{}}}
\subsection{Method \code{get_coefficients()}}{
return model coefficient table
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$get_coefficients()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-get_anova"></a>}}
\if{latex}{\out{\hypertarget{method-Model-get_anova}{}}}
\subsection{Method \code{get_anova()}}{
return anova table
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$get_anova()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-write_coefficients"></a>}}
\if{latex}{\out{\hypertarget{method-Model-write_coefficients}{}}}
\subsection{Method \code{write_coefficients()}}{
writes model coefficients to file
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$write_coefficients(path, format = "xlsx")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{path}}{folder to write to}

\item{\code{format}}{default xlsx \code{\link{lfq_write_table}}}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-coef_histogram"></a>}}
\if{latex}{\out{\hypertarget{method-Model-coef_histogram}{}}}
\subsection{Method \code{coef_histogram()}}{
histogram of model coefficient
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$coef_histogram()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-coef_volcano"></a>}}
\if{latex}{\out{\hypertarget{method-Model-coef_volcano}{}}}
\subsection{Method \code{coef_volcano()}}{
volcano plot of non intercept coefficients
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$coef_volcano()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-coef_pairs"></a>}}
\if{latex}{\out{\hypertarget{method-Model-coef_pairs}{}}}
\subsection{Method \code{coef_pairs()}}{
pairs-plot of coefficients
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$coef_pairs()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-anova_histogram"></a>}}
\if{latex}{\out{\hypertarget{method-Model-anova_histogram}{}}}
\subsection{Method \code{anova_histogram()}}{
histogram of ANOVA results
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$anova_histogram(what = c("p.value", "FDR"))}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{what}}{show either "Pr..F." or "FDR.Pr..F."}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-write_anova_figures"></a>}}
\if{latex}{\out{\hypertarget{method-Model-write_anova_figures}{}}}
\subsection{Method \code{write_anova_figures()}}{
write figures related to ANOVA into pdf file
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$write_anova_figures(path, width = 10, height = 10)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{path}}{folder name}

\item{\code{width}}{figure width}

\item{\code{height}}{figure height}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-write_coef_figures"></a>}}
\if{latex}{\out{\hypertarget{method-Model-write_coef_figures}{}}}
\subsection{Method \code{write_coef_figures()}}{
write figures related to Coefficients into pdf file
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$write_coef_figures(path, width = 10, height = 10)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{path}}{folder name}

\item{\code{width}}{figure width}

\item{\code{height}}{figure height}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Model-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Model-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Model$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
