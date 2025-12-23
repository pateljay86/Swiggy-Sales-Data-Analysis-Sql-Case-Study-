🍔 Swiggy Sales Analysis | Data Analytics Project
📌 Project Overview

This project focuses on analyzing Swiggy food delivery data to extract meaningful business insights related to sales performance, customer spending behavior, food preferences, ratings, and regional demand trends.
The analysis follows an industry-standard analytics workflow, starting from raw data cleaning to dimensional modeling and KPI-driven insights.

🎯 Business Objectives

Ensure high-quality, reliable data through cleaning and validation

Build a Star Schema (Dimensional Model) for scalable analytics

Develop core KPIs for business decision-making

Perform deep-dive analysis on time, location, food performance, pricing, and ratings

🧹 Data Cleaning & Validation

Performed on the raw swiggy_data table:

Null Checks on critical columns:

State, City, Order_Date, Restaurant_Name, Location

Category, Dish_Name, Price_INR, Rating, Rating_Count

Blank / Empty Value Detection

Duplicate Detection using business-critical columns

Duplicate Removal using ROW_NUMBER() to retain one clean record per order

🏗️ Dimensional Modeling (Star Schema)

To optimize analytics and reporting performance, a Star Schema was designed.

⭐ Fact Table

fact_swiggy_orders

Price_INR

Rating

Rating_Count

Foreign keys to all dimension tables

📊 Dimension Tables

dim_date → Year, Month, Quarter, Week

dim_location → State, City, Location

dim_restaurant → Restaurant_Name

dim_category → Cuisine / Category

dim_dish → Dish_Name

This structure improves query performance, ensures consistent reporting, and supports BI tools like Power BI / Tableau.

📈 KPI Development
🔹 Core KPIs

Total Orders

Total Revenue (INR Million)

Average Dish Price

Average Rating

🔍 Business Analysis Performed
📅 Date-Based Analysis

Monthly order trends

Quarterly order trends

Year-wise growth analysis

Day-of-week order patterns

📍 Location-Based Analysis

Top 10 cities by order volume

Revenue contribution by state

🍽️ Food Performance Analysis

Top 10 restaurants by orders

Top cuisines (Indian, Chinese, etc.)

Most ordered dishes

Cuisine-wise performance (Orders + Avg Rating)

💰 Customer Spending Insights

Order distribution across price buckets:

Under 100

100–199

200–299

300–499

500+

⭐ Ratings Analysis

Distribution of dish ratings from 1 to 5
