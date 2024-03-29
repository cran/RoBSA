% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot_prediction}
\alias{plot_prediction}
\alias{plot_survival}
\alias{plot_hazard}
\alias{plot_density}
\title{Survival plots for a RoBSA object}
\usage{
plot_prediction(
  x,
  type = "survival",
  time_range = NULL,
  new_data = NULL,
  predictor = NULL,
  covariates_data = NULL,
  conditional = FALSE,
  plot_type = "base",
  samples = 10000,
  ...
)

plot_survival(
  x,
  time_range = NULL,
  new_data = NULL,
  predictor = NULL,
  covariates_data = NULL,
  conditional = FALSE,
  plot_type = "base",
  samples = 10000,
  ...
)

plot_hazard(
  x,
  time_range = NULL,
  new_data = NULL,
  predictor = NULL,
  covariates_data = NULL,
  conditional = FALSE,
  plot_type = "base",
  samples = 10000,
  ...
)

plot_density(
  x,
  time_range = NULL,
  new_data = NULL,
  predictor = NULL,
  covariates_data = NULL,
  conditional = FALSE,
  plot_type = "base",
  samples = 10000,
  ...
)
}
\arguments{
\item{x}{a fitted RoBSA object.}

\item{type}{what type of prediction should be created}

\item{time_range}{a numeric of length two specifying the range for the
survival prediction. Defaults to \code{NULL} which uses the range of
observed times.}

\item{new_data}{a data.frame containing fully specified predictors for which
predictions should be made}

\item{predictor}{an alternative input to \code{new_data} that automatically
generates predictions for each level of the predictor across all either across
levels of covariates specified by \code{covariates_data} or at the default values
of other predictors}

\item{covariates_data}{a supplementary input to \code{predictor} that specifies
levels of covariates for which predictions should be made}

\item{conditional}{whether only models assuming presence of the specified
\code{predictor} should be used}

\item{plot_type}{whether to use a base plot \code{"base"}
or ggplot2 \code{"ggplot"} for plotting. Defaults to
\code{"base"}.}

\item{samples}{number of posterior samples to be evaluated}

\item{...}{additional arguments.}
}
\value{
returns either \code{NULL} if \code{plot_type = "base"}
or an object object of class 'ggplot2' if \code{plot_type = "ggplot2"}.
}
\description{
Survival plots for a RoBSA object
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

# plot survival for each level the treatment
plot_survival(fit, parameter = "treatment")

# plot hazard for each level the treatment
plot_hazard(fit, parameter = "treatment")

# plot density for each level the treatment
plot_density(fit, parameter = "treatment")
}

}
