#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today and FALSE
#' otherwise
#'
#' @param team.name The name of your team
#' @return Logical \code{TRUE} if \code{team.name} has a NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team.name} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")

gday = function(team.name){

  url = paste0("http://live.nhle.com/GameData/GCScoreboard/", Sys.Date(),
          ".jsonp")
  grepl(team.name, getURL(url), ignore.case=T)


}

