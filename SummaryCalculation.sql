/**************************************************************************************************************
Get a summary subtotal out of a query, single dimension
*****************************************************************************************************************/
IF OBJECT_ID('TempDB..#SAMPLE_TEMP_TABLE', 'U') IS NOT NULL DROP TABLE #SAMPLE_TEMP_TABLE
CREATE TABLE #SAMPLE_TEMP_TABLE
(category VARCHAR(50), 
 product_type VARCHAR(50), 
 product_name VARCHAR(50),
 price NUMERIC(18,2)
)
INSERT INTO #SAMPLE_TEMP_TABLE
VALUES
()
()
()
()

/**************************************************************************************************************
Get a summary subtotal out of a query , multiple dimensions
*****************************************************************************************************************/

SELECT 
ISNULL(A, NULL) AS , 
ISNULL(B, NULL) AS , 
ISNULL(C, 'TOTAL') AS , 
SUM(PRICE) AS PRICE
FROM TEST_TABLE 
GROUP BY GROPUING SETS ((A, B, C), ())

PRINT('Script Execution Time ' + CONVERT(VARCHAR, GETDATE(), 0) + ' BY ' + SYSTEM_USER )