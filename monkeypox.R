# Load libraries
library(tidyverse)
library(lubridate)
library(gridExtra)
library(wordcloud)




# Load data sets
timeline <- read_csv("Worldwide_Case_Detection_Timeline.csv")
cases <- read_csv("Monkey_Pox_Cases_Worldwide.csv")
daily <- read_csv("Daily_Country_Wise_Confirmed_Cases.csv")




# Data Wrangling
timeline$Gender <- str_to_lower(timeline$Gender)
timeline$Country <- as.factor(timeline$Country)
cases$Country <- as.factor(cases$Country)
daily$Country <- as.factor(daily$Country)




# Figure 1: Countries with at least 50 confirmed cases
## Filter data
c1 <- cases %>% filter(Confirmed_Cases>50)
## Plot data
c1 %>% mutate(Country = fct_reorder(Country,Confirmed_Cases)) %>%
  ggplot() + geom_point(aes(Confirmed_Cases, Country)) +
  xlab("Confirmed Cases")





# Figure 2: Daily trend of monkeypox confirmed cases count
## Perform lubridate to parse dates
d1 <- daily %>% pivot_longer(c("2022-01-31", "2022-02-17", "2022-02-28", "2022-03-04", "2022-03-31", "2022-04-10", "2022-04-12",
                               "2022-04-30", "2022-05-06", "2022-05-08", "2022-05-12", "2022-05-13", "2022-05-15", "2022-05-17", "2022-05-18",
                               "2022-05-19", "2022-05-20", "2022-05-21", "2022-05-23", "2022-05-24", "2022-05-25", "2022-05-26", "2022-05-27",
                               "2022-05-28", "2022-05-29", "2022-05-30", "2022-05-31", "2022-06-01", "2022-06-02", "2022-06-03", "2022-06-04",
                               "2022-06-05", "2022-06-06", "2022-06-07", "2022-06-08", "2022-06-09", "2022-06-10", "2022-06-11", "2022-06-12",
                               "2022-06-13", "2022-06-14", "2022-06-15", "2022-06-16", "2022-06-17", "2022-06-18", "2022-06-19", "2022-06-20",
                               "2022-06-21", "2022-06-22", "2022-06-23", "2022-06-24", "2022-06-25", "2022-06-26", "2022-06-27", "2022-06-28",
                               "2022-06-29", "2022-06-30", "2022-07-01", "2022-07-02", "2022-07-03", "2022-07-04", "2022-07-05", "2022-07-06",
                               "2022-07-07", "2022-07-08", "2022-07-09", "2022-07-10", "2022-07-11", "2022-07-12", "2022-07-13", "2022-07-14",
                               "2022-07-15", "2022-07-16", "2022-07-17", "2022-07-18", "2022-07-19", "2022-07-20", "2022-07-21", "2022-07-22",
                               "2022-07-23", "2022-07-24", "2022-07-25", "2022-07-26", "2022-07-27", "2022-07-28", "2022-07-29", "2022-07-30",
                               "2022-07-31", "2022-08-01", "2022-08-02", "2022-08-03", "2022-08-04", "2022-08-05", "2022-08-06", "2022-08-07",
                               "2022-08-08", "2022-08-09", "2022-08-10", "2022-08-11", "2022-08-12", "2022-08-13", "2022-08-14", "2022-08-15",
                               "2022-08-16", "2022-08-17", "2022-08-18", "2022-08-19", "2022-08-20", "2022-08-21", "2022-08-22", "2022-08-23",
                               "2022-08-24", "2022-08-25", "2022-08-26", "2022-08-27", "2022-08-28", "2022-08-29", "2022-08-30", "2022-08-31",
                               "2022-09-01", "2022-09-02", "2022-09-03", "2022-09-04", "2022-09-05", "2022-09-06", "2022-09-07", "2022-09-08",
                               "2022-09-09", "2022-09-10", "2022-09-11", "2022-09-12", "2022-09-13", "2022-09-14", "2022-09-15", "2022-09-16",
                               "2022-09-17", "2022-09-18", "2022-09-19", "2022-09-20", "2022-09-21", "2022-09-22"), names_to = "dates",
                             values_to = "count")
d1$dates <- ymd(d1$dates)
## Confirm variable is a date variable
class(d1$dates)
## Subset data to confirmed cases of most impacted country
d2 <- d1 %>% filter(Country == "United States", count>0)
## View if there are any trends by weekday
table(wday(d2$dates,label=T))
## View if there are any trends by month
table(month(d2$dates,label=T))
## Plot time series plot by month
d2 %>% ggplot(aes(x=dates,y=count)) +
  geom_line(size=0.3) +
  geom_smooth(span=0.3, se=F) +
  xlab("Month") +
  ylab("Case Count")






# Table 1: Common words used to describe monkeypox symptoms
## Count observations with similar symptoms
table(timeline$Symptoms)
## Define variables for text analysis
skin = sum(table(str_extract(timeline$Symptoms, ".kin")))
ulcer = sum(table(str_extract(timeline$Symptoms, ".lcer")))
rash = sum(table(str_extract(timeline$Symptoms, ".ash")))
lesion = sum(table(str_extract(timeline$Symptoms, ".esion")))
swallow = sum(table(str_extract(timeline$Symptoms, ".wallow")))
back = sum(table(str_extract(timeline$Symptoms, ".ack")))
fever = sum(table(str_extract(timeline$Symptoms, ".ever")))
throat = sum(table(str_extract(timeline$Symptoms, ".hroat")))
itch = sum(table(str_extract(timeline$Symptoms, ".tch")))
headache = sum(table(str_extract(timeline$Symptoms, ".eadache")))
diarrhea = sum(table(str_extract(timeline$Symptoms, ".iarrhea")))
fatigue = sum(table(str_extract(timeline$Symptoms, ".atigue")))
blister = sum(table(str_extract(timeline$Symptoms, ".lister")))
## Combine all variables for text analysis
b <- tibble(skin,ulcer,rash,lesion,swallow,back,fever,throat,itch,headache,diarrhea,fatigue,blister)
## Tidy data for text analysis
b1 <- b %>% pivot_longer(c(skin,ulcer,rash,lesion,swallow,back,fever,throat,itch,headache,diarrhea,fatigue,blister),
                         names_to = "Issue", values_to = "Count") %>% arrange(desc(Count))
b1$Issue <- as.factor(b1$Issue)
## Modify factor order
b1 %>%
  mutate(Issue = fct_reorder(Issue,Count))
## Reset graphics
dev.off()
## Use gridExtra library for a more presentable table for paper
grid.table(b1)
## Reset graphics
dev.off()

b1 %>%
  with(wordcloud(Issue, Count))



# Calculate missing data in gender variable
sum(is.na(timeline$Gender))/nrow(timeline)




# Create frequency table on gender with available data
table(timeline$Gender)

