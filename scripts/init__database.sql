/*
=======================================================================
Create Database and Schemas
=======================================================================

Script Purpose:
	This script creates a new database names 'DataWarehouse' after checking if it already exists.
	If the database exists it is dropped and recreted. Additionally, the script sets up three schemas 
	within the database: 'bronze' , 'silver' , 'gold'.

WARNING:
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permenantly deleted. Proceed with caution 
	and ensure you have proper backup before running the script.
*/


USE master;
GO

-- drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Note : here the rollback make sure 
																		  --that db is not currently active in any section
	DROP  DATABASE DataWarehouse
END;
GO

-- create database DataWarehouse
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;

-- create schemas 
CREATE SCHEMA bronze; 
GO -- GO IS JUST ACT LIKE A SEPERATOR. IT SAYS TO SEPERATE THE STATEMENT BEFORE EXECUTE ONE BY ONE

CREATE SCHEMA silver;
GO 

CREATE SCHEMA gold;
GO 
