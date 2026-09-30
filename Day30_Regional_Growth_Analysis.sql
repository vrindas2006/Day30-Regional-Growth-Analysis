SHOW DATABASES;
USE sql_basics;
SHOW TABLES;
LOAD DATA LOCAL INFILE 'C:/Users/vsnai/Downloads/Sample-Superstore2_dataset.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT * FROM superstore LIMIT 5;
SELECT `Order Date` FROM superstore LIMIT 10;
SELECT
    YEAR(`Order Date`) AS Year,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY YEAR(`Order Date`), Region
ORDER BY Year, Region;

WITH yearly_sales AS (
    SELECT
        YEAR(`Order Date`) AS Year,
        Region,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY YEAR(`Order Date`), Region
)
SELECT
    Year,
    Region,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        (
            Total_Sales -
            LAG(Total_Sales) OVER (
                PARTITION BY Region
                ORDER BY Year
            )
        )
        /
        LAG(Total_Sales) OVER (
            PARTITION BY Region
            ORDER BY Year
        ) * 100,
        2
    ) AS Growth_Percentage
FROM yearly_sales
ORDER BY Year, Region;

SELECT
    YEAR(`Order Date`) AS Year,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY YEAR(`Order Date`), Region
ORDER BY Year, Region;

SELECT 
    MIN(`Order Date`) AS First_Date,
    MAX(`Order Date`) AS Last_Date,
    COUNT(DISTINCT YEAR(`Order Date`)) AS Number_of_Years
FROM superstore;

SELECT DISTINCT `Order Date`
FROM superstore
LIMIT 20;

SELECT
    `Order Date`,
    STR_TO_DATE(REPLACE(`Order Date`, '-', '/'), '%m/%d/%Y') AS Converted_Date
FROM superstore
LIMIT 20;

WITH yearly_sales AS (
    SELECT
        YEAR(
            STR_TO_DATE(REPLACE(`Order Date`, '-', '/'), '%m/%d/%Y')
        ) AS Year,
        Region,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY
        YEAR(
            STR_TO_DATE(REPLACE(`Order Date`, '-', '/'), '%m/%d/%Y')
        ),
        Region
)
SELECT
    Year,
    Region,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        (
            Total_Sales -
            LAG(Total_Sales) OVER (
                PARTITION BY Region
                ORDER BY Year
            )
        )
        /
        LAG(Total_Sales) OVER (
            PARTITION BY Region
            ORDER BY Year
        ) * 100,
        2
    ) AS Growth_Percentage
FROM yearly_sales
ORDER BY Year, Region;