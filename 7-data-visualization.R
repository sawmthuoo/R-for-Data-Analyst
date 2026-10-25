# Title: Data visualization

library(tidyverse)
library(janitor)

credit <- read_csv("data/Credit_update.csv") |> 
  select(!...1) |> 
  clean_names()

# 1. Visualization Distribution ---------------------------------------------------

# 1.1 Categorical variable ----

# Bar chart
bar_chart_1 <- credit |> 
  ggplot(aes(x = ethnicity)) +
  geom_bar(fill = "darkblue") +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = -0.5) +
  labs(
    title = "Number of students by ethnic group",
    subtitle = "Caucasian contribute largest in the dataset.",
    caption = "Data source: quarterly report, 2026",
    x = "Ethnic group",
    y = "Number of students"
  )

bar_chart_1

bar_chart_1 <- credit |> 
  count(ethnicity, sort = TRUE) |> 
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

# 1.2 Numerical variable ----

# Histogram

credit |> 
  ggplot(aes(income)) +
  geom_histogram(bins = 50)

credit |> 
  ggplot(aes(age)) +
  geom_density()


# 2. Visualizing relationships ----------------------------------------------------

# 2.1 A numerical and categorical variable ----

credit |> 
  ggplot(aes(ethnicity, age)) +
  geom_boxplot()

credit |> 
  ggplot(aes(income, fill = ethnicity)) +
  geom_density(alpha = 0.8)

# 2.2 Two categorical variables ----

# Stacked bar chart

credit |> 
  ggplot(aes(ethnicity, fill = married)) +
  geom_bar()

credit |> 
  ggplot(aes(ethnicity, fill = married)) +
  geom_bar(position = "fill") +
  labs(y = "proportion")

# line chart

monthly_sales <- tibble(
  month   = rep(1:12, times = 2),
  sales   = c(120, 135, 150, 160, 175, 190, 185, 200, 210, 195, 180, 220,
               90, 100, 115, 125, 130, 145, 140, 155, 160, 150, 135, 170),
  product = rep(c("Product A", "Product B"), each = 12)
)

monthly_sales |> 
  ggplot(aes(month, sales, group = product)) +
  geom_line(aes(color = product)) +
  geom_point() +
  geom_text(aes(label = sales), vjust = -0.5) +
  scale_x_continuous(breaks = 1:12) +
  labs(
    title = "Monthly sales by product",
    x = "Month",
    y = "Sales (units)",
    color = "Product"
  )

# Scatter plot

credit |> 
  ggplot(aes(income, balance, color = ethnicity)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

credit |> 
  ggplot(aes(income, balance, color = ethnicity, shape = student)) +
  geom_point() +
  facet_wrap(~ ethnicity)

# 3 Saving plots
ggsave(
  "export/bar_chart_1.png",
  bar_chart_1,
  width = 6,
  height = 3.14,
  dpi = 300
)






