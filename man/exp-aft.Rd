% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distributions.R
\name{exp-aft}
\alias{exp-aft}
\alias{exp_aft_log_density}
\alias{exp_aft_log_hazard}
\alias{exp_aft_log_survival}
\alias{exp_aft_density}
\alias{exp_aft_hazard}
\alias{exp_aft_survival}
\alias{exp_aft_mean}
\alias{exp_aft_sd}
\alias{exp_aft_r}
\alias{exp_aft_q}
\alias{exp_aft_p}
\title{Exponential AFT parametric family.}
\usage{
exp_aft_log_density(t, eta)

exp_aft_log_hazard(t, eta)

exp_aft_log_survival(t, eta)

exp_aft_density(t, eta)

exp_aft_hazard(t, eta)

exp_aft_survival(t, eta)

exp_aft_mean(eta)

exp_aft_sd(eta)

exp_aft_r(n, eta)

exp_aft_q(p, eta)

exp_aft_p(q, eta)
}
\arguments{
\item{t}{vector of survival times}

\item{eta}{linear predictor}

\item{n}{number of observations}

\item{p}{vector of probabilities}

\item{q}{vector of quantiles}
}
\value{
\code{exp_aft_density}, \code{exp_aft_hazard}, and
\code{exp_aft_survival} return the density, hazard, and survival
of the specified survival distribution. The \code{exp_aft_log_density},
\code{exp_aft_log_hazard}, \code{exp_aft_log_survival} return log of
the corresponding qualities. \code{exp_aft_mean} and \code{exp_aft_sd}
return the mean and standard deviation of the specified survival distribution.
\code{exp_aft_r}, \code{exp_aft_q}, and \code{exp_aft_p} return a random
generation, quantiles, and cumulative probabilities of the specified
survival distribution.
}
\description{
(log) density, hazard, and survival
functions for AFT exponential parametric family.
}
