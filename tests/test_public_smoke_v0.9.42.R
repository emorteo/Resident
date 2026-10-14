# Public smoke tests for RESIDENT v0.9.42.
# Uses only synthetic temporary data.

options(resident_pipeline.autostart = FALSE)
source("Outputs/resident_pipeline_v0.9.42.R")

fail <- function(msg) stop(msg, call. = FALSE)
check <- function(ok, msg) if (!isTRUE(ok)) fail(msg)

check(identical(resident_active_version(), "v0.9.42"), "Wrong active version")
check(isTRUE(resident_pipeline_is_standalone()), "Pipeline is not standalone")
check(isTRUE(resident_assert_active_implementations(FALSE, TRUE)$ok), "Active implementation guard failed")

tmp <- tempdir()
mark_file <- file.path(tmp, "resident_public_mark_example.txt")
writeLines(c(
  "# dates: 2022-01-01 2022-01-08 2022-01-15 2022-01-22",
  "id encounter_history frequency",
  "Dolphin_001 1001 1",
  "Dolphin_002 0100 1",
  "Dolphin_003 0011 1"
), mark_file)

validation <- validate_import_file_before_analysis(mark_file, "AUTO")
check(isTRUE(validation$ok), "Synthetic Program MARK example did not validate")
check(identical(validation$detected_format, "PROGRAM_MARK"), "AUTO did not detect PROGRAM_MARK")

analysis <- list(
  data_type = "empirical",
  observed = validation$imported$history,
  occasions = validation$imported$occasions,
  encounter_data = validation$imported,
  data = list(history = validation$imported$history, occasions = validation$imported$occasions),
  run_output_dir = file.path(tmp, "resident_public_outputs")
)

summary <- analysis_capture_data_summary(analysis)
check(summary$number_of_individuals[1] == 3L, "Unexpected individual count")

out4 <- capture.output(res4 <- handle_post_simulation_menu_choice("4", analysis))
check(any(grepl("model-assumption", out4, ignore.case = TRUE)), "Option 4 did not print assumption review")
analysis <- res4$analysis

out5 <- capture.output(res5 <- handle_post_simulation_menu_choice("5", analysis))
check(any(grepl("literature", out5, ignore.case = TRUE)), "Option 5 did not compute literature classifications")
analysis <- res5$analysis

out21 <- capture.output(res21 <- handle_post_simulation_menu_choice("21", analysis))
check(any(grepl("Abundance model recommendation", out21)), "Option 21 did not print recommendation guide")

out22 <- capture.output(fit_analysis <- safe_select_and_fit_abundance_model(analysis, input_provider = function(prompt = "") "1"))
check(!is.null(fit_analysis$abundance_fit), "Option 22 did not store abundance fit")

out23 <- capture.output(handle_post_simulation_menu_choice("23", fit_analysis))
check(any(grepl("Abundance estimates", out23)), "Option 23 did not retrieve fitted abundance estimates")

cat("Public smoke tests passed.\n")
