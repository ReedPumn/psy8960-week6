# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)
library(stringr)


# Data Import
citations <- stri_read_lines("../docs/citations.txt")
citations_txt <- str_subset(citations, ".+")
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
