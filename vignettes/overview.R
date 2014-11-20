## ------------------------------------------------------------------------
todayDate = as.Date("2014-11-19")
endDate = as.Date("2014-12-19")
# generate sequence of dates per day from today's date to next month
monthDates = strftime(seq(from=todayDate, to=endDate, by="day"))
# signify who your favourite team is
favouriteTeam = "Canucks"
# vector of booleans giving whether the team plays for each day
boolDates = unlist(lapply(monthDates, FUN=gday, team=favouriteTeam))
# returns a vector of dates of when your team will be playing in the next month
monthDates[boolDates]

## ------------------------------------------------------------------------
library(plyr)
library(dplyr)
library(ggplot2)

todayDate = as.Date("2014-11-19")
# Note that this is one month back from today's date
endDate = as.Date("2014-10-19")
favouriteTeam = "Canucks"
boolDates = unlist(lapply(monthDates, FUN=gday, team=favouriteTeam))
# returns a vector of dates of when your team will be playing in the next month
scoreDays = monthDates[boolDates]
scoresDf = ldply(scoreDays, .fun=scores)
homeScores = scoresDf %>% select(home, home_score) %>%
              filter(grepl(favouriteTeam, home, ignore.case=T)) %>%
              select(home_score)
homeAvg = mean(homeScores[,1])
awayScores = scoresDf %>% select(away, away_score) %>% 
              filter(grepl(favouriteTeam, away, ignore.case=T)) %>% 
              select(away_score)
awayAvg = mean(awayScores[,1])
ggData = data.frame("location"=c("home","away"), 
          "average_score"=c(homeAvg, awayAvg))
gg = ggplot(ggData, aes(x=location, y=average_score)) + 
      geom_bar(stat="identity", width=.5) + 
      ggtitle("Average scores")

## ----results='asis'------------------------------------------------------
gg

