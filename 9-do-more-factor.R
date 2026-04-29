# Do more with R: Factor

library(tidyverse)

# make a character variable

x <- c("Apr", "Jan", "Feb", "Mar")
x
x <- fct(x, levels = c("Jan", "Feb", "Mar", "Apr"))
x
levels(x)

# make factor variable for Education

credit <- read_csv("data/Credit_Update.csv")

summary(credit$Education)

## Education variable

credit_edu <- credit |> 
  mutate(
    Education_cat = case_when(
      Education >= 18 ~ "18 years and above",
      Education >= 14 ~ "14 to 18 years",
      Education >= 8 ~ "8 to 14 years",
      Education <8 ~ "Less than 8 years",
      TRUE ~ "Unknown"
    ),
    Education_cat = fct(
      Education_cat,
      levels = c(
        "Less than 8 years",
        "8 to 14 years",
        "14 to 18 years",
        "18 years and above",
        "Unknown"
      )
    )
  )

levels(credit_edu$Education_cat) # check factor level

credit_edu |> 
  count(Education_cat) |> 
  ggplot(aes(x = Education_cat, n, fill = Education_cat)) +
  geom_bar(stat = "identity") +
  labs(title = "Education Category Distribution")

# factor recode

credit_edu_2 <- credit_edu |> 
  mutate(
    Education_cat = fct_recode(
      Education_cat,
      "Poor" = "Less than 8 years",
      "Fair" = "8 to 14 years",
      "Good" = "14 to 18 years",
      "Excellent" = "18 years and above"
    )
  )

# factor reorder and factor reverse

credit_edu_2 |> 
  count(Education_cat) |> 
  ggplot(aes(x = fct_rev(fct_reorder(Education_cat, n)), n, fill = Education_cat)) +
  geom_bar(stat = "identity") +
  labs(title = "Education Category Distribution")

















