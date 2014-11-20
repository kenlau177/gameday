
#' NHL scores for a particular day
#'
#' This function returns the NHL scores for every game played on a given
#' day.
#'
#' @param gDate The game day in YYYY-mm-dd format.
#' @return data.frame The scores of every game played on the given day,
#' \code{gDate}. If no games are played on that day, then return an empty
#' \code{data.frame}
#' @export
#' @examples
#' scores("2014-10-03")
#' scores("2014-07-10")

scores = function(gDate){

  assertthat::assert_that(internet_connection())
  assertthat::assert_that(check_date(gDate))

  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
            gDate, '.jsonp')
  raw <- RCurl::getURL(url)

  if(grepl("404 Not Found", raw, ignore.case=T)){
    return(data.frame())
  }

  json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
  data <- jsonlite::fromJSON(json)$games

  if(length(data) == 0){
    return(data.frame())
  }
  out = with(data,
          data.frame(home = paste(htn, htcommon),
            away = paste(atn, atcommon),
            home_score = hts,
            away_score = ats))
  return(out)

}


