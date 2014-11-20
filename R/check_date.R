
#' Is the date format correct?
#'
#' This function returns TRUE if the input date is in the format YYYY-mm-dd
#'
#' @param gDate is a string corresponding to game day
#' @return Logical \code{TRUE} if \code{date} is in format YYYY-mm-dd,
#' otherwise, \code{FALSE}.
#' @examples
#' check_date("2014-11-07")
#' check_date("201-411-07")

check_date = function(gDate){

  tryCatch({as.Date(gDate); TRUE},
    error = function(err) FALSE)

}






