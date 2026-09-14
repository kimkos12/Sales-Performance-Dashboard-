-- ============================================================
-- SALES PERFORMANCE DASHBOARD
-- SQL BUSINESS ANALYSIS
-- Database: SQLite
-- Table: SalesData
-- ============================================================


-- ============================================================
-- 1. TOTAL REVENUE
-- ============================================================

SELECT
    SUM(Revenue) AS Total_Revenue
FROM SalesData;


-- ============================================================
-- 2. TOTAL UNITS SOLD
-- ============================================================

SELECT
    SUM("Units Sold") AS Total_Units_Sold
FROM SalesData;


-- ============================================================
-- 3. TOTAL NET PROFIT
-- ============================================================

SELECT
    SUM("Net Profit") AS Total_Net_Profit
FROM SalesData;


-- ============================================================
-- 4. OVERALL NET PROFIT MARGIN
-- ============================================================

SELECT
    SUM("Net Profit") * 100.0 / SUM(Revenue) AS Net_Profit_Margin
FROM SalesData;


-- ============================================================
-- 5. REVENUE BY REGION
-- ============================================================

SELECT
    Region,
    SUM(Revenue) AS Total_Revenue
FROM SalesData
GROUP BY Region
ORDER BY Total_Revenue DESC;


-- ============================================================
-- 6. NET PROFIT BY REGION
-- ============================================================

SELECT
    Region,
    SUM("Net Profit") AS Total_Net_Profit
FROM SalesData
GROUP BY Region
ORDER BY Total_Net_Profit DESC;


-- ============================================================
-- 7. PROFITABILITY BY REGION
-- ============================================================

SELECT
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM("Net Profit") AS Total_Net_Profit,
    SUM("Net Profit") * 100.0 / SUM(Revenue) AS Net_Profit_Margin
FROM SalesData
GROUP BY Region
ORDER BY Net_Profit_Margin DESC;


-- ============================================================
-- 8. REVENUE AND NET PROFIT BY PRODUCT
-- ============================================================

SELECT
    Product,
    SUM(Revenue) AS Total_Revenue,
    SUM("Net Profit") AS Total_Net_Profit
FROM SalesData
GROUP BY Product
ORDER BY Total_Net_Profit DESC;


-- ============================================================
-- 9. PROFITABILITY BY PRODUCT
-- ============================================================

SELECT
    Product,
    SUM(Revenue) AS Total_Revenue,
    SUM("Net Profit") AS Total_Net_Profit,
    SUM("Net Profit") * 100.0 / SUM(Revenue) AS Net_Profit_Margin
FROM SalesData
GROUP BY Product
ORDER BY Net_Profit_Margin DESC;


-- ============================================================
-- 10. MONTHLY REVENUE AND NET PROFIT
-- ============================================================

SELECT
    substr(Date, 7, 4) || '-' || substr(Date, 1, 2) AS Month,
    SUM(Revenue) AS Total_Revenue,
    SUM("Net Profit") AS Total_Net_Profit
FROM SalesData
GROUP BY substr(Date, 7, 4) || '-' || substr(Date, 1, 2)
ORDER BY Month;


-- ============================================================
-- 11. LOSS-MAKING TRANSACTIONS
-- ============================================================

SELECT
    COUNT(*) AS Loss_Making_Transactions
FROM SalesData
WHERE "Net Profit" < 0;


-- ============================================================
-- 12. LOSS-MAKING TRANSACTIONS BY PRODUCT
-- ============================================================

SELECT
    Product,
    COUNT(*) AS Loss_Making_Transactions,
    SUM("Net Profit") AS Total_Loss
FROM SalesData
WHERE "Net Profit" < 0
GROUP BY Product
ORDER BY Total_Loss ASC;


-- ============================================================
-- 13. LOSS-MAKING TRANSACTIONS BY REGION
-- ============================================================

SELECT
    Region,
    COUNT(*) AS Loss_Making_Transactions,
    SUM("Net Profit") AS Total_Loss
FROM SalesData
WHERE "Net Profit" < 0
GROUP BY Region
ORDER BY Total_Loss ASC;


-- ============================================================
-- 14. REGION + PRODUCT LOSS ANALYSIS
-- ============================================================

SELECT
    Region,
    Product,
    COUNT(*) AS Loss_Making_Transactions,
    SUM(Revenue) AS Revenue,
    SUM("Net Profit") AS Total_Loss
FROM SalesData
WHERE "Net Profit" < 0
GROUP BY Region, Product
ORDER BY Total_Loss ASC;


-- ============================================================
-- 15. MONTHLY PROFITABILITY ANALYSIS
-- ============================================================

SELECT
    substr(Date, 7, 4) || '-' || substr(Date, 1, 2) AS Month,
    SUM(Revenue) AS Total_Revenue,
    SUM("Cost of Goods Sold") AS Total_COGS,
    SUM("Operating Expenses") AS Total_Operating_Expenses,
    SUM("Gross Profit") AS Total_Gross_Profit,
    SUM("Net Profit") AS Total_Net_Profit
FROM SalesData
GROUP BY substr(Date, 7, 4) || '-' || substr(Date, 1, 2)
ORDER BY Month;


-- ============================================================
-- 16. LOSS-MAKING TRANSACTION DETAILS
-- ============================================================

SELECT
    Date,
    Region,
    Product,
    Revenue,
    "Net Profit"
FROM SalesData
WHERE "Net Profit" < 0
ORDER BY "Net Profit" ASC;
