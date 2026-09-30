# Day 30 – Regional Growth Analysis

## 📌 Project Overview

This project analyzes year-over-year sales growth across different regions using the Superstore dataset.

The objective of this task is to understand how sales changed over time and compare regional growth rates.

## 🎯 Objective

- Calculate yearly sales for each region
- Calculate year-over-year growth rates
- Compare regional growth performance
- Visualize growth trends using Excel
- Identify important patterns and changes in regional sales

## 🛠️ Tools Used

- MySQL
- MySQL Workbench
- Microsoft Excel
- GitHub

## 📊 Dataset

Dataset used:

**Superstore Dataset**

The dataset contains information about:

- Orders
- Customers
- Products
- Sales
- Quantity
- Discount
- Profit
- Region

## 🔍 SQL Analysis

The SQL analysis involved:

1. Converting the Order Date from text into a proper date format.
2. Grouping sales by year and region.
3. Calculating year-over-year growth using the `LAG()` window function.
4. Comparing growth rates across Central, East, South, and West regions.

### Growth Formula

Growth Percentage:

`((Current Year Sales - Previous Year Sales) / Previous Year Sales) × 100`

## 📈 Regional Growth Results

| Year | Central | East | South | West |
|------|---------|------|-------|------|
| 2014 | - | - | - | - |
| 2015 | -0.93% | 21.49% | -31.28% | -5.35% |
| 2016 | 43.31% | 15.58% | 31.18% | 33.95% |
| 2017 | -0.22% | 17.93% | 31.30% | 33.42% |

2014 does not have a growth value because there is no previous year available for comparison.

## 📊 Excel Visualization

A line chart was created in Excel to visualize year-over-year regional growth from 2015 to 2017.

The chart compares:

- Central Region
- East Region
- South Region
- West Region

## 💡 Key Learning

Through this project, I practiced:

- SQL date conversion
- `GROUP BY`
- Aggregate functions
- `LAG()` window function
- Year-over-year growth calculations
- Excel data visualization
- Interpreting growth trends
- Understanding small-base effects

## 📂 Project Files

- SQL query
- Excel growth analysis
- Regional growth chart
- Project README

## 👩‍💻 Author

**Vrinda S Nair**

BCA Student | Aspiring Data Analyst

#DataAnalytics #SQL #Excel #DataVisualization #GitHub #LearningJourney
