
context("Test scores")

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


