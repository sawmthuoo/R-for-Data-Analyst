# Title: Data Import
# Date" 4/5/2026

# Import libraries -------------------------------------------------------------
# show how to install packages
library(tidyverse)

# Read data --------------------------------------------------------------------
# We hvae two types of dataset:
# One for CSV and one for excel
# One with missing and one with complete

# Read CSV

credit_csv <- read_csv("data/Credit.csv",
                   na = c("", "NA", "N/A"),
                   col_types = list(Cards = col_character()))

# Read Excel
library(readxl)

credit_excel <- read_excel("data/Credit.xlsx",
                      skip = 3,
                      range = "A4:L404",
                      col_types = c("numeric", "numeric", "numeric", "numeric", 
                                    "text", "numeric", "numeric", "text", "text", 
                                    "text", "text", "numeric"))

# Data clean with Janitor
library(janitor)

credit_clean <- credit_csv |> 
  clean_names() |>  # Make row name clean
  remove_empty() |>  # remove empty rows or columns
  remove_constant() # remove constant rows or columns

# Communicate for update data --------------------------------------------------

credit_update <- read_csv("data/Credit_update.csv")
credit_update_clean <- credit_update |> 
  clean_names() |> 
  remove_empty() |> 
  remove_constant()


# Review data ------------------------------------------------------------------

# Manual review by clicking in Envir.
glimpse(credit_clean)
summary(credit_clean)

library(skimr)
skim(credit_clean)


# Make tibble (data frame) -----------------------------------------------------
df3 <- tibble(
  x = c(1, 2, 3),
  y = c("A", "B", "C"),
  Z = c(23, 24, 27)
)

df4 <- tribble(
  ~x, ~y, ~z,
  1, "A", 23,
  2, "B", 24,
  3, "C", 27
)
