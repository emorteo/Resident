# Installation

RESIDENT is currently distributed as standalone R scripts.

## Basic Setup

1. Install R 4.1 or newer.
2. Clone the repository.
3. Open R or RStudio in the repository root.
4. Load the pipeline:

```r
options(resident_pipeline.autostart = TRUE)
source("Outputs/resident_pipeline_v0.9.42.R")
```

## Optional Excel Support

```r
install.packages("readxl")
```

## Optional TMB Support

```r
install.packages(c("TMB", "RcppEigen"))
TMB::compile("Outputs/resident_tmb.cpp")
dyn.load(TMB::dynlib("Outputs/resident_tmb"))
```

Many RESIDENT workflows run without compiling TMB.
