# Title: 10-data-analysis


# Library ----------------------------------------------------------------------
library(tidyverse)
library(janitor)

# Read Data --------------------------------------------------------------------
credit <- read_csv("data/Credit_Update.csv") |> 
  clean_names()

# Dataset Review ---------------------------------------------------------------

# Variables ----
glimpse(credit)

# total 12 from x1 (id) to balance

# Observations ----
nrow(credit)

# total 400 rows (people) in the dataset

# Summary ----------------------------------------------------------------------

summary(credit)

credit |> 
  count(gender)

credit |> 
  count(student)

# use other library for quicker review
library(gtsummary)
tbl_summary(credit)

?tbl_summary(credit)
tbl_summary(credit, 
            statistic = list(all_continuous() ~ "{mean} ({min}, {max})",
            all_categorical() ~ "{n} ({p}%)")
)

# Detail -----------------------------------------------------------------------

# Demography ----
credit |> 
  count(gender)

# Male - 193 and female - 207

credit |> 
  count(ethnicity) |> 
  mutate(
    pct = n / sum(n)
  )

# Caucasian accounts for 50% of total participants

# Income ----
# average income 45k ranging from 10k to 187k.
hist(credit$income)
median_inc <- median(credit$income)
# median income 33k

round(median_inc, 3)
round_half_up(median_inc, 3)
max(credit$income)
min(credit$income)

# Balance ----
round_half_up(mean(credit$balance), 2)

credit |> 
  summarize(
    .by = ethnicity,
    median_inc = median(balance, na.rm = FALSE),
    average_inc = mean(balance, na.rm = FALSE)
  )

# African american highest balance, and Asian lowest balance.

# Relationships ----------------------------------------------------------------

# income vs balance

credit |> 
  ggplot(aes(income, balance)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)























