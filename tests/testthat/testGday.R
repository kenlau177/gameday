
context("Check game day")

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



