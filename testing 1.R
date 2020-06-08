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

#make a scatterplot using ggplot 
install.packages('ggplot2')
library(ggplot2)
ggplot(data_long, aes(x=date, y=Count, col =Taxa)) + geom_point()

#make a histogram 
ggplot(data_long, aes(x=date, y=Count, col = Taxa, fill = Taxa)) + geom_bar(stat = 'identity')

#show taxa distribution 
ggplot(data_long, aes(x=Taxa, y=Count, col = Taxa, fill = Taxa)) + geom_bar(stat = 'identity')

#name plot for cleaner workspace 
barplot <- ggplot(data_long, aes(x=Taxa, y=Count, col = Taxa, fill = Taxa)) + geom_bar(stat = 'identity')

#can change the title and labels 
bp1 <- barplot + ggtitle("Zooplankton Taxa Abundance", subtitle="From the EcoMon Dataset") + xlab("Taxa") + ylab("Zooplankton Count")

#can change the colors in your plot 
#install r color palettes 
install.packages('RColorBrewer')
library(RColorBrewer)
head(brewer.pal.info)
#change color palette
bp1 + scale_colour_brewer(palette = "BrBG")
#more fun colors: http://sape.inf.usi.ch/quick-reference/ggplot2/colour 

#change the theme 
bp1 + theme_minimal() 
