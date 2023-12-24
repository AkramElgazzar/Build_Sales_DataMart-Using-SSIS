use ssis_AdventureWorksDW2014

go

-- dropping the foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_product'
                  AND parent_object_id = Object_id('fact_sales'))
  ALTER TABLE fact_sales
    DROP CONSTRAINT fk_fact_sales_dim_product;

CREATE TABLE dim_product
  (
     product_key         INT NOT NULL IDENTITY(1, 1),
     product_id          INT NOT NULL,
     product_name        NVARCHAR(50),
     Product_description NVARCHAR(400),
     product_subcategory NVARCHAR(50),
     product_category    NVARCHAR(50),
     color               NVARCHAR(15),
     model_name          NVARCHAR(50),
     reorder_point       SMALLINT,
     standard_cost       MONEY,
     -- Metadata
     source_system_code  TINYINT NOT NULL,
     -- SCD
     start_date          DATETIME NOT NULL DEFAULT (Getdate()),
     end_date            DATETIME,
     is_current          TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_product PRIMARY KEY CLUSTERED (product_key)
  );

  SET IDENTITY_INSERT dim_product ON


-- Insert unknown record to ensure unique values
INSERT INTO dim_product
            (product_key, product_id, product_name, Product_description, product_subcategory, product_category, 
			color, model_name, reorder_point, standard_cost, source_system_code, start_date, end_date, is_current)
VALUES      (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 
			'Unknown', 'Unknown',0, 0, 0,'1900-01-01', NULL, 1)

SET IDENTITY_INSERT dim_product OFF


--craete INDEXES

CREATE INDEX dim_product_product_id
  ON dim_product(product_id);


CREATE INDEX dim_prodct_product_category
  ON dim_product(product_category);