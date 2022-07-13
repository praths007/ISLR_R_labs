library(tidyverse)
library(ISLR)
library(knitr)
# getwd()
setwd("C:/Users/prath/OneDrive - The University of Texas at Austin/introduction_to_machine_learning/R-labs")
################ college data
# checking college data
College

# data reference
?College

college_dat <- College


# checking row names
college_dat %>% rownames
  
#checking summary (mean median mode)
college_dat %>% summary

#checking pair plots
college_dat %>% 
  select(1:4) %>%
  pairs  


# boxplots (outstate tuition is huge)
college_dat %>%
  select(Private, Outstate) %>%
  plot


# top10perc, cut at 50 divided into 2 groups (check the filter value)
# steps -
#   create bins, assign labels within the them
college_dat %>%
  # select(Top10perc) %>%
  mutate(bins = cut(Top10perc, breaks = c(0,50, max(Top10perc)), labels = c("Non-Elite","Elite"))) %>%
  # filter(bins == "Elite")
  select(bins, Outstate) %>%
  # filter(bins == "Elite") %>%
  plot()




## auto data
auto_dat <- Auto

auto_dat <- auto_dat  %>% 
            na.omit 


auto_dat %>% plot
# cylinders, origin and year are qualitative, rest all are quantitative

auto_dat %>%
  select(-c("cylinders", "year", "origin", "name")) %>%
  summary


# removing 10th through 85th rows
auto_dat[-c(10:85),] %>%
  select(-c("cylinders", "year", "origin", "name")) %>%
  summary

# less cylinders more mileage, less displacement more mileage etc.
auto_dat %>% plot


# boston dataset
library(MASS)
Boston

# of rows and columns
Boston %>% str


Boston %>% plot
?Boston
