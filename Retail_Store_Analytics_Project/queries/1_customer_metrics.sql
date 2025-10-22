/*Customer metrics
1. Customer orders overview
Orders count
Amount of products the customer ordered
Overall income from the customer
Average order cost
*/

WITH customers_enriched AS (
    SELECT Customers.CustomerName
         , OrderDetails.QuantityOrdered
         , OrderDetails.PriceEach
         , Products.BuyPrice
    FROM OrderDetails
         LEFT JOIN Orders ON OrderDetails.OrderNumber = Orders.OrderNumber
         LEFT JOIN Customers ON Orders.CustomerNumber = Customers.CustomerNumber
         LEFT JOIN Products ON OrderDetails.ProductCode = Products.ProductCode 
)
SELECT CustomerName                            AS customer_name 
     , COUNT(QuantityOrdered)                  AS orders_count 
     , SUM(QuantityOrdered)                    AS product_quantity_ordered 
     , ROUND(SUM(QuantityOrdered * PriceEach)) AS overall_income_from_customer 
     , ROUND(AVG(QuantityOrdered * PriceEach)) AS average_order_cost 
FROM customers_enriched  
GROUP BY CustomerName
ORDER BY orders_count DESC
;


/*
2. Demographic distribution
Amount of products ordered per country 
 */

SELECT Customers.Country                                     AS country 
     , ROUND(SUM(COALESCE(OrderDetails.QuantityOrdered, 0))) AS overall_quantity_ordered 
FROM Customers
     LEFT JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
     LEFT JOIN OrderDetails ON Orders.OrderNumber = OrderDetails.OrderNumber
GROUP BY Customers.Country
ORDER BY overall_quantity_ordered DESC
;

/*
3. Daily Customer Orders
Daily Orders count
Daily amount of products ordered
  */

SELECT Orders.OrderDate::DATE                                AS order_date 
     , COUNT(DISTINCT Orders.OrderNumber)                    AS customer_count
     , ROUND(SUM(COALESCE(OrderDetails.QuantityOrdered, 0))) AS overall_quantity_ordered 
FROM Orders
     LEFT JOIN OrderDetails ON Orders.OrderNumber = OrderDetails.OrderNumber
GROUP BY Orders.OrderDate::DATE
ORDER BY order_date
;

