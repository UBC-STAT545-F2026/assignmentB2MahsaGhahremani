
#' Count missing values by group
#'
#' @description
#' This function counts missing values (NA) in each
#' column of a dataset for each group.
#'
#' @param data A data frame or tibble.
#' @param group_col The column used for grouping.
#' @param .groups Controls grouping in the output.
#' The default is "drop".
#'
#' @return A data frame showing the number of
#' missing values in each column for each group.
#'
#' @examples
#' count_all_missing_by_group(airquality, Month)
#'
#' @export
count_all_missing_by_group <- function(data, group_col, .groups = "drop") {

  if (!is.null(.groups)) {
    if (!(.groups %in% c("drop_last", "drop", "keep", "rowwise"))) {
      stop("Invalid .groups argument")
    }
  }

  data |>
    dplyr::group_by({{ group_col }}) |>
    dplyr::summarize(
      dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
      .groups = .groups
    )
}
