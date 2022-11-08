# Evaluating Monkeypox cases and trends across multiple continents

Introduction

In 1958, monkeypox was first discovered in primates, but the origin of the disease is unknown. The virus was caused by the monkeypox virus which is in the same family as smallpox. Although monkeypox symptoms are milder than smallpox symptoms and often don’t result in death, those who contract the disease may deal with uncomfortable symptoms. With the recent 2022 outbreak of monkeypox, there is speculation that monkeypox traveled to other countries through international travel from central and western African countries. In this study, monkeypox cases and trends are evaluated for their case count and common symptoms in multiple countries. The country with the largest case count will further be evaluated using a time series plot to discover trends of the disease.

Data Description

Three data sets were compiled from kaggle to learn more about monkeypox across multiple continents. The first data set was the daily cases data set which contained 112 countries out of 195 possible countries in the world and the number of cases on each day starting from January 1st, 2022 to September 9th, 2022. Since the data set had inconsistent daily data collection from January 1st to May 23rd, only 142 date variables were available. The next data set was the cases data set which contained 129 countries with five other variables on their confirmed cases, suspected cases, hospitalization, case count on those who traveled, and case count on those who did not travel. The last data set was the timeline data set which contained 65,546 entries of confirmed cases in each country with eight other variables on the affected individual’s city, gender, age, symptoms, hospitalization status, isolation status, and travel history. Of the 65,546 entries, the majority of the patient gender demographic data was missing (96%). But the available patient demographic data showed that only 0.8% of women make up the population impacted by monkeypox.

Method

To understand what were common monkeypox symptoms across all countries, the daily cases data set was analyzed for common words using stringr library. To determine the country of interest with the highest number of confirmed cases, the confirmed cases variable from the cases data set was assessed. To explore further on the most impacted country to date, information was gathered from the timeline data set to visualize a time series plot using the lubridate and ggplot2 library. Other additional libraries used to perform data wrangling and visualization involved tidyverse, readr, dplyr, and forcats. Although the age variable would be useful and interesting for analysis, the age range was not standardized across all countries’ data collection process; therefore, was not evaluated in the study.

Results

<details><summary>Table 1: Common words used to describe monkeypox symptoms.</summary>
<p>

![common_symp(cropped)](https://user-images.githubusercontent.com/73903035/193513696-c9faa8be-f109-48e1-bb20-c757f2aaaea0.jpg)
![wordcloud](https://user-images.githubusercontent.com/73903035/200568887-bf407682-d8ca-4475-9dc8-01aad28bb69d.png)


</p>
</details>


Table 1 displayed the most common words that were used to describe monkeypox symptoms. The most common symptoms were lesion, ulcer, fever, and rash. The second most common words were skin, headache, and fatigue. A pattern arises amongst all the words which would indicate painful skin-like conditions.


<details><summary>Figure 1: Countries with at least 50 confirmed monkeypox cases as of September 9th, 2022.</summary>
<p>

![confirmed_cases](https://user-images.githubusercontent.com/73903035/193513316-c26bfb2a-8468-488e-b82b-8c08e4e1663a.png)


</p>
</details>


In Figure 1, the results showed that the United States of America has the largest number of confirmed cases to date with Brazil and Spain next. To further investigate the trend of monkeypox in the most impacted country, a time series plot was performed.


<details><summary>Figure 2: Daily trend of monkeypox confirmed cases count by month in the most impacted country, the United States of America. A local regression line (blue) was applied on top of the time series plot.</summary>
<p>

![dailycases](https://user-images.githubusercontent.com/73903035/193513708-1e0297a4-5a10-47aa-8bf8-45a9aeb27c94.png)


</p>
</details>

Figure 2 illustrated the time series plot with an upward trend during the summer season and a downward trend towards the start of the fall season. Local regression was applied to the time series plot to show the trend smoothed out for easy interpretation. Since there is little data on monkeypox due to how recent the outbreak occurred, we cannot assume a seasonal or cyclical connection to monkeypox. But there was evidence that showed a possible connection between the summer season and peak travel season which could explain the spike in cases during the last summer time period.

This study showed that painful skin-like issues were common symptoms in those affected with monkeypox. The high confirmed case count in the United States of America is worrisome and the monkeypox trend in the United States appears active during the summer months. Although monkeypox outbreak peaked during the summer months, it appears to be heading to a lower case count as we progress to the autumn and winter months. The CDC has clinical treatment information available for those affected by monkeypox and advise those to cover up active open skin lesions or ulcers or rashes to limit the spread of the virus.


Source: https://www.kaggle.com/datasets/deepcontractor/monkeypox-dataset-daily-updated?select=Worldwide_Case_Detection_Timeline.csv
