# CyclisticBikeShare

## Case Study: How Does a Bike-Share Navigate Speedy Success? 
[![View Repositories](https://img.shields.io/badge/View-My_Repositories-blue?logo=GitHub)](https://github.com/KanyinsolaAdeleye?tab=repositories)
[![View My Profile](https://img.shields.io/badge/View-My_Profile-green?logo=GitHub)](https://github.com/KanyinsolaAdeleye)

## 📕 Table Of Contents
* [Scenario](#scenario)
* [About the Company](<About the Company>)
* [About The Team](<About the Team>)
* [Background of the Case-study](<Background of the Case-study>)
* [Business Task](<Business Task>)
* [Goal Insights](<Goal Insights>)
* [Prepare](#Prepare)
* [Process](#Process)
* [PROCESS](#process)
* [ANALYZE](#analyze)
* [ACT](#act)


## Scenario

> In this case study, I work for a fictional company named Cyclistic, a bike-share company in Chicago as a Junior Data Analyst in the marketing team.

Welcome to the Cyclistic bike-share analysis case study!

## About the Company

> Cyclistic Bike-Share, Chicago is a bike-share program launched in 2016 that features more than 5,800 bicycles and 1200 docking stations. The bikes can be unlocked from one station and returned to any other station in the system anytime.

> Although the pricing flexibility helps Cyclistic attract more customers, Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes.

## About the Team
> The marketing team is a team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide the Cyclistic marketing strategy.

## Background of the Case-study
> Cyclistic’s finance analysts have concluded that member riders are much more profitable than casual riders but the director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team is tasked with understanding how casual and member riders use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into member riders.

## Business Task
> Design a new marketing strategy to convert casual riders into member riders.

## Goal Insights
­­ ­­­1. How casual riders and member riders use Cylistic bikes differently.

­ 2. Why casual riders would buy a membership

­ 3. How digital media could affect their marketing tactics   


## Prepare

> The Cyclistic’s historical trip data was used to analyze and identify trends. This data was supplied by amazonaws.com and the12 months (June 2023 — May 2024) of Cyclistic trip data selected for use can be found [here](<https://divvy-tripdata.s3.amazonaws.com/index.html>). (Note: The datasets have a different name because Cyclistic is a fictional company).

> The data which was gathered firsthand by the company on all its users has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). The data-privacy issues prohibit my team and me from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

> For this case study, the datasets are appropriate and will enable me to answer the business questions irrespective of the data privacy involved. Information like membership types, duration of trips, start and end stations and so on which were supplied will be used to show helpful insights into riders’ patterns.

> The data was supplied in CSV files and were zipped according to their respective months. The data used consists of 5, 900, 385 rows, and 13 columns. In terms of clean data, this dataset is quite dirty because it has several nulls (blank) values.

## Process
For this case study, I will be using R for my analysis becasue of the flexibility R provides for analysis using various packages and PowerBi for my visualization because I want to explore the features PowerBi offers.

### The Cleaning Process
> I loaded the packages I will be needing  
![pacakges](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/packages.PNG)

> I created a working directory to store my script  
![wd](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/set%20my%20working%20directory.PNG)

> I loaded the datasets into R environment  
![load](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/load%20datasets.PNG)

> I looked through my data set and its structure  
![look](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/preview.PNG)

> I went ahead to append my datasets into one dataset
![append](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/appended.PNG)

> 

The next step is to clean the data.

We will add columns that list the day, month, day, and year of each trip. This will allow us to aggregate trip data for each month, day or year.

``` r
trips$date <- as.Date(trips$started_at) 
trips$month <- format(as.Date(trips$date), "%m")
trips$day <- format(as.Date(trips$date), "%d")
trips$year <- format(as.Date(trips$date), "%Y")
trips$day_of_week <- format(as.Date(trips$date), "%A")
colnames(trips)
```

      [1] "ride_id"            "started_at"         "ended_at"          
      [4] "rideable_type"      "tripduration"       "start_station_id"  
      [7] "start_station_name" "end_station_id"     "end_station_name"  
     [10] "member_casual"      "gender"             "birthyear"         
     [13] "date"               "month"              "day"               
     [16] "year"               "day_of_week"

Now, we will add a column for the trip length for each trip by finding
the time difference between the start time and end time of the trip.

``` r
trips$ride_length = difftime(trips$ended_at,trips$started_at)
```

There is some "bad" data to remove when ride_length is a negative number due to the maintenance of removing the bike for quality check. We will create a new dataframe to remove these negative trip length trips.

``` r
trip_data_clean <- trips[!(trips$ride_length <= 0),]
glimpse(trip_data_clean)
```

     Rows: 3,817,991
     Columns: 18
     $ ride_id            <dbl> 21742443, 21742444, 21742445, 21742446, 21742447, 2…
     $ started_at         <dttm> 2019-01-01 00:04:37, 2019-01-01 00:08:13, 2019-01-…
     $ ended_at           <dttm> 2019-01-01 00:11:07, 2019-01-01 00:15:34, 2019-01-…
     $ rideable_type      <dbl> 2167, 4386, 1524, 252, 1170, 2437, 2708, 2796, 6205…
     $ tripduration       <dbl> 390, 441, 829, 1783, 364, 216, 177, 100, 1727, 336,…
     $ start_station_id   <dbl> 199, 44, 15, 123, 173, 98, 98, 211, 150, 268, 299, …
     $ start_station_name <chr> "Wabash Ave & Grand Ave", "State St & Randolph St",…
     $ end_station_id     <dbl> 84, 624, 644, 176, 35, 49, 49, 142, 148, 141, 295, …
     $ end_station_name   <chr> "Milwaukee Ave & Grand Ave", "Dearborn St & Van Bur…
     $ member_casual      <chr> "Subscriber", "Subscriber", "Subscriber", "Subscrib…
     $ gender             <chr> "Male", "Female", "Female", "Male", "Male", "Female…
     $ birthyear          <dbl> 1989, 1990, 1994, 1993, 1994, 1983, 1984, 1990, 199…
     $ date               <date> 2019-01-01, 2019-01-01, 2019-01-01, 2019-01-01, 20…
     $ month              <chr> "01", "01", "01", "01", "01", "01", "01", "01", "01…
     $ day                <chr> "01", "01", "01", "01", "01", "01", "01", "01", "01…
     $ year               <chr> "2019", "2019", "2019", "2019", "2019", "2019", "20…
     $ day_of_week        <chr> "Tuesday", "Tuesday", "Tuesday", "Tuesday", "Tuesda…
     $ ride_length        <drtn> 6.500000 mins, 7.350000 mins, 13.816667 mins, 29.7…

## ANALYZE

We will now perform a descriptive analysis of the data to find patterns
between Customer and Subscriber. Before we begin the analysis, it is a
good idea to review basic descriptive statistics about the data.

``` r
mean(trip_data_clean$ride_length)
median(trip_data_clean$ride_length) 
max(trip_data_clean$ride_length) 
min(trip_data_clean$ride_length)
```
```
     Time difference of 24.17443 mins
     Time difference of 11.81667 mins
     Time difference of 177200.4 mins
     Time difference of 1.016667 mins
```

First, we'll compare Customer and Subscriber trip stats.

``` r
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = mean)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = median)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = max)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = min)
```

Before continuing, arrange the day_of_week column in the correct order.

``` r
trip_data_clean$day_of_week <- ordered(trip_data_clean$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
```

Next, we will check the average ride time per day and the total number
of trips for Customer and Subscriber

``` r
plot <- trip_data_clean %>% 
  group_by(member_casual, day_of_week) %>%  #groups by member_casual
  summarise(number_of_rides = n() #calculates the number of rides and average duration 
  ,average_ride_length = mean(ride_length),.groups="drop") %>% # calculates the average duration
  arrange(member_casual, day_of_week) #sort
```

## Share

Before making recommendations to the marketing department, we will
create some visualizations to share with stakeholders as well as give us
a better idea of what insights to share.

``` r
 ggplot(plot,aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
 labs(title ="Total rides of Members and Casual riders Vs. Day of the week") +
 geom_col(width=0.5, position = position_dodge(width=0.5))+
 scale_y_continuous(labels = function(x) format(x, scientific = FALSE))
```

<p align="center">
  <img src="/IMG/1.png">
                                             
From the chart above, it can be seen that Subscribe is the group with the most number of rides on weekdays.

---
``` r
ggplot(plot,aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +
  geom_col(width=0.5, position = position_dodge(width=0.5)) + 
  labs(title ="Average ride time of Members and Casual riders Vs. Day of the week")+
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))
```

<p align="center">
  <img src="/IMG/2.png">

From the chart above, we can observe that the Custumer group cycled for longer periods of the week with the highest number of rides on weekends while the Subscribers drove at a steady pace during the week with the highest number of rides. highest on weekends.

---
``` r
trip_data_clean %>%  
  group_by(member_casual, month) %>% 
  summarise(number_of_rides = n(),.groups="drop") %>% 
  arrange(member_casual, month)  %>% 
  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +
  labs(title ="Total rides by Members and Casual riders by Month") +
  theme(axis.text.x = element_text(angle = 45)) +
  geom_col(width=0.5, position = position_dodge(width=0.5)) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))
```

<p align="center">
  <img src="/IMG/3.png">

From the chart above, we can see that the Subscriber group has a higher number of trips throughout the year

---
## ACT
For the last step in the data analysis process, we will make three recommendations to increase the number of Subscribers every year. But first, we'll lay out three key insights.


### Key Findings:

>    1.  Custumer rides the most on weekends. In contrast, Subscriber makes the most trips during the week.
>    2.  On average, Subscriber rides shorter than Custumer.
>    3.  There is no difference between Custumer and Subscriber in terms of the number of trips they make per month. Both Custumer and Subscriber have the highest number of trips in the summer months and the least number of trips in late winter and early spring.

### Recommendations

>    1.  Target Custumer bike rentals for weekend fun.
>    2.  Create a big summer campaign when more people can afford to rent bikes.
