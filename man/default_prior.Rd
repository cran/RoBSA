% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check-input-and-settings.R
\name{default_prior}
\alias{default_prior}
\alias{get_default_prior_beta_null,}
\alias{get_default_prior_beta_alt,}
\alias{get_default_prior_factor_null,}
\alias{get_default_prior_factor_alt,}
\alias{get_default_prior_intercept,}
\alias{get_default_prior_aux}
\alias{get_default_prior_beta_null}
\alias{get_default_prior_beta_alt}
\alias{get_default_prior_factor_null}
\alias{get_default_prior_factor_alt}
\alias{get_default_prior_intercept}
\title{Default prior distributions}
\usage{
get_default_prior_beta_null()

get_default_prior_beta_alt()

get_default_prior_factor_null()

get_default_prior_factor_alt()

get_default_prior_intercept()

get_default_prior_aux()
}
\value{
\code{get_default_prior_beta_null} and \code{get_default_prior_beta_alt}
return a prior distribution and \code{get_default_prior_intercept} and
\code{get_default_prior_aux} return a list of prior distributions.
}
\description{
Functions for setting default prior distributions. Note that
these default prior distributions might (and probably won't) apply to your
specific data scenario.
}
