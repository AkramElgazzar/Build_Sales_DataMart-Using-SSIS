# Build_Sales_DataMart-Using-SSIS

## Project Overview

This project aimed to create a data mart for sales data from the AdventureWorks2014 database, using SQL Server and SSIS.

Key accomplishments:

- Designed a star schema data mart that optimized query performance for analytical workloads.
- Implemented incremental and slowly changing dimension (SCD) loading techniques to efficiently manage updates and maintain historical data integrity.
- Utilized SQL Server and SSIS for data extraction, transformation, and loading (ETL) processes.

This data mart serves as a valuable resource for data-driven decision-making, allowing for deeper insights into sales trends, customer patterns, and business performance.


## Data Exploration

First, I explored the source data from the AdventureWorks2014 database, which is a sample OLTP database provided by Microsoft. The database contains data related to a fictional company that sells bicycles and bicycle accessories. 
The database can be downloaded from here (https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms).

I used SQL queries and SSMS to understand the dataset, its structure, relationships, and potential challenges.

- How many tables are there in the database and what are their names and schemas?
- How are the tables related to each other and what are the primary and foreign keys?
- What are the data types and formats of the columns and how consistent are they?
- How many rows and columns are there in each table ?

-...etc.

## Data Warehouse (DWH) Creation

Next, I designed DWH with six tables using SQL Server:

- One fact table (fact_sales) 
- Four dimension tables (dim_customer, dim_date, dim_territory, and dim_product). 
- One metadata table (meta_control_table) that stores and manages the information related to the ETL process, such as the last extraction date, the number of rows inserted, updated, or deleted, the status of the ETL process, etc.

Some steps i followed for data warehouse design, such as:

- Using a star schema to organize the tables in a simple and efficient way that enables optimal query performance and simplified reporting and analysis.
- Using surrogate keys(business key) to identify the rows in the dimension tables and avoid dependency on the natural keys(PK) from the source data.
- Using consistent names for the tables and columns and following the naming conventions for the fact and dimension tables.
- Using appropriate and consistent data types and formats for the columns and ensuring data quality and integrity.
- Using indexes techniques to improve the performance and storage of the tables.



## ETL Tools

The following tools are used for the ETL process of this project:
- SQL Server
- SSIS
- Data Modeling (SQL)
