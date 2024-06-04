library(tidyverse)
library(lubridate)
library(dplyr)
getwd()
setwd("/users/HP/Desktop/BikeShare")

june2023<-read_csv("202306_divvy_tripdata.csv")
july2023<-read_csv("202307_divvy_tripdata.csv")
aug2023<-read_csv("202308_divvy_tripdata.csv")
sept2023<-read_csv("202309_divvy_tripdata.csv")
oct2023<-read_csv("202310_divvy_tripdata.csv")
nov2023<-read_csv("202311_divvy_tripdata.csv")
dec2023<-read_csv("202312_divvy_tripdata.csv")
jan2024<-read_csv("202401_divvy_tripdata.csv")
feb2024<-read_csv("202402_divvy_tripdata.csv")
mar2024<-read_csv("202403_divvy_tripdata.csv")
april2024<-read_csv("202404_divvy_tripdata.csv")
may2024<-read_csv("202405_divvy_tripdata.csv")

View(june2023)
View(july2023)
View(aug2023)
View(sept2023)
View(oct2023)
View(nov2023)
View(dec2023)
View(jan2024)
View(feb2024)
View(mar2024)
View(april2024)
View(may2024)

str(june2023)
str(july2023)
str(aug2023)
str(sept2023)
str(oct2023)
str(nov2023)
str(dec2023)
str(jan2024)
str(feb2024)
str(mar2024)
str(april2024)
str(may2024)


bikeshare<-bind_rows(june2023, july2023, aug2023, sept2023, oct2023, nov2023, dec2023, 
                     jan2024, feb2024, mar2024, april2024, may2024)
View(bikeshare)

#returns the total number of rows(5743278)
bikeshare%>% tally()

#returns the total number of distinct ids(5743278 meaning there are no duplicates)
n_distinct(bikeshare$ride_id) 

#check for missing values

sum(is.na(bikeshare$ride_id))
sum(is.na(bikeshare$rideable_type))
sum(is.na(bikeshare$started_at))
sum(is.na(bikeshare$ended_at))
sum(is.na(bikeshare$start_station_name))
sum(is.na(bikeshare$start_station_id))
sum(is.na(bikeshare$start_lat))
sum(is.na(bikeshare$start_lng))
sum(is.na(bikeshare$ended_at))
sum(is.na(bikeshare$end_station_name))
sum(is.na(bikeshare$end_station_id))
sum(is.na(bikeshare$end_lat))
sum(is.na(bikeshare$end_lng))

#remove the null values in identified columns
cyclistic_bikeshare<-na.omit(bikeshare)
View(cyclistic_bikeshare)
#double check that there are no null values
sum(is.na(cyclistic_bikeshare))

#create new column
cyclistic_bikeshare$ridelength<-(cyclistic_bikeshare$ended_at - cyclistic_bikeshare$started_at)/60
cyclistic_bikeshare$ridelength <- gsub(" secs", "", cyclistic_bikeshare$ridelength) #removed the unit "secs"

View(cyclistic_bikeshare$ridelength)
#inspect the new column
summary(cyclistic_bikeshare$ridelength)
min(cyclistic_bikeshare$ridelength)
max(cyclistic_bikeshare$ridelength)

#delete rows where ride length is less than 0
cyclisticbike_share<-cyclistic_bikeshare%>%
  filter(ridelength>=0)


#add extra columns
cyclisticbike_share$day_of_week <- wday(cyclisticbike_share$started_at, label = TRUE, abbr = FALSE)  # Day of the week
cyclisticbike_share$day <- day(cyclisticbike_share$started_at)  # Day of the month
cyclisticbike_share$month <- month(cyclisticbike_share$started_at, label = TRUE, abbr = FALSE)  # Month
cyclisticbike_share$year <- year(cyclisticbike_share$started_at)  # Year

View(cyclisticbike_share)
