# Title: Do more with R (String)

# Package: Stringr

# Library

library(tidyverse)
install.packages("babynames")
library(babynames)

# What is String?

babynames |> 
  filter(str_detect(name, "x"))

babynames |> 
  filter(str_detect(name, "^[^AEIOU].*"))

babynames |> 
  filter(str_detect(name, "^X.*"))

babynames |> 
  filter(str_detect(name, "(.)\\1")) |> 
  distinct(name)
