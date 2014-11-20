#' Is there internet connection?
#'
#' This function returns TRUE if there is internet connection, otherwise it
#' returns FALSE
#'
#' @return Logical \code{TRUE} if there is internet connection,
#' \code{FALSE} otherwise
#' @note This is a helper function for gday.
#'
#' @examples
#' internet_connection()

internet_connection = function(){
  tryCatch({RCurl::getURL("www.google.com"); TRUE},
    error = function(err) FALSE)
}


