# Project 1 - Smartphones
## Overview
Hi! In this project I'm analyzing a Dataset about Smartphones that i Found on Kaggle Platform.
My goal with this project is to practice the use of CTE's and some data cleansing using SQL, as well as to develop a small interactive dashboard in Power BI that allows to analyze some characteristics of cell phones over time.

## Objectives
  -  Use SQL Functions to remove characters on Numerical Data
  -  Analyze the relationship between prices and features.
  -  Based on a Score of the models to see which phone is more accurate for my needs.

## Data Set
This Data Set is from Kaggle, you can find the original DataSet here:
https://www.kaggle.com/datasets/abdulmalik1518/mobiles-dataset-2025
- **Dataset Link:** [Mobiles Dataset 2025](https://www.kaggle.com/datasets/abdulmalik1518/mobiles-dataset-2025)

## Data Cleaning SQL
For this Part I Import the data using the SQL Developer Tool, so the program created the table with NVARCHAR to all the columns.


###   1.Creating Second Table
I started to create a second table to start making changes, using a CTAS, deleting some columns and to have a backup of the original information in case I made a mistake.
     ```sql
     SELECT company_name,
       model_name,
       mobile_weight    AS Mobile_Weight_G,
       ram              AS RAM_GB,
       front_camera     AS Front_Camera_Mpx,
       back_camera      AS Back_Camera_Mpx,
       processor,
       battery_capacity AS Battery_Capacity_mAh,
       screen_size      AS Screen_Size_Inches,
       launched_price_usa,
       launched_year
     INTO   cellphone2
     FROM   cellphone;
     ```
     ### 2. Duplicate Rows
     I use the next Query to valide if there was a Duplicate columns using CTE's and ROW_NUMBER Function, i found a couple of duplcate models, so usinf the same querie, i remvoved them
     
