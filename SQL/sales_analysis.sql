
-- 1. Total Revenue
SELECT 
    SUM(Revenue) AS total_revenue
FROM sales;

-- 2. Total Transactions
SELECT 
    COUNT(DISTINCT InvoiceNo) AS total_transactions
FROM sales;

-- 3. Total Customers
SELECT 
    COUNT(DISTINCT CustomerID) AS total_customers
FROM sales
WHERE CustomerID IS NOT NULL;

-- 4. Average Order Value (AOV)
SELECT 
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS AOV
FROM sales;

-- 5. Monthly Revenue
SELECT 
    strftime('%Y-%m', InvoiceDate) AS year_month,
    SUM(Revenue) AS monthly_revenue
FROM sales
GROUP BY year_month
ORDER BY year_month;

-- 6. Top 10 Products by Revenue
SELECT 
    StockCode,
    Description,
    SUM(Quantity) AS total_quantity,
    SUM(Revenue) AS total_revenue
FROM sales
WHERE StockCode NOT IN (
    'POST', 'DOT', 'M', 'D',
    'AMAZONFEE', 'CRUK', 'B'
)
GROUP BY StockCode, Description
ORDER BY total_revenue DESC
LIMIT 10;

-- 7. Top 10 Customers by Revenue
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_transactions,
    SUM(Revenue) AS total_revenue
FROM sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;

-- 8. Top 10 Countries by Revenue
SELECT 
    Country,
    SUM(Revenue) AS total_revenue
FROM sales
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

-- 9. Top 10 Products by Quantity
SELECT 
    StockCode,
    Description,
    SUM(Quantity) AS total_quantity
FROM sales
WHERE StockCode NOT IN (
    'POST', 'DOT', 'M', 'D',
    'AMAZONFEE', 'CRUK', 'B'
)
GROUP BY StockCode, Description
ORDER BY total_quantity DESC
LIMIT 10;
