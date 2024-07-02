# PDF Node ID Extractor

This repository contains an R script to extract specific Node IDs from PDF files and save them to an Excel file. The Node IDs follow a specific format such as `2019-[A-Z]+[0-9]{2,3}-[A-Z]*[0-9]*E?[0-9]*`.

## Features

- Extracts Node IDs from PDF files.
- Saves extracted Node IDs to an Excel file.
- Provides debugging output for manual inspection and regex adjustment.

## Requirements

- R (version 4.0 or later)
- RStudio (optional but recommended)

### R Packages

The following R packages are required to run the script:

- pdftools
- writexl

You can install these packages using the following commands:

```r
install.packages(c("pdftools", "writexl"))
