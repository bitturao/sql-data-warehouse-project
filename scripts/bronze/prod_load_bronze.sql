
/*
Stored Procedure: Load Bronze Layer (Source -> Bronze)
This stored procedure loads data into the 'bronze' schema from external CSV files. 
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Usage Example:
    EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @total_start_time DATETIME, @total_end_time DATETIME;
SET @total_start_time = GETDATE();
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY
	print '=============================';
	Print 'Loading Bronze Layer';
	print '=============================';

	print '-----------------------';
	print 'Loading CRM Tables';
	print '-----------------------';

	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info

	print 'Inserting Data : bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';

	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.crm_prd_info';

	TRUNCATE TABLE bronze.crm_prd_info
	print 'Inserting Data : bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';


	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.crm_sales_details';
	Truncate Table bronze.crm_sales_details
	print 'Inserting Data : bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';

	print '-----------------------';
	print 'Loading CRM Tables';
	print '-----------------------';

	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.erp_cust_az12';
	Truncate Table bronze.erp_loc_a101
	print 'Inserting Data : bronze.erp_cust_az12';
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';

	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.erp_cust_az12';
	Truncate Table bronze.erp_cust_az12
	print 'Inserting Data : bronze.erp_cust_az12';
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';

	SET @start_time = GETDATE();
	print 'Truncating Table: bronze.erp_px_cat_g1v2';
	Truncate Table bronze.erp_loc_a101
	print 'Inserting Data : bronze.erp_px_cat_g1v2';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\bomma\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);
	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';
	END TRY
	BEGIN CATCH
		PRINT '=============================';
		PRINT 'ERROR OCCURED DURING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '=============================';
	END CATCH
	SET @total_end_time = GETDATE();
	PRINT '>> Total Duration: ' + CAST(DATEDIFF(second, @total_start_time, @total_end_time) AS NVARCHAR) + ' seconds';
	PRINT ' -----------------';
END
