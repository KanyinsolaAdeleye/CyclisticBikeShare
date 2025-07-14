# CyclisticBikeShare

## Case Study: How Does a Bike-Share Navigate Speedy Success? 
[![View Repositories](https://img.shields.io/badge/View-My_Repositories-blue?logo=GitHub)](https://github.com/KanyinsolaAdeleye?tab=repositories)
[![View My Profile](https://img.shields.io/badge/View-My_Profile-green?logo=GitHub)](https://github.com/KanyinsolaAdeleye)

## 📕 Table Of Contents
* [Scenario](<[## scenario](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/README.md#scenario)>)
* [About the Company](<About the Company>)
* [About The Team](<About the Team>)
* [Background of the Case-study](<Background of the Case-study>)
* [Business Task](<Business Task>)
* [Goal Insights](<Goal Insights>)
* [Prepare](<Prepare>)
* [Process](<Process>)
* [Analyze and Share](<Analyze and Share>)
* [Act](#act)


## Scenario

In this case study, I work for a fictional company named Cyclistic, a bike-share company in Chicago as a Junior Data Analyst in the marketing team.

Welcome to the Cyclistic bike-share analysis case study!

## About the Company

Cyclistic Bike-Share, Chicago is a bike-share program launched in 2016 that features more than 5,800 bicycles and 1200 docking stations. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Although the pricing flexibility helps Cyclistic attract more customers, Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes.

## About the Team
The marketing team is a team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide the Cyclistic marketing strategy.

## Background of the Case-study
Cyclistic’s finance analysts have concluded that member riders are much more profitable than casual riders but the director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team is tasked with understanding how casual and member riders use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into member riders.

## Business Task
Design a new marketing strategy to convert casual riders into member riders.

## Goal Insights
­­ ­­­1. How casual riders and member riders use Cylistic bikes differently.

­ 2. Why casual riders would buy a membership

­ 3. How digital media could affect their marketing tactics   


## Prepare

The Cyclistic’s historical trip data was used to analyze and identify trends. This data was supplied by amazonaws.com and the12 months (June 2023 — May 2024) of Cyclistic trip data selected for use can be found [here](<https://divvy-tripdata.s3.amazonaws.com/index.html>). (Note: The datasets have a different name because Cyclistic is a fictional company).

The data which was gathered firsthand by the company on all its users has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). The data-privacy issues prohibit my team and me from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

For this case study, the datasets are appropriate and will enable me to answer the business questions irrespective of the data privacy involved. Information like membership types, duration of trips, start and end stations and so on which were supplied will be used to show helpful insights into riders’ patterns.

The data was supplied in CSV files and were zipped according to their respective months. The data used consists of 5, 900, 385 rows, and 13 columns. In terms of clean data, this dataset is quite dirty because it has several nulls (blank) values.

## Process
For this case study, I will be using R for my analysis becasue of the flexibility R provides for analysis using various packages and PowerBi for my visualization because I want to explore the features PowerBi offers. I did all [cleaning processes](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/rscript.R) in R

## Analyze and Share
I wanted to observe the riders’ behaviour as a whole and also help stakeholders see the overall performance of Cylistic riders and their preferences, so, I created an Overview Dashboard.  
![overview](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/overview.PNG)

DIVING RIGHT INTO HOW RIDERS BEHAVE DIFFERENTLY  
The riders have been divided into subscription classes. Customers who purchase single-ride or full-day passes are referred to as Casual Riders. Customers who purchase annual memberships are Member Riders.   
![membership](https://github.com/KanyinsolaAdeleye/CyclisticBikeShare/blob/main/membership.PNG)


## Act

Here are some insights garnered from analyzing the Cyclistic data and corresponding recommendations that will be useful for the marketing campaign:  

1. Approximately 62% of the casual riders use Classic Bikes for travelling, so, in other to increase the conversion of casual riders to member riders, we can offer special incentives for the use of Classic Bikes for some time as a ‘welcome package’ for new member riders.  
2. Since 5 pm is a staple ‘rush-hour’ time, ‘Member priority’ should be put in place. This will give casual riders a reason to consider conversion.  
3. Casual riders may prefer the ease of having to pay per trip, so the option of breaking the ‘Membership Plan’ into monthly, quarterly and yearly should be considered.  
4. The marketing campaigns with the use of Digital Screens for Cylistic advertisements in the top 4 stations, which is: Streeter Dr & Grand Avenue, DuSable Lake Shore Dr & Monroe St, DuSable Lake Shore Dr & North Blvd, Michigan Ave & Oak Street should be considered.  
5. The social media platforms should be leveraged through campaigns that cover how casual riders can save money by becoming member riders.  
6. Campaigns should be all year round but heavy during Winter and Autumn in other to gain good conversion before Spring and Summer.
   
Some additional data such as information about riders’ age, gender, address, profession, income, and interests will help expand the insights gotten which will in turn reflect on the recommendations given.  
