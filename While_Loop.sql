
/**************************************************************************************
how to leverage a while loop to simplify a query instead of writing multiple hash tables
For Example: 
we have product keys: 123, 234, 567
**************************************************************************************/

USE [DATABASE_NAME]

-- Set up initial position and assign to a variable for the while loop 
DECLARE @ProductKey INT  = 1
--or DECLARE @ProductFlag INT  SET @ProductFlag = 1

--Set up the ending position of the loop, it's similar to "BREAK" in Python's while loop
WHILE (@ProductKey <= 567) 
BEGIN --use BEGIN AND END to group blocks of code into a session
	IF @ProductKey IN (1, 123, 234, 567) --condition 
		BEGIN 

		---blocks of code
		
		END 
	SET @ProductKey = @ProductKey +1  -- incremental
	--SET @ProductKey += 1  -- like c language i += 1 or ++i 
END
