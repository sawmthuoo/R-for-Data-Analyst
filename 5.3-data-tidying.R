# Library ----------------------------------------------------------------------
library(tidyverse)
library(janitor)

credit_update <- read_csv("data/Credit_update.csv")
credit_update_clean <- credit_update |> 
  clean_names() |> 
  remove_empty() |> 
  remove_constant()

# Sample wide dataset

wide <- tibble(
  Student = c("Alex", "Jordan"),
  Math = c(90, 78),
  Science = c(85, 92),
  English = c(88, 80)
)

long <- wide |> 
  pivot_longer(
    cols = c(Math, Science, English),
    names_to = "Subject",
    values_to = "Score"
  )

wide2 <- long |> 
  pivot_wider(
    id_cols = Student,
    names_from = Subject,
    values_from = Score
  )

# Data transformation using Credit dataset

# income, limit, balance -> pivot longer

crd_long <- credit_update_clean |> 
  pivot_longer(
    cols = c(income, limit, balance),
    names_to = "credit_info",
    values_to = "value"
  )

crd_wide <- crd_long |> 
  pivot_wider(
    id_cols = x1,
    names_from = credit_info,
    values_from = value
  )











