% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary.RoBSA}
\alias{summary.RoBSA}
\title{Summarize fitted RoBSA object}
\usage{
\method{summary}{RoBSA}(
  object,
  type = "ensemble",
  conditional = FALSE,
  exp = FALSE,
  parameters = FALSE,
  probs = c(0.025, 0.975),
  logBF = FALSE,
  BF01 = FALSE,
  transform_factors = TRUE,
  short_name = FALSE,
  remove_spike_0 = FALSE,
  ...
)
}
\arguments{
\item{object}{a fitted RoBSA object.}

\item{type}{whether to show the overall RoBSA results (\code{"ensemble"}),
an overview of the individual models (\code{"models"}), or detailed summary
for the individual models (\code{"individual"}).}

\item{conditional}{show the conditional estimates (assuming that the
alternative is true). Defaults to \code{FALSE}. Only available for
\code{type == "conditional"}.}

\item{exp}{whether exponents of the regression estimates should be also presented}

\item{parameters}{character vector of parameters (or a
named list with of character vectors for summary and
diagnostics tables) specifying the parameters
(and their grouping) for the summary table}

\item{probs}{quantiles of the posterior samples to be displayed.
Defaults to \code{c(.025, .50, .975)}}

\item{logBF}{show log of the BFs. Defaults to \code{FALSE}.}

\item{BF01}{show BF in support of the null hypotheses. Defaults to
\code{FALSE}.}

\item{transform_factors}{Whether factors with orthonormal prior
distributions should be transformed to differences from the grand mean. Defaults
to \code{TRUE}.}

\item{short_name}{whether the prior distribution names should be
shortened. Defaults to \code{FALSE}.}

\item{remove_spike_0}{whether prior distributions equal to spike
at 0 should be removed from the \code{prior_list}}

\item{...}{additional arguments}
}
\value{
summary of a RoBSA object

\code{summary.RoBSA} returns a list of tables of class 'BayesTools_table'.
}
\description{
\code{summary.RoBSA} creates a numerical
summary of the RoBSA object.
}
\note{
See \code{\link[=diagnostics]{diagnostics()}} for visual convergence checks of the individual models.
}
\examples{
\dontrun{
# (execution of the example takes several minutes)
# example from the README (more details and explanation therein)
data(cancer, package = "survival")
priors <- calibrate_quartiles(median_t = 5, iq_range_t = 10, prior_sd = 0.5)
df <- data.frame(
  time         = veteran$time / 12,
  status       = veteran$status,
  treatment    = factor(ifelse(veteran$trt == 1, "standard", "new"), levels = c("standard", "new")),
  karno_scaled = veteran$karno / 100
)
RoBSA.options(check_scaling = FALSE)
fit <- RoBSA(
  Surv(time, status) ~ treatment + karno_scaled,
  data   = df,
  priors = list(
    treatment    = prior_factor("normal", parameters = list(mean = 0.30, sd = 0.15),
                                truncation = list(0, Inf), contrast = "treatment"),
    karno_scaled = prior("normal", parameters = list(mean = 0, sd = 1))
  ),
  test_predictors = "treatment",
  prior_intercept = priors[["intercept"]],
  prior_aux       = priors[["aux"]],
  parallel = TRUE, seed = 1
)

# summary can provide many details about the model
summary(fit)

# note that the summary function contains additional arguments
# that allow to obtain a specific output, i.e, the conditional estimates
# (assuming that the non-null models are true) can be obtained
summary(fit, conditional = TRUE)

# overview of the models and their prior and posterior probability, marginal likelihood,
# and inclusion Bayes factor:
summary(fit, type = "models")

# and the model diagnostics overview, containing maximum R-hat and minimum ESS across parameters
# but see '?diagnostics' for diagnostics plots for individual model parameters
summary(fit, type = "diagnostics")

# summary of individual models and their parameters can be further obtained by
summary(fit, type = "individual")

}

}
\seealso{
\code{\link[=RoBSA]{RoBSA()}}, \code{\link[=diagnostics]{diagnostics()}}, \code{\link[=check_RoBSA]{check_RoBSA()}}
}
