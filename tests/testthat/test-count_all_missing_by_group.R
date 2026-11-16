
testthat::test_that("Output matches dplyr", {

  small_tbl <- dplyr::tribble(
    ~group, ~var1, ~var2,
    "A", 1, NA,
    "A", 2, "x",
    "B", NA, "y",
    "C", 3, "z"
  )

  expected <- small_tbl |>
    dplyr::group_by(group) |>
    dplyr::summarize(
      dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
      .groups = "drop"
    )

  testthat::expect_equal(
    count_all_missing_by_group(small_tbl, group),
    expected
  )

  expected_null <- small_tbl |>
    dplyr::group_by(group) |>
    dplyr::summarize(
      dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
      .groups = NULL
    )

  testthat::expect_equal(
    count_all_missing_by_group(small_tbl, group, NULL),
    expected_null
  )
})

testthat::test_that("Checking .groups input", {

  testthat::expect_error(
    count_all_missing_by_group(airquality, Month, "kep")
  )

  testthat::expect_no_error(
    count_all_missing_by_group(airquality, Month, NULL)
  )
})

