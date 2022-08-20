#' Get list of errors from Google Error Reporting
#'
#' @param project_id the project ID of your project on GCP
#' @param api_key an API key with permissions to write to Google Error Reporting
#' @param message the error report to be written out to the
#'
#' @return No return, we focus on side effect
list_errors <- function(project_id) {


 # Authenticating with OAuth 2.0 should be possible with:
 # library(googleAuthR)
 # options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/cloud-platform")


  base_url <- "https://clouderrorreporting.googleapis.com/v1beta1/"
  project_name <- paste0("projectName=projects/", project_id, "/events")
  project_name <- paste0(project_id, "/events")
  project_name <- paste0("projects/", project_id, "/events")

  url <- paste0(base_url, project_name)

  httr::GET(url)
}

