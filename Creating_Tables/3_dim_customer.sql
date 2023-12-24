use ssis_AdventureWorksDW2014

go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_customer'
                  AND parent_object_id = Object_id('fact_sales'))
  ALTER TABLE fact_sales
    DROP CONSTRAINT fk_fact_sales_dim_customer;

CREATE TABLE dim_customer
  (
     customer_key       INT NOT NULL IDENTITY(1, 1),
     customer_id        INT NOT NULL,
     customer_name      NVARCHAR(150),
     address1           NVARCHAR(100),
     address2           NVARCHAR(100),
     city               NVARCHAR(30),
     phone              NVARCHAR(25),
     -- birth_date date,
     -- marital_status char(10),
     -- gender char(1),
     -- yearly_income money,
     -- education varchar(50),
     source_system_code TINYINT NOT NULL,
     start_date         DATETIME NOT NULL DEFAULT (Getdate()),
     end_date           DATETIME NULL,
     is_current         TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_key)
  );


-- Insert unknown record to ensure unique values
INSERT INTO dim_customer
            (customer_key, customer_id, customer_name, address1, address2,city, phone,
			source_system_code, start_date, end_date, is_current)
VALUES      (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown',
			 0, '1900-01-01', NULL, 1 )

SET IDENTITY_INSERT dim_customer OFF

-- Create Indexes
CREATE INDEX dim_customer_customer_id
  ON dim_customer(customer_id);

CREATE INDEX dim_customer_city
  ON dim_customer(city); 
