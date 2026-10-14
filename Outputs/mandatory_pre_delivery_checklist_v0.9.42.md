# Resident Pipeline v0.9.42 Mandatory Pre-Delivery Checklist

Before delivering a new version:

1. Read `Check-commits/error_solution_ledger_v0.9.42.md`.
2. Read `Check-commits/functionality_test_registry_v0.9.42.csv`.
3. Run `Rscript Outputs/test_resident_pipeline_v0.9.42.R` from `<repository-root>`.
4. Confirm standalone loading: one current-version load message and no `source()` calls to older Resident pipeline files.
5. Run `resident_assert_active_implementations(FALSE, TRUE)` and confirm `$ok` is `TRUE`.
6. Confirm `resident_duplicate_function_report()` reports known historical duplicates instead of hiding them.
7. Confirm `resident_tmb_file_sync_report()` reports synchronized `Outputs/resident_tmb.cpp` and `Outputs/resident_tmb_v0.9.42.cpp`.
8. Confirm Option 22 still prints the guided fitting wizard, implementation-status labels, comparable-likelihood groups, and CJS exclusion.
9. Confirm Option 22 still stores `analysis$abundance_fit`, `analysis$fitted_model`, `analysis$model_fit`, and `analysis$model_results`.
10. Confirm Option 23 retrieves every Option 22 fitted/stored model.
11. Confirm Options 1-14, 15-20, and 21 remain unaffected.
12. If any unrelated option changes behavior, revert the fix and narrow the implementation.
