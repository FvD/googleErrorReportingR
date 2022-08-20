

.auth <- gargle::init_AuthState(
  package     = "googleErrorReportingR",
  auth_active = TRUE
  # app = NULL,
  # api_key = NULL,
  # cred = NULL
)

# Based on https://gargle.r-lib.org/articles/gargle-auth-in-client-package.html
error_report_auth <- function(path = NULL,
                       scopes = "https://www.googleapis.com/auth/cloud-platform",
                       cache = gargle::gargle_oauth_cache(),
                       use_oob = gargle::gargle_oob_default()) {
  cred <- gargle::token_fetch(
    scopes = scopes,
    app = drive_oauth_app(),
    path = path,
    package = "googleErrorReportingR",
    cache = cache,
    use_oob = use_oob,
  )
  if (!inherits(cred, "Token2.0")) {
    warning("Unable to authenticate to GCP")
  }
  .auth$set_cred(cred)
  .auth$set_auth_active(TRUE)

  invisible()
}


error_report_auth(path = "secrets/ixplaza-ad362ada0233.json")

## get token

# googledrive::

# googledrive::
error_report_has_token <- function() {
  inherits(.auth$cred, "Token2.0")
}

error_report_token <- function() {
  if (isFALSE(.auth$auth_active)) {
    return(NULL)
  }
  if (!error_report_has_token()) {
    error_report_auth()
  }
  httr::config(token = .auth$cred)
}

error_report_token()

k# googleErrorRpoert

url <- https://clouderrorreporting.googleapis.com/v1beta1/projects/infraestructura-pruebas/events


req <- gargle::request_build(
  method = "GET",
  path = "/v1beta1/projects/infraestructura-pruebas/events",
  params = list("groupId"="COea_ObHzvfmtQE"),
  token = error_report_token(),
  base_url = "https://clouderrorreporting.googleapis.com"
)

gargle::request_make(req)

