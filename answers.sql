--Using salesdb database, Write an SQL query to get the firstName, lastName, email, and officeCode of all employees.
--Use an INNER JOIN to combine the employees table with the offices table using the officeCode column.
-- Select the specific columns we want to retrieve from the employees table
SELECT 
    e.firstName,        -- Employee's first name
    e.lastName,         -- Employee's last name  
    e.email,            -- Employee's email address
    e.officeCode        -- Office code assigned to the employee
-- Specify the main table (employees) with alias 'e' for easier reference
FROM employees e
-- Perform an INNER JOIN with the offices table using officeCode as the join condition
-- INNER JOIN returns only records that have matching values in both tables
INNER JOIN offices o    -- 'o' is the alias for the offices table
    ON e.officeCode = o.officeCode;  -- Join condition: match officeCode in both tables

   -- The SELECT clause specifies exactly which columns we want to retrieve

--Table aliases (e for employees, o for offices) make the query more readable

--INNER JOIN ensures we only get employees who have a valid office code that exists in the offices table

--The join condition ON e.officeCode = o.officeCode links the two tables together based on the office code



--Write an SQL query to get the productName, productVendor, and productLine from the products table.
--Use a LEFT JOIN to combine the products table with the productlines table using the productLine column.
USE salesdb;
-- Select the specific columns we want to retrieve
SELECT 
    p.productName,      -- Name of the product
    p.productVendor,    -- Vendor who supplies the product
    p.productLine       -- Product line category
-- Specify the main table (products) with alias 'p' for easier reference
FROM products p
-- Perform a LEFT JOIN with the productlines table
-- LEFT JOIN returns all records from the left table (products), and matched records from the right table (productlines)
-- If no match is found, NULL values are returned for columns from the right table
LEFT JOIN productlines pl    -- 'pl' is the alias for the productlines table
    ON p.productLine = pl.productLine;  -- Join condition: match productLine in both tables


   --The SELECT clause retrieves columns specifically from the products table

--LEFT JOIN ensures we get ALL products, even if they don't have a matching product line description

--The join condition links the tables based on the productLine column

--Since we're only selecting columns from the products table, the LEFT JOIN acts similarly to a simple SELECT in this case, but demonstrates the JOIN syntax 



--Use salesdb, Write an SQL query to retrieve the orderDate, shippedDate, status, and customerNumber for the first 10 orders.
--Use a RIGHT JOIN to combine the customers table with the orders table using the customerNumber column.
USE salesdb;
-- Select the specific columns we want to retrieve from the orders table
SELECT 
    o.orderDate,        -- Date when the order was placed
    o.shippedDate,      -- Date when the order was shipped
    o.status,           -- Current status of the order
    o.customerNumber    -- Customer number associated with the order
-- Specify the main table (customers) with alias 'c'
FROM customers c
-- Perform a RIGHT JOIN with the orders table
-- RIGHT JOIN returns all records from the right table (orders), and matched records from the left table (customers)
-- If no match is found, NULL values are returned for columns from the left table
RIGHT JOIN orders o     -- 'o' is the alias for the orders table
    ON c.customerNumber = o.customerNumber  -- Join condition: match customerNumber in both tables
-- Limit the results to the first 10 orders
LIMIT 10;

--The query uses RIGHT JOIN as requested, but starts from the customers table