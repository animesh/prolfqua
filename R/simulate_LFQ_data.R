.generate_random_string <- function(N, str_length) {
  random_string <- vector(mode = "character", length = N)
  digits <- 0:9
  for (i in seq_len(N)) {
    random_string[i] <- paste0(sample(digits, str_length, replace = TRUE), collapse = "")
  }
  return(random_string)
}


#' simulate protein level data with two groups
#' @export
#' @param Nprot number of porteins
#' @param N group size
#' @param fc D - down regulation N - matrix,  U -  regulation
#' @param prop proportion of down (D), up (U) and not regulated (N)
#' @examples
#'
#' sim_lfq_data(Nprot = 10)
#' res <- sim_lfq_data(Nprot = 10, PEPTIDE = TRUE)
sim_lfq_data <- function(
    Nprot = 20,
    N = 4,
    fc = list(A = c(D = -2,  U = 2, N = 0), B = c(D = 1, U = -4)),
    prop = list(A = c(D = 10, U = 10), B = c(D = 5, U = 20)),
    mean_prot = 20,
    sdlog = log(1.2),
    probability_of_success = 0.3,
    PEPTIDE = FALSE
) {


  proteins <- stringi::stri_rand_strings(Nprot, 6)
  idtype2 <- .generate_random_string(Nprot, 4)
  # simulate number of peptides per protein
  nrpeptides <- rgeom(n = Nprot, probability_of_success) + 1


  prot <- data.frame(
    proteinID = proteins,
    idtype2 = idtype2,
    nrPeptides = nrpeptides,
    average_prot_abundance = rlnorm(Nprot,log(20),sdlog = sdlog),
    mean_Ctrl = 0,
    N_Ctrl = N,
    sd = 1
  )

  for (i in seq_along(fc)) {
    name <- names(fc)[i]
    fcx <- fc[[i]]
    propx <- prop[[i]]
    if (!"N" %in% names(fcx)) {
      fcx["N"] <- 0
    }
    if (!"N" %in% names(propx)) {
      propx["N"] <- 100 - sum(propx)
    }

    FC = rep(fcx, ceiling(propx / 100 * Nprot)) |> head(n = Nprot)

    # add regulation to group A.
    groupMean <- paste0("mean_", name)
    groupSize <- paste0("N_", name)
    prot <- prot |> dplyr::mutate(!!groupMean := FC, !!groupSize := N)
  }

  if (PEPTIDE) {

    # add row for each protein
    peptide_df <- prot |> tidyr::uncount( nrPeptides )
    # create peptide ids
    peptide_df$peptideID <- stringi::stri_rand_strings(sum(prot$nrPeptides), 8)
  } else {
    peptide_df <- prot
  }


  # transform into long format
  peptide_df2 <- peptide_df |> tidyr::pivot_longer(cols = tidyselect::starts_with(c("mean", "N_")),
                                                   names_to = "group" , values_to = "mean")
  peptide_df2 <-  peptide_df2 |> tidyr::separate(group, c("what", "group"))
  peptide_df2 <- peptide_df2 |> tidyr::pivot_wider(names_from = "what", values_from = mean)

  sample_from_normal <- function(mean, sd, n) {
    rnorm(n, mean, sd)
  }
  nrpep <- nrow(peptide_df2)
  sampled_data <- matrix(nrow = nrpep, ncol = N)
  colnames(sampled_data) <- paste0("V", 1:ncol(sampled_data))

  peptide_df2$average_prot_abundance <- peptide_df2$average_prot_abundance - peptide_df2$mean

  if (PEPTIDE) {
    peptide_df2$avg_peptide_abd <-
      with(peptide_df2,
           rlnorm(nrow(peptide_df2),
                  meanlog = log(average_prot_abundance),
                  sdlog = sdlog))
    for (i in seq_len(nrpep)) {
      sampled_data[i,] <- sample_from_normal(peptide_df2$avg_peptide_abd[i], peptide_df2$sd[1], peptide_df2$N[i])
    }

  } else {
    for (i in seq_len(nrpep)) {
      sampled_data[i,] <- sample_from_normal(peptide_df2$average_prot_abundance[i], peptide_df2$sd[1], peptide_df2$N[i])
    }
  }

  x <- dplyr::bind_cols(peptide_df2,sampled_data)

  peptideAbudances <- x |>
    tidyr::pivot_longer(
      tidyselect::starts_with("V"),
      names_to = "Replicate",
      values_to = "abundance")
  peptideAbundances <- peptideAbudances |>
    tidyr::unite("sample", group, Replicate, remove =  FALSE)
  return(peptideAbundances)
}


#' add missing values to x vector based on the values of x
#' @export
#' @param x vector of intensities
#'
#'
add_missing <- function(x){
  missing_prop <- pnorm(x, mean = mean(x), sd = sd(x))
  # sample TRUE or FALSE with propability in missing_prop
  samplemiss <- function(missing_prop) {
    mp <- c((1 - missing_prop)*0.2, missing_prop*3)
    mp <- mp / sum(mp)
    sample(c(TRUE, FALSE), size = 1, replace = TRUE, prob = mp)
  }

  missing_values <- sapply(missing_prop, samplemiss)
  # Introduce missing values into the vector x
  x[missing_values] <- NA
  return(x)
}


#' Simulate data, protein and peptide, with config
#' @param description Nprot number of proteins
#' @param with_missing add missing values, default TRUE
#' @param seed seed for reproducibility, if NULL no seed is set.
#' @export
#' @examples
#'
sim_lfq_data_peptide_config <- function(Nprot = 10, with_missing = TRUE, seed = 1234){
  if (!is.null(seed)) {
    set.seed(seed)
  }
  data <- sim_lfq_data(Nprot = Nprot, PEPTIDE = TRUE)
  if (with_missing) {
    data$abundance <- add_missing(data$abundance)
  }
  data$isotopeLabel <- "light"
  data$qValue <- 0

  atable <- AnalysisTableAnnotation$new()
  atable$sampleName = "sample"
  atable$factors["group_"] = "group"
  atable$hierarchy[["protein_Id"]] = c("proteinID", "idtype2")
  atable$hierarchy[["peptide_Id"]] = "peptideID"
  atable$set_response("abundance")

  config <- AnalysisConfiguration$new(atable)
  adata <- setup_analysis(data, config)
  return(list(data = adata, config = config))
}
#' Simulate data, protein, with config
#' @param description Nprot number of proteins
#' @param with_missing add missing values, default TRUE
#' @param seed seed for reproducibility, if NULL no seed is set.
#' @export
#' @examples
#'
sim_lfq_data_protein_config <- function(Nprot = 10, with_missing = TRUE, seed = 1234){
  if (!is.null(seed)) {
    set.seed(seed)
  }
  data <- sim_lfq_data(Nprot = Nprot, PEPTIDE = FALSE)
  if (with_missing) {
    data$abundance <- add_missing(data$abundance)
  }
  data$isotopeLabel <- "light"
  data$qValue <- 0

  atable <- AnalysisTableAnnotation$new()
  atable$sampleName = "sample"
  atable$factors["group_"] = "group"
  atable$hierarchy[["protein_Id"]] = c("proteinID", "idtype2")
  atable$set_response("abundance")

  config <- AnalysisConfiguration$new(atable)
  adata <- setup_analysis(data, config)
  return(list(data = adata, config = config))
}

