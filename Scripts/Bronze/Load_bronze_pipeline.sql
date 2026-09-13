/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
SET GLOBAL local_infile = 1;

drop procedure if exists bronze.load_bronze;
DELIMITER $$
create procedure bronze.load_bronze()
begin
SELECT '-------------------------------------------' AS ''; 
SELECT '>> Processing CRM Data load...' AS '';
SELECT '-------------------------------------------' AS '';

TRUNCATE TABLE bronze.crm_cust_info;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/CRM source/cust_info.csv' 
INTO TABLE crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

TRUNCATE TABLE bronze.crm_prd_info;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/CRM source/prd_info.csv' 
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

TRUNCATE TABLE bronze.crm_sales_details;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/CRM source/sales_details.csv' 
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

select '-------------------------------------------' AS ''; 
SELECT '>> Processing EPR Data load...';
select '-------------------------------------------' AS ''; 

TRUNCATE TABLE bronze.erp_CUST_AZ12;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/ERP source/CUST_AZ12.csv' 
INTO TABLE erp_CUST_AZ12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

TRUNCATE TABLE bronze.erp_LOC_A101;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/ERP source/LOC_A101.csv' 
INTO TABLE erp_LOC_A101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
LOAD DATA LOCAL INFILE 'D:/SQL Projects/Data Warehouse/ERP source/PX_CAT_G1V2.csv' 
INTO TABLE erp_PX_CAT_G1V2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
end$$ 
