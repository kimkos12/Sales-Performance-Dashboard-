-- Sales Performance Dashboard
-- SQL Business Analysis

-- 1. Total Revenue
SELECT
    SUM(Revenue) AS Total_Revenue
FROM SalesData;


-- 2. Total Units Sold
SELECT
    SUM(Units_Sold) AS Total_Units_Sold
FROM SalesData;


-- 3. Total Net Profit
SELECT
    SUM(Net_Profit) AS Total_Net_Profit
FROM SalesData;


-- 4. Revenue by Region
SELECT
    Region,
    SUM(Revenue) AS Total_Revenue
FROM SalesData
GROUP BY Region
ORDER BY Total_Revenue DESC;


-- 5. Net Profit by Product
SELECT
    Product,
    SUM(Net_Profit) AS Total_Net_Profit
FROM SalesData
GROUP BY Product
ORDER BY Total_Net_Profit DESC;
