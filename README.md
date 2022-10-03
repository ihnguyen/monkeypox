# Evaluating Monkeypox cases and trends across multiple continents

Monkeypox is a rare disease caused by the monkeypox virus. The virus is in the same family as smallpox. Monkey pox symptoms are milder than smallpox symptoms, and often don’t result in death. monkey pox was first discovered in 1958 in primates, but the origin of the disease is unknown. With the recent 2022 outbreak of monkeypox, there is speculation that monkeypox traveled to other countries from international travel to central and western African countries. The main research question is to evaluate monkeypox cases and trends in multiple continents.

Three data sets were compiled to expand knowledge about monkeypox across multiple continents. They were sourced from kaggle. Each contained valuable information about countries with high prevalence of monkeypox. The first data set is the daily cases data set which contains the number of cases on each day starting from January 1st, 2022 to September 9th, 2022 although consistent daily data collection occurred on May 23rd, 2022. The second data set is the cases data set which contains each country and their confirmed cases, and suspected cases. This data set contains 129 out of 195 possible countries in the world with the confirmed cases, suspected cases, hospitalization, and travel history information. The third data set is the timeline data set which contains 65,546 entries of confirmed cases with their country, city, gender, age, symptoms, hospitalization and isolation status, and travel history.

Each data set has one commonality which is country. To understand what are common monkeypox symptoms across all countries, the first data set was analyzed for common words used. From the second data set, the variable of interest is the confirmed case count to determine the country of interest with the highest number of confirmed cases. To explore further on the highly impacted country, the third data set was used to gather more information about which months had the lowest and highest count of monkeypox confirmed cases. information of the most impacted country will , and dates. Although the age variable would be useful for analysis, the age range was not standardized across all countries’ data collection process, therefore, it was difficult to interpret and to use for analysis.

To perform data wrangling and visualization, the following R libraries were used: tidyverse, readr, dpylr, ggplot2, lubridate, forcats, stringr.


<details><summary>Table 1: Common words used to describe monkeypox symptoms.</summary>
<p>

![common_symp(cropped)](https://user-images.githubusercontent.com/73903035/193513696-c9faa8be-f109-48e1-bb20-c757f2aaaea0.jpg)


</p>
</details>


Table 1 displays the most common words that are used to describe monkeypox symptoms are lesion, ulcer, fever, and rash. The next set of common words used were skin, headache, and fatigue.These words indicate painful skin-like conditions are commonly associated with monkeypox. The less common words can be helpful for diagnosis.


<details><summary>Figure 1: Countries with at least 50 confirmed monkeypox cases as of September 9th, 2022.</summary>
<p>

![confirmed_cases](https://user-images.githubusercontent.com/73903035/193513316-c26bfb2a-8468-488e-b82b-8c08e4e1663a.png)


</p>
</details>


Figure 1 results show that the United States of America has the largest number of confirmed cases to date. To further investigate the trend of monkeypox, a time series plot was developed to determine which months had the largest number of cases.


<details><summary>Figure 2: Daily trend of monkeypox confirmed cases count by month in the most impacted country, the United States of America.</summary>
<p>

![dailycases](https://user-images.githubusercontent.com/73903035/193513708-1e0297a4-5a10-47aa-8bf8-45a9aeb27c94.png)


</p>
</details>


In Figure 2, the time series plot indicated an upward trend during the summer season and a downward trend towards the start of the fall season. Since there is little data on monkeypox, we cannot assume a seasonal connection to monkeypox. There is evidence that shows since summer season is peak travel season, it could explain the spike in cases during that time period.

Of the 65,546 entries, the majority of the patient demographic data was missing (96%). But the available patient demographic data showed that only 0.8% of women make up the population impacted by monkeypox. Although the CDC is aware that the majority of men make up the monkeypox demographic, they still advise those who are infected by monkeypox to cover up active open skin lesions or ulcers or rashes to limit the spread of the virus regardless of gender.

Source: https://www.kaggle.com/datasets/deepcontractor/monkeypox-dataset-daily-updated?select=Worldwide_Case_Detection_Timeline.csv
