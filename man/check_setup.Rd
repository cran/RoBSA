% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check-input-and-settings.R
\name{check_setup}
\alias{check_setup}
\title{Prints summary of \code{"RoBSA"} corresponding to the input}
\usage{
check_setup(
  formula,
  data,
  priors = NULL,
  test_predictors = NULL,
  distributions = c("exp-aft", "weibull-aft", "lnorm-aft", "llogis-aft", "gamma-aft"),
  distributions_weights = rep(1, length(distributions)),
  prior_beta_null = get_default_prior_beta_null(),
  prior_beta_alt = get_default_prior_beta_alt(),
  prior_factor_null = get_default_prior_factor_null(),
  prior_factor_alt = get_default_prior_factor_alt(),
  prior_intercept = get_default_prior_intercept(),
  prior_aux = get_default_prior_aux(),
  chains = 3,
  sample = 5000,
  burnin = 2000,
  adapt = 500,
  thin = 1,
  parallel = FALSE,
  autofit = TRUE,
  autofit_control = set_autofit_control(),
  convergence_checks = set_convergence_checks(),
  save = "all",
  seed = NULL,
  silent = FALSE,
  rescale_data = FALSE,
  models = FALSE,
  ...
)
}
\arguments{
\item{formula}{formula for the survival model}

\item{data}{data frame containing the data}

\item{priors}{names list of prior distributions for each
predictor. It allows users to specify both the null and alternative
hypothesis prior distributions by assigning a named list
(with \code{"null"} and \code{"alt"} object) to the predictor}

\item{test_predictors}{vector of predictor names
to be tested with Bayesian model-averaged testing.
Defaults to \code{NULL}, no parameters are tested.}

\item{distributions}{distributions of parametric
survival models}

\item{distributions_weights}{prior odds for the competing
distributions}

\item{prior_beta_null}{default prior distribution for the
null hypotheses of continuous predictors}

\item{prior_beta_alt}{default prior distribution for the
alternative hypotheses of continuous predictors}

\item{prior_factor_null}{default prior distribution for the
null hypotheses of categorical predictors}

\item{prior_factor_alt}{default prior distribution for the
alternative hypotheses of categorical predictors}

\item{prior_intercept}{named list containing prior
distribution for the intercepts (with names corresponding
to the distributions)}

\item{prior_aux}{named list containing prior
distribution for the auxiliary parameters (with names corresponding
to the distributions)}

\item{chains}{a number of chains of the MCMC algorithm.}

\item{sample}{a number of sampling iterations of the MCMC algorithm.
Defaults to \code{5000}.}

\item{burnin}{a number of burnin iterations of the MCMC algorithm.
Defaults to \code{2000}.}

\item{adapt}{a number of adaptation iterations of the MCMC algorithm.
Defaults to \code{500}.}

\item{thin}{a thinning of the chains of the MCMC algorithm. Defaults to
\code{1}.}

\item{parallel}{whether the individual models should be fitted in parallel.
Defaults to \code{FALSE}. The implementation is not completely stable
and might cause a connection error.}

\item{autofit}{whether the model should be fitted until the convergence
criteria (specified in \code{autofit_control}) are satisfied. Defaults to
\code{TRUE}.}

\item{autofit_control}{allows to pass autofit control settings with the
\code{\link[=set_autofit_control]{set_autofit_control()}} function. See \code{?set_autofit_control} for
options and default settings.}

\item{convergence_checks}{automatic convergence checks to assess the fitted
models, passed with \code{\link[=set_convergence_checks]{set_convergence_checks()}} function. See
\code{?set_convergence_checks} for options and default settings.}

\item{save}{whether all models posterior distributions should be kept
after obtaining a model-averaged result. Defaults to \code{"all"} which
does not remove anything. Set to \code{"min"} to significantly reduce
the size of final object, however, some model diagnostics and further
manipulation with the object will not be possible.}

\item{seed}{a seed to be set before model fitting, marginal likelihood
computation, and posterior mixing for reproducibility of results. Defaults
to \code{NULL} - no seed is set.}

\item{silent}{do not print the results.}

\item{rescale_data}{whether continuous predictors should be rescaled prior to
estimating the model. Defaults to \code{FALSE}.}

\item{models}{should the models' details be printed.}

\item{...}{additional arguments.}
}
\value{
\code{check_setup} invisibly returns list of summary tables.
}
\description{
\code{check_setup} prints summary of \code{"RoBSA"} ensemble
corresponding to the specified formula, data, and priors.
This function is useful for checking the ensemble configuration prior
to fitting all models.
}
\seealso{
\code{\link[=RoBSA]{RoBSA()}}
}
