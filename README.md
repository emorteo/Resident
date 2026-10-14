# RESIDENT

RESIDENT is an R-based teaching, simulation, and analysis workflow for capture-recapture encounter histories, dolphin residency and site-fidelity classification, discovery curves, and exploratory abundance-model screening.

The current public baseline is **v0.9.42**. It is intentionally distributed as a research software script rather than as a formal R package.

## What RESIDENT Does

RESIDENT helps researchers and students:

- import encounter histories in common capture-recapture formats;
- inspect capture histories, survey dates, detection records, and discovery curves;
- compute literature-based residency, site-use, and sighting-frequency classifications;
- generate Chao-style discovery and sampling-completeness summaries;
- review model assumptions before fitting abundance or population-parameter models;
- explore supported abundance-model families through a guided console interface;
- keep model outputs, summaries, and exports reproducible.

RESIDENT is especially useful as a bridge between raw photo-identification encounter histories and formal capture-recapture tools such as Program MARK, RMark, or custom TMB models.

## Scientific Scope

RESIDENT includes descriptive summaries, literature-based residency classifiers, diagnostic model screening, and selected model-fitting workflows. Some model families are currently labelled as diagnostic or simplified rather than full Program MARK-equivalent likelihoods. The software keeps those labels visible so users do not overinterpret exploratory outputs.

Cormack-Jolly-Seber models estimate apparent survival or persistence and detection for already marked or observed animals. They are **not** abundance models and are not selectable as abundance models in RESIDENT's abundance-fitting menu.

## Repository Layout

```text
Outputs/
  resident_pipeline_v0.9.42.R      # Main standalone R pipeline
  resident_tmb_v0.9.42.cpp         # Versioned TMB/C++ backend
  resident_tmb.cpp                 # Canonical TMB compile target

docs/
  installation.md                  # Setup instructions
  data-formats.md                  # Supported input formats
  public-release-checklist.md      # Public release and privacy checklist
  release-notes/v0.9.42.md         # Baseline release notes

tests/
  test_public_smoke_v0.9.42.R      # Self-contained public smoke test

examples/
  .gitkeep                         # Placeholder for non-private examples

data/
  .gitkeep                         # Placeholder; real catalogues/data stay private
```

Private empirical catalogues, individual identifiers, converted field files, old outputs, `.RData`, `.Rhistory`, and local Word planning documents are intentionally excluded from the public repository.

## Requirements

Minimum practical setup:

- R 4.1 or newer;
- base R packages: `stats`, `utils`, `graphics`, `grDevices`, `tools`;
- optional: `readxl` for Excel workbook import;
- optional: `TMB` and `RcppEigen` for compiling the C++ backend.

RESIDENT can run many workflows without compiling the TMB backend.

## Quick Start

Clone the repository and open R or RStudio in the repository root.

```r
options(resident_pipeline.autostart = TRUE)
source("Outputs/resident_pipeline_v0.9.42.R")
```

To load without the interactive startup menu:

```r
options(resident_pipeline.autostart = FALSE)
source("Outputs/resident_pipeline_v0.9.42.R")
resident_active_version()
resident_pipeline_is_standalone()
```

Expected version:

```r
"v0.9.42"
```

## Running the Public Smoke Test

The public smoke test creates small temporary example files and does not require private data.

```r
source("tests/test_public_smoke_v0.9.42.R")
```

Expected final line:

```text
Public smoke tests passed.
```

## Supported Input Formats

RESIDENT recognizes these input families:

- `PROGRAM_MARK`: table with `id`, `encounter_history`, and optional `frequency`;
- `SOCPROG` / long CSV: one sighting record per row with `id` and `date`;
- `WIDE_CSV`: one row per individual and one 0/1 column per sampling occasion;
- `MARK_INP`: compact Program MARK `.inp` encounter-history rows;
- `EXCEL`: workbook that looks like either SOCPROG long format or wide encounter history;
- `AUTO`: automatic format detection.

See [docs/data-formats.md](docs/data-formats.md).

## TMB Backend

The canonical compile target is:

```text
Outputs/resident_tmb.cpp
```

The versioned source is:

```text
Outputs/resident_tmb_v0.9.42.cpp
```

From R, after installing TMB if needed:

```r
TMB::compile("Outputs/resident_tmb.cpp")
dyn.load(TMB::dynlib("Outputs/resident_tmb"))
```

## Privacy And Public Data Policy

Do not commit real catalogues, field identifiers, raw sighting files, encounter-history exports derived from private catalogues, or local analysis outputs. Use synthetic or explicitly public example files only.

The `.gitignore` is configured to keep private project artifacts out of the public repository.

## Citation

If you use RESIDENT in teaching, analysis, or manuscript preparation, cite the repository and the relevant scientific literature for the residency/site-fidelity and capture-recapture methods used in your analysis. A formal citation file is included in [CITATION.cff](CITATION.cff).

## License

RESIDENT is released under the [MIT License](LICENSE).

Copyright (c) 2026 Eduardo Morteo.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and keep public examples synthetic or explicitly approved for public release.

## Security

Please do not open public issues containing private animal IDs, catalogue files, precise sensitive locations, or unpublished field data. See [SECURITY.md](SECURITY.md).
