# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(rebus)
library(stringi)


# Data Import
citations <- stri_read_lines("../docs/citations.txt")
citations_txt <- str_subset(citations, ".+")
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, 10)

citations_tbl <- as_tibble(data.frame(line = 1:length(citations_txt), cite = citations_txt)) %>%
  mutate(cite = str_remove_all(citations_txt, pattern = "^\"|\'")) %>%
  mutate(year = str_extract(citations_txt, pattern = "(\\d{4})")) %>%
  mutate(page_start = str_match(citations_txt, pattern = "(\\d+)-")[,2]) %>%
  mutate(perf_ref = str_detect(str_to_lower(citations_txt), pattern = "performance")) %>%
  mutate(title = str_match(citations_txt, pattern = "\\d{4}\\)\\. (.*)\\. ")[,2]) %>%
  mutate(first_author = str_match(citations_txt, pattern = "(\\w+), (\\w)")[,1])

length(citations_tbl$first_author)