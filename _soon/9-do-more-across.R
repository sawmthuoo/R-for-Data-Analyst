# Title: across

# Library
library(tidyverse)

# data import
credit <- read_csv("data/Credit_Update.csv")

credit |> 
  select(Income, Limit, Balance) |> 
  mutate(
    across(c(Income, Limit, Balance), \(x) paste0(x, "USD"), .names = "{.col}_usd")
  )

credit |> 
  group_by(Ethnicity) |> 
  summarise(
    across(where(is.numeric), mean, .names = "{.col}_mean"),
    n = n()
  )
  