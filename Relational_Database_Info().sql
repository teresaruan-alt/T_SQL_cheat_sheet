/**************************************************************************************************************
Number of  Schemas in a Database
*****************************************************************************************************************/
USE [Database_Name]
SELECT *
FROM sys.schemas
--name	schema_id	principal_id
--dbo		1		1
--guest		2		2

/*****************************************************************************************************************
Temp/Hash table or permanent table 
*****************************************************************************************************************/
--Permanent table 
IF OBJECT_ID('dbo.Scores', 'U') IS NOT NULL DROP TABLE dbo.Scores; 

--Temporary table
IF OBJECT_ID('tempdb.dbo.#T', 'U') IS NOT NULL DROP TABLE #T; 

/*****************************************************************************************************************
Find CONSTRAINT columns and DESCRIBE tables with a database
*****************************************************************************************************************/
USE [Database_Name]

IF OBJECT_ID('tempdo.dob.#primary_key', 'U') IS NOT NULL DROP TABLE #primary_key
SELECT 
CONS_T.TABLE_CATALOG,
CONS_T.TABLE_SCHEMA,
CONS_T.TABLE_NAME,
CONS_C.COLUMN_NAME,
CONS_T.CONSTRAINT_TYPE,
CONS_T.CONSTRAINT_NAME
INTO  #primary_key
FROM
INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS CONS_T 
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS CONS_C ON CONS_C.CONSTRAINT_NAME= CONS_T.CONSTRAINT_NAME
--SELECT * FROM  #primary_key

SELECT
--SMA.chema_id
SMA.name AS [Schema Name],
ST.name AS [Table Name],
SC.column_id AS [Column Order],
SC.name AS [Column Name],
PKT.CONSTRAINT_TYPE, 
PKT.CONSTRAINT_NAME, 
SC.system_type_id,
STP.name AS [Data Type],
SC.max_length,
SC.precision, 
SC.scale, 
SC.is_nullable, 
SC.is_masked
FROM sys.tables  AS ST
JOIN sys.schemas AS SMA ON SMA.schema_id = ST.schema_id
JOIN sys.columns AS SC ON SC.object_id = ST.object_id 
JOIN sys.types AS STP ON STP.system_type_id = SC.system_type_id
LEFT JOIN #primary_key AS PKT ON PKT.TABLE_SCHEMA = SMA.name
                                 AND PKT.TABLE_NAME = ST.name
								 AND PKT.COLUMN_NAME = SC.name
ORDER BY ST.name ASC, SMA.name ASC



USE [Database_Name]
EXEC sp_help tablename
exec sp_columns tablename
