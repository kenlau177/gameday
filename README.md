**This repository contains the game day package.**

**How to Install Package** First install devtools if you don't already
have it. Then type in R,

    library(devtools)

    ## Warning: package 'devtools' was built under R version 3.1.2

    install_github("kenlau177/gameday")
    library(gameday)

**How it works**

There are 2 functions in this package: -**gday**: Determines whether an
NHL team has a game given the day -**scores**: Presents information of
all the games and scores for a particular day.

You can view the documentations of these two functions by: - ?gday -
?scores

Examples:

    gday(team="Canucks", gDate="2014-11-19")

    ## [1] TRUE

    scores(gDate="2014-11-16")

    ##                  home               away home_score away_score
    ## 1 CAROLINA HURRICANES    SAN JOSE SHARKS          0          2
    ## 2      MINNESOTA WILD      WINNIPEG JETS          4          3
    ## 3   DETROIT RED WINGS MONTREAL CANADIENS          1          4
    ## 4  CHICAGO BLACKHAWKS       DALLAS STARS          6          2
    ## 5       ANAHEIM DUCKS   FLORIDA PANTHERS          2          6
    ## 6     EDMONTON OILERS    ARIZONA COYOTES          1          2

See the
[Vignette](https://github.com/kenlau177/gameday/blob/master/vignettes/overview.md)
