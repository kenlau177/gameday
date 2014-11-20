
#context("Check dates")

test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("always returns logical", {
  expect_is(gday("canucks"), "logical")
})

test_that("asking for the city works just as well", {
  expect_equal(gday("canucks"), gday("Vancouver"))
})

test_that("Seattle does not have a NHL team", {
  expect_false(gday(team="Seattle"))
})

test_that("The date format, '201-411-07' is not in the correct format", {
  expect_false(check_date("201-411-07"))
})

test_that("The date format, '2014-11-07' is in the correct format", {
  expect_true(check_date("2014-11-07"))
})

test_that("Wrong date type throws error", {
  expect_error(gday("Bruins", gDate="201-411-12"), "Error")
})

test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
  expect_true(gday(team="canucks", gDate="2014-11-02"))
  expect_true(gday(team="predators", gDate="2014-11-02"))
})

test_that("Washington Capitals did not play on 2014-11-10", {
  expect_false(gday(team="capitals", gDate="2014-11-10"))
  expect_false(gday(team="washington", gDate="2014-11-10"))
})

test_that("Score between Toronto Maple Leafs and Montreal Canadien on 2014-10-08", {
  testScores = scores("2014-10-08")
  idxHome = grep("toronto", testScores$home, ignore.case=T)
  idxAway = grep("montreal", testScores$away, ignore.case=T)
  expect_true(length(idxHome)==1 & length(idxAway)==1)
  expect_true(idxHome == idxAway)
  expect_true(testScores[idxHome,"home_score"]==3 & testScores[idxAway,"away_score"]==4)
})

test_that("No games, hence no scores on 2014-10-06", {
  testScores = scores("2014-10-06")
  expect_true(nrow(scores("2014-10-06"))==0)
})

test_that("No score data yet in the future", {
  expect_true(nrow(scores("2016-10-06"))==0)
})



