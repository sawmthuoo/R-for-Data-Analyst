# Title: Data visualization

library(tidyverse)

credit <- read_csv("data/Credit_update.csv")

# Bar chart

credit |> 
  ggplot(aes(x = Ethnicity)) +
  geom_bar(fill = "darkblue") +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = -0.5) +
  labs(
    title = "Number of students by ethnic group",
    subtitle = "Caucasian contribute largest in the dataset.",
    caption = "Data source: quarterly report, 2026",
    x = "Ethnic group",
    y = "Number of students"
  )

credit |> 
  count(Ethnicity, sort = TRUE) |> 
  ggplot(aes(Ethnicity, n)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = n), vjust = -0.5) +
  labs(
    title = "Number of students by ethnic group",
    subtitle = "Caucasian contribute largest in the dataset.",
    caption = "Data source: quarterly report, 2026",
    x = "Ethnic group",
    y = "Number of students"
  )

# line chart

monthly_sales <- tibble(
  month   = rep(1:12, times = 2),
  sales   = c(120, 135, 150, 160, 175, 190, 185, 200, 210, 195, 180, 220,
               90, 100, 115, 125, 130, 145, 140, 155, 160, 150, 135, 170),
  product = rep(c("Product A", "Product B"), each = 12)
)

monthly_sales |> 
  ggplot(aes(month, sales, color = product, group = product)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = sales), vjust = -0.5) +
  scale_x_continuous(breaks = 1:12) +
  labs(
    title = "Monthly sales by product",
    x = "Month",
    y = "Sales (units)",
    color = "Product"
  )

# Histogram

credit |> 
  ggplot(aes(Income)) +
  geom_histogram(bins = 50)

# Scatter plot

credit |> 
  ggplot(aes(Income, Balance, color = Ethnicity)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


