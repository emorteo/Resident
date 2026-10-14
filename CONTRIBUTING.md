# Contributing to RESIDENT

Thank you for considering a contribution to RESIDENT. This is scientific software, so changes should be conservative, testable, and clear to users who are learning capture-recapture methods.

## Development Principles

- Preserve known-good behavior unless a change explicitly fixes a defect.
- Keep private catalogues, individual identifiers, field spreadsheets, and unpublished outputs out of commits.
- Prefer small, focused pull requests.
- Add or update tests for every behavior change.
- Clearly distinguish diagnostic or simplified methods from full likelihood implementations.

## Before Opening a Pull Request

Run:

```r
source("tests/test_public_smoke_v0.9.42.R")
```

If you have access to private regression fixtures, run the full local regression suite as well, but do not commit those fixtures.

## Reporting Issues

Please include:

- RESIDENT version;
- R version and operating system;
- input format used;
- the exact error message;
- a minimal synthetic example that reproduces the problem.

Do not include private catalogue data or real individual identifiers in public issues.
