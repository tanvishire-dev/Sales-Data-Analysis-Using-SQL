CREATE DATABASE sales_analysis;

USE sales_analysis;


-- create first customer table --

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (1, 'Asha', 'Mumbai'),
    (2, 'Rahul', 'Pune'),
    (3, 'Priya', 'Nagpur'),
    (4, 'Amit', 'Mumbai'),
    (5, 'Neha', 'Pune');
    
    -- now see table structure
    SELECT * FROM customers;
  
  --  create second order  table--
  
    CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CHECK (quantity > 0),
    CHECK (price >= 0)
);
    
    -- insert data into order table --
    
    INSERT INTO orders
    (order_id, customer_id, product_name, category,
     quantity, price, order_date)
VALUES
    (1001, 1, 'Laptop',   'Electronics', 1, 55000, '2026-01-05'),
    (1002, 2, 'Mouse',    'Accessories', 2,   500, '2026-01-08'),
    (1003, 3, 'Phone',    'Electronics', 1, 20000, '2026-01-15'),
    (1004, 1, 'Keyboard', 'Accessories', 1,  1500, '2026-02-02'),
    (1005, 4, 'Monitor',  'Electronics', 2, 12000, '2026-02-10'),
    (1006, 5, 'Chair',    'Furniture',   1,  4500, '2026-02-18'),
    (1007, 2, 'Laptop',   'Electronics', 1, 55000, '2026-03-03'),
    (1008, 3, 'Mouse',    'Accessories', 3,   500, '2026-03-12'),
    (1009, 4, 'Desk',     'Furniture',   1,  8000, '2026-03-20'),
    (1010, 5, 'Phone',    'Electronics', 1, 20000, '2026-03-25');
    
    -- now we check order table   --
    SELECT * FROM orders;
    
    
    -- Check data quality before analysis
    
    
    SELECT COUNT(*) AS total_orders
FROM orders;

-- we check missing values 
SELECT *
FROM orders
WHERE customer_id IS NULL
   OR product_name IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR order_date IS NULL;
    
 -- check  duplicates order IDs
 
 SELECT order_id, COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- find invalid sales records

SELECT *
FROM orders
WHERE quantity <= 0
   OR price < 0;

-- Calculate total sales revenue

SELECT
    SUM(quantity * price) AS total_revenue
FROM orders;


-- count the orders and units sold.

SELECT
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(quantity * price) AS total_revenue,
    AVG(quantity * price) AS average_order_value
FROM orders;

-- Find the best-performing products

SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(quantity * price) AS product_revenue
FROM orders
GROUP BY product_name
ORDER BY product_revenue DESC;

-- Compare sales by category

SELECT
    category,
    SUM(quantity) AS total_units,
    SUM(quantity * price) AS category_revenue
FROM orders
GROUP BY category
ORDER BY category_revenue DESC;

-- Use SQL JOIN to combine two tables

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.product_name,
    o.quantity,
    o.price,
    o.quantity * o.price AS sales_amount,
    o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- Find the highest-value customers

SELECT
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * o.price) AS customer_revenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY customer_revenue DESC;

-- Compare city-wise revenue

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * o.price) AS city_revenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;


-- Analyze monthly sales trends

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- Filter results using HAVING

SELECT
    product_name,
    SUM(quantity * price) AS product_revenue
FROM orders
GROUP BY product_name
HAVING SUM(quantity * price) > 10000
ORDER BY product_revenue DESC;

-- finding customers whose total revenue exceeds ₹30,000

SELECT
    c.customer_name,
    SUM(o.quantity * o.price) AS customer_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.quantity * o.price) > 30000;

-- Classify orders using CASE

SELECT
    order_id,
    product_name,
    quantity * price AS sales_amount,
    CASE
        WHEN quantity * price >= 50000 THEN 'High Value'
        WHEN quantity * price >= 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category
FROM orders
ORDER BY sales_amount DESC;

-- Use a subquery to find products above average revenue

SELECT
    product_name,
    product_revenue
FROM (
    SELECT
        product_name,
        SUM(quantity * price) AS product_revenue
    FROM orders
    GROUP BY product_name
) AS product_summary
WHERE product_revenue > (
    SELECT AVG(product_revenue)
    FROM (
        SELECT
            product_name,
            SUM(quantity * price) AS product_revenue
        FROM orders
        GROUP BY product_name
    ) AS product_totals
)
ORDER BY product_revenue DESC;

-- Create a reusable SQL view

CREATE VIEW sales_report AS
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.product_name,
    o.category,
    o.quantity,
    o.price,
    o.quantity * o.price AS sales_amount,
    o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;
    
    
    SELECT * FROM sales_report;
    
    -- this query for normal table structure
    
    SELECT
    city,
    SUM(sales_amount) AS total_revenue
FROM sales_report
GROUP BY city
ORDER BY total_revenue DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    