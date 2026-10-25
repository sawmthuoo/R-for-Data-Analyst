# Title: Data summarizing

library(tidyverse)
library(janitor)
library(readxl)

# Read data

credit <- read_csv("data/Credit_Update.csv") |> 
  select(!...1) |> 
  clean_names()

# Mean, median, standard deviation

mean(credit$income, na.rm = TRUE)
mean(credit$income[credit$gender == "Male"], na.rm = TRUE)
median(credit$income, na.rm = TRUE)
sd(credit$income, na.rm = TRUE)
max(credit$income, na.rm = TRUE)
min(credit$income, na.rm = TRUE)
diff(range(credit$income, na.rm = TRUE))
quantile(credit$income, na.rm = TRUE)
quantile(credit$income, na.rm = TRUE, 0.75)
IQR(credit$income, na.rm = TRUE)

# summarize (Category)

credit |> 
  count(ethnicity)

credit |> 
  count(ethnicity, gender)

credit |> 
  group_by(ethnicity, gender) |> 
  summarize(
    total = n()
  ) |> 
  ungroup() # Add it not to show warning

credit |> 
  count(ethnicity, gender) |> 
  mutate(
    percent = n / sum(n)
  )

# Summarize (Numeric)

credit |> 
  summarize(
    mean = mean(income, na.rm = TRUE),
    median = median(income, na.rm = TRUE),
    sd = sd(income, na.rm = TRUE)
  )

# group by and summarize

credit |> 
  group_by(ethnicity) |> 
  summarize(
    mean = mean(income, na.rm = TRUE),
    median = median(income, na.rm = TRUE),
    sd = sd(income, na.rm = TRUE),
    IQR = IQR(income, na.rm = TRUE)
  )

credit |> 
  group_by(ethnicity, gender) |> 
  summarize(
    mean = mean(income, na.rm = TRUE),
    median = median(income, na.rm = TRUE),
    sd = sd(income, na.rm = TRUE),
    IQR = IQR(income, na.rm = TRUE)
  ) |> 
  ungroup()

credit |> 
  summarize(
    .by = c(ethnicity, gender),
    mean = mean(income, na.rm = TRUE),
    median = median(income, na.rm = TRUE),
    sd = sd(income, na.rm = TRUE),
    IQR = IQR(income, na.rm = TRUE)
  )

credit |> 
  group_by(ethnicity) |> 
  slice_max(age, n = 1) #slice_min(), slice_head()

# Distribution

hist(credit$income, breaks = 30)
hist(credit$age, breaks = 30)






