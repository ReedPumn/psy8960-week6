# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringr)
library(stringi)


# Data Import
citations <- stri_read_lines("../docs/citations.txt")
citations_txt <- str_subset(citations, ".+")
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, 10)

citations_tbl <- as_tibble(data.frame(line = 1:45492, cite = citations_txt)) %>%
  mutate(cite = str_remove_all(citations_txt, pattern = "^\"|\'"))