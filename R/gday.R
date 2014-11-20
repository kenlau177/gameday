#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today and FALSE
#' otherwise
#'
#' @param team The name of your team
#' @param gDate The day you want to check if the team plays
#' @return Logical \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored. If gDate is not in format of
#' YYYY-mm-dd, then return an error.
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")

gday = function(team = "Canucks", gDate = Sys.Date()){

  assertthat::assert_that(internet_connection())
  assertthat::assert_that(check_date(gDate))

  url = paste0("http://live.nhle.com/GameData/GCScoreboard/", gDate,
          ".jsonp")
  grepl(team, RCurl::getURL(url), ignore.case=T)

}


