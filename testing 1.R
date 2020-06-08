#set working directory to tell R where to upload files from 
getwd()
setwd("/Users/juliacox/Documents/WHOI SSF 2018")

#install necessary packages 
install.packages('readxl')
install.packages('tidyverse') #say "Yes" when in prompts you 
install.packages('vctrs') #say "No" when it prompts you

#import dataset using readxl, and give it a name
library(readxl)
library(tidyverse)
Data <- read_excel("EcoMon Excerpt for Kate.xlsx", sheet = "Data")

#view the dataset
View(Data)

#data wrangling: getting the data into "long" format 
install.packages('tidyr') #good tools for tidying data 
library(tidyr) 
data_long <- gather(Data, Taxa, Count, ctyp_100m3:chaeto_100m3, factor_key=TRUE)

#view new long dataset
View(data_long) #having the data in long format will make it much easier to make plots 

#make a plot using ggplot 
install.packages('ggplot2')
library(ggplot2)


