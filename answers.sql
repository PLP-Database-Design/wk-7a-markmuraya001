-- Question 1
CREATE TABLE ProductDetail_1NF AS
SELECT
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(Products, ',', n)) AS Product
FROM
    ProductDetail
CROSS JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3
) AS numbers
WHERE
    n <= LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) + 1;

    /* Question 2
     Creating  Orders table (OrderID, CustomerName) */
CREATE TABLE Orders AS
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    OrderDetails;

-- Creating OrderProducts table (OrderID, Product, Quantity)
CREATE TABLE OrderProducts AS
SELECT
    OrderID,
    Product,
    Quantity
FROM
    OrderDetails;