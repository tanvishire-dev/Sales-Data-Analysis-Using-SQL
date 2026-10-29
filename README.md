# Sales Data Analysis Using SQL

## Project Overview
This project demonstrates how SQL can be used to organize customer and sales order data for business analysis. It uses a relational database with two tables: `customers` and `orders`.

## Technologies Used
- SQL
- Relational Database Management
- Data Validation Constraints
- Data Analysis Queries

## Database Structure

**1. Customers Table**
- `customer_id` — Primary key
- `customer_name` — Customer name
- `city` — Customer city

**2. Orders Table**
- `order_id` — Primary key
- `customer_id` — Foreign key referencing customers
- `product_name` — Product name
- `category` — Product category
- `quantity` — Quantity ordered
- `price` — Product price
- `order_date` — Order date

## Key Features
- Created a `sales_analysis` database.
- Designed related customer and order tables.
- Inserted sample customer and order data.
- Implemented primary and foreign key constraints.
- Added validation rules to prevent non-positive quantities and negative prices.
- Prepared the database for customer, product, and sales analysis.

## Learning Outcomes
- Understanding relational database design.
- Practicing `CREATE DATABASE`, `CREATE TABLE`, and `INSERT INTO`.
- Using primary keys and foreign keys.
- Applying `CHECK` constraints.
- Retrieving records using `SELECT` queries.

## Future Improvements
- Analyze sales by product category and month.
- Calculate total sales and order quantities.
- Identify top-selling products and high-value customers.
- Add `JOIN`, `GROUP BY`, aggregate functions, and subqueries.
- Perform data-quality checks and build business reports.

- Technologies: SQL | Relational Database Design | Data Validation

- Athor
 Tanvi shire

**Note:** This project currently contains sample data and initial table setup. Advanced sales analysis queries can be added as the next development step.
