# Sales Data Analysis Using SQL

## 📌 Project Overview
The Sales Data Analysis project uses SQL to explore customer orders, product performance, revenue, and sales trends. It demonstrates how relational database queries can transform raw sales records into useful business information.

## 🛠️ Technologies
- SQL
- MySQL
- Relational Database Design
- Data Quality Checks
- Sales Reporting and Analysis

## 🗄️ Database Structure
**Database:** `sales_analysis`

**Customers table**
- `customer_id`
- `customer_name`
- `city`

**Orders table**
- `order_id`
- `customer_id`
- `product_name`
- `category`
- `quantity`
- `price`
- `order_date`

The tables are connected through a foreign key relationship using `customer_id`.

## 🚀 Key Features
- Created and populated relational database tables.
- Applied primary keys, foreign keys, NOT NULL, and CHECK constraints.
- Checked for missing values, duplicate order IDs, and invalid sales records.
- Calculated total revenue, total orders, units sold, and average order value.
- Analyzed product-wise and category-wise revenue.
- Used INNER JOIN to combine customer and order information.
- Identified high-revenue customers and compared city-wise sales.
- Analyzed monthly revenue trends.
- Applied GROUP BY, HAVING, CASE statements, and subqueries.
- Created a reusable `sales_report` SQL view.
- Queried the view to summarize revenue by city.

## 📊 SQL Concepts Practiced
`SELECT`, `WHERE`, `COUNT()`, `SUM()`, `AVG()`, `GROUP BY`, `ORDER BY`, `HAVING`, `INNER JOIN`, `CASE`, subqueries, constraints, and views.

## 🎯 Learning Outcomes
- Improved understanding of relational database design.
- Practiced data validation and data-quality checks.
- Developed skills in aggregating and filtering business data.
- Learned to create reusable SQL reporting views.
- Practiced translating business questions into SQL queries.

## 🔮 Future Improvements
- Connect the SQL database to Power BI.
- Create an interactive sales dashboard.
- Add more realistic data and test additional edge cases.
- Expand the analysis with profit margins, customer retention, and year-over-year comparisons.

## 👩‍💻 Author
Tanvi Shire

GitHub: https://github.com/tanvishire-dev

**Note:** This project uses sample sales data for learning and portfolio demonstration.
ysis queries can be added as the next development step.
