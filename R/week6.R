# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(stringr)


# Data Import
citations <- stri_read_lines("../docs/citations.txt")
citations_txt <- str_remove_all(citations, pattern = "")
