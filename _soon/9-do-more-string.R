# Title: Do more with R - Stringr

library(tidyverse)

# Creating a string ------------------------------------------------------------

string1 <- "This is a string"
string2 <- 'I want to include a \"quotes\" inside a string.'
double_quote <- "\""
next_line <- "next\nline"
str_view(string1)
str_view(string2)
str_view(double_quote)
str_view(next_line)

# Creating many strings from data ----------------------------------------------

credit <- read_csv("data/Credit_Update.csv")

## str_c()
credit_string <- credit |> 
  mutate(
    income_text = str_c(
      "Income is ", Income,"."
    )
  )

## str_glue()
credit_string <- credit |> 
  mutate(
    income_text = str_glue(
      "Income is {Income}."
    )
  )

##paste0()
credit_string <- credit |> 
  mutate(
    income_text = paste0(
      "Income is ",Income,"."
    )
  )

## str_flatten()

fruits <- tribble(
  ~ name, ~ fruit,
  "Carmen", "banana",
  "Carmen", "apple",
  "Marvin", "nectarine",
  "Terence", "cantaloupe",
  "Terence", "papaya",
  "Terence", "mandarin"
)

fruits |> 
  group_by(name) |> 
  summarize(
    fruit = str_flatten(fruit, ", ", last = " and ")
  )

fruits_flatten <- fruits |> 
  group_by(name) |> 
  summarize(
    fruit = str_flatten(fruit, ", ")
  )

# Extracting data from strings -------------------------------------------------

## seperating into rows
fruits_flatten |> 
  separate_longer_delim(fruit, delim = ",") |> 
  mutate(
    fruit = str_remove(fruit, " ")
  )

## seperating into columns

dob <- tibble(
  name = c("Saw", "Min", "Thu"),
  dob = c("Jan-1-2022", "Dec-12-2020", "Apr-7-2021")
  )

dob |> 
  separate_wider_delim(
    dob,
    delim = "-",
    names = c("month", "day", "year")
  )

# Letters -----------------------------------------------------------------------

## str_length
fruits |> 
  mutate(
    n = str_length(fruit)
  )

## str_subset
dob |> 
  mutate(
    birth_month = str_sub(dob, 1, 3)
  )




















