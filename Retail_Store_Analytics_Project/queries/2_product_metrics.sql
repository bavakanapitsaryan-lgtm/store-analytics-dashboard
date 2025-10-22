/* Product Metrics
1. Product overview
Overall quantity ordered for each product
Overall Income for each product
Overall profit for each product
 */

WITH product_overview_enriched AS (
    SELECT Products.ProductName
         , Products.BuyPrice
         , Products.ProductDescription
         , OrderDetails.QuantityOrdered
         , OrderDetails.PriceEach
    FROM OrderDetails
    LEFT JOIN Products ON OrderDetails.ProductCode = Products.ProductCode
)
SELECT ProductName                 AS product_name
     , ProductDescription          AS product_description
     , SUM(QuantityOrdered)        AS total_quantity_ordered
     , ROUND(SUM(QuantityOrdered * PriceEach)) AS total_income_from_product
     , ROUND(SUM(QuantityOrdered * PriceEach) - SUM(QuantityOrdered) * BuyPrice) AS total_profit
FROM product_overview_enriched 
GROUP BY ProductName, ProductDescription, BuyPrice 
ORDER BY total_quantity_ordered DESC    
;

/*
2. Product Lines
Amount of unique products (product_ids) for each product line
Quantity sold for each product line
Profits of each product line
*/

WITH product_lines_enriched AS (
    SELECT Products.ProductCode
         , Products.ProductLine
         , Products.BuyPrice
         , OrderDetails.QuantityOrdered
         , OrderDetails.PriceEach
    FROM OrderDetails
    LEFT JOIN Orders ON OrderDetails.OrderNumber = Orders.OrderNumber 
    LEFT JOIN Products ON OrderDetails.ProductCode = Products.ProductCode 
)
SELECT ProductLine                   AS product_line
     , COUNT(DISTINCT ProductCode)   AS amount_of_unique_products
     , SUM(QuantityOrdered)          AS quantity_sold
     , ROUND(SUM(QuantityOrdered * PriceEach) - SUM(QuantityOrdered * BuyPrice)) AS profit
FROM product_lines_enriched 
GROUP BY ProductLine 
ORDER BY profit DESC   
;
