/*******************************************************************************************************
Pivot Query: Dynamic
********************************************************************************************************/
DECLARE @SqlQuery VARCHAR(MAX)

--Create an empty list to append values to pivot 
DECLARE @QtrEnd VARCHAR(MAX) ='' 

;With T1 AS(
           SELECT DISTINCT quarter_end_period 
	       FROM sales_table)
SELECT @QtrEnd += QUOTENAME(quarter_end_period ) + ','   -- "+=" is for the increamental 
FROM T1
ORDER BY quarter_end_period  ASC 
--PRINT@QtrEnd


--Remove last comma at the end fo @QtrEnd
SET @QtrEnd = LEFT(@QtrEnd, LEN(@QtrEnd)-1)
--PRINT@QtrEnd


--Incorporate Dynamic Pivot Query 
'
SELECT * 
FROM 
	(SELECT [accounting_month_end], 
			[QtrEnd],
			[Product_id],
	        [product_name], 
			--SUM([qtr]) AS [item_sold], 
			SUM([amounts]) 
	FROM sales_table) MAIN
PIVOT
(
SUM([amounts]) FOR [QtrEnd] IN 
('+ @QtrEnd +')  AS P
ORDER BY [accounting_month_end],[Product_id], [product_name]'

--PRINT @SqlQuery
EXECUTE(@SqlQuery)