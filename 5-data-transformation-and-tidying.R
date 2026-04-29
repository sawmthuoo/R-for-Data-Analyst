# Title: 4-data-transformation-and-tidying
# Date: 4/6/2026

# Library ----------------------------------------------------------------------
library(tidyverse)

# 1.Operation on rows ----------------------------------------------------------

# 1.1.distinct() ----
credit_update_clean |> 
  distinct(ethnicity)

credit_update_clean |> 
  distinct(ethnicity, gender)

credit_asian <- credit_update_clean |> 
  filter(ethnicity == "Asian")

# 1.2.filter() ----

credit_asian_male <- credit_update_clean |> 
  filter(ethnicity == "Asian" & gender == "Male")

# Logical operators
# and => & or ,
# or => |

credit_age_less_than_35 <- credit_update_clean |> 
  filter(age < 35)

credit_age_less_than_equal_35 <- credit_update_clean |> 
  filter(age < 35 | age == 35) # or filter(age <= 35)

# Operators
# less than <
# less than or equal to <=
# greater than >
# greater than or equal to >=
# equal to ==
# not equal to !=

credit_asian_white <- credit_update_clean |> 
  filter(ethnicity %in% c("Asian", "Caucasian"))

# 1.3.arrange() ----

# Manual arrange from the View
credit_income_arranged <- credit_update_clean |> 
  arrange(desc(income))

credit_income_bly_gender_arranged <- credit_update_clean |> 
  arrange(gender, desc(income))
  
# 2.Columns operation ----------------------------------------------------------

# 2.1.mutate() ----
credit_income_mutate <- credit_update_clean |> 
  mutate(income = income * 1000)

credit_income_new_variable <- credit_update_clean |> 
  mutate(
    income_new = income * 1000,
    branch = "NY"     
    )

credit_char_mutate <- credit_update_clean |> 
  mutate(
    gender = case_when(
      gender == "Female" ~ "Women",
      gender == "Male" ~ "Men",
      TRUE ~ NA_character_
    ),
    ethnicity = if_else(
      ethnicity == "Caucasian", "White", ethnicity
    )
  )

# 2.2.select() ----

credit_income_limit_balance_only <- credit_update_clean |> 
  select(income, limit, balance)

credit_wo_rowid <- credit_update_clean |> 
  select(!x1)

# 2.3.rename() ----

credit_rename <- credit_update_clean |> 
  rename(
    "row_id" = "x1",
    "personal_income" = "income",
    "credit_limit" = "limit",
    "credit_rating" = "rating"
  )

# 2.4. relocate() ----

credit_balance_relocate <- credit_update_clean |> 
  relocate(balance, .after = income)

credit_rating_balance_relocate <- credit_update_clean |> 
  relocate(rating, balance, .before = x1)

# 3.Data transformation --------------------------------------------------------

# 3.1. longer data form ----

credit_long_data <- credit_update_clean |> 
  pivot_longer(
    cols = c(income, limit, balance),
    names_to = "credit_info",
    values_to = "value"
  )
# 3.2. wider data form ----

credit_wide_data <- credit_long_data |> 
  pivot_wider(
    id_cols = x1,
    names_from = credit_info,
    values_from = value
  )



  
  
  