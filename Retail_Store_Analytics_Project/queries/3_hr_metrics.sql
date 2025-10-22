/* HR Metrics

1. Employee Performance
Amount of customers served by each employee
Amount of orders for each employee
Profit from employee 
*/    

WITH employee_performance_enriched AS (
    SELECT Employees.EmployeeNumber
         , Employees.FirstName || ' ' || Employees.LastName   AS full_name
         , Employees.JobTitle              AS job_title
         , Employees.OfficeCode            AS office_code
         , Customers.CustomerNumber
         , Orders.OrderNumber
         , OrderDetails.QuantityOrdered
         , OrderDetails.PriceEach
         , Products.BuyPrice
    FROM Employees
         LEFT JOIN Customers ON Employees.EmployeeNumber = Customers.SalesRepEmployeeNumber
         LEFT JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
         LEFT JOIN OrderDetails ON Orders.OrderNumber = OrderDetails.OrderNumber
         LEFT JOIN Products ON OrderDetails.ProductCode = Products.ProductCode
)
SELECT full_name
     , job_title
     , office_code
     , COUNT(DISTINCT CustomerNumber)     AS customers_count
     , COUNT(DISTINCT OrderNumber)        AS orders_count
     , ROUND(SUM(QuantityOrdered * PriceEach) - SUM(QuantityOrdered * BuyPrice)) AS profit_from_employee
FROM employee_performance_enriched 
GROUP BY full_name, job_title, office_code 
;

/*
2. Office performances
Overall profit city, country
Overall orders count for each city, country
*/

WITH office_performance_enriched AS (
    SELECT Offices.Country
         , Offices.City
         , Orders.OrderNumber
         , OrderDetails.QuantityOrdered
         , OrderDetails.PriceEach
         , Products.BuyPrice
    FROM Offices
         LEFT JOIN Employees ON Offices.OfficeCode = Employees.OfficeCode
         LEFT JOIN Customers ON Employees.EmployeeNumber = Customers.SalesRepEmployeeNumber
         LEFT JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
         LEFT JOIN OrderDetails ON Orders.OrderNumber = OrderDetails.OrderNumber
         LEFT JOIN Products ON OrderDetails.ProductCode = Products.ProductCode
)
SELECT Country                       AS office_country
     , City                          AS office_city
     , COUNT(DISTINCT OrderNumber)   AS total_orders_count
     , ROUND(SUM(QuantityOrdered * PriceEach) - SUM(QuantityOrdered * BuyPrice)) AS total_profit
FROM office_performance_enriched 
GROUP BY Country, City
ORDER BY office_country, office_city 
;
