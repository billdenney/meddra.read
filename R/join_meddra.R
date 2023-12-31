#' Combine together all of the MedDRA terms into a single data.frame
#'
#' @param data MedDRA source data from `read_meddra()`
#' @return A data.frame with the "soc_code", "soc_name", "soc_abbrev",
#'   "hlgt_code", "hlgt_name", "hlt_code", "hlt_name", "pt_code", "pt_name",
#'   "pt_soc_code", "llt_code", "llt_name", and "llt_currency"
#' @export
join_meddra <- function(data) {
  ret <-
    data$soc.asc |>
    dplyr::left_join(data$soc_hlgt.asc, by = "soc_code") |>
    dplyr::left_join(data$hlgt.asc, by = "hlgt_code") |>
    dplyr::left_join(data$hlgt_hlt.asc, by = "hlgt_code") |>
    dplyr::left_join(data$hlt.asc, by = "hlt_code") |>
    dplyr::left_join(data$hlt_pt.asc, by = "hlt_code") |>
    dplyr::left_join(data$pt.asc, by = "pt_code") |>
    dplyr::left_join(data$llt.asc, by = "pt_code")
  ret
}
