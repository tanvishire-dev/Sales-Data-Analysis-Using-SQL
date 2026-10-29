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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    