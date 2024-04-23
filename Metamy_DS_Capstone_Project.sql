/*DATA ANALYTICS CAPSTONE PROJECT */


/*
Actions to take:
-- delete "column1" from both tables.
--extract "C" from customerid column
--round "area" column with two decimals.
--change the format of "birthdate" and date_sale columns as "dd.mm.yyyy".
--update tables according to actions to be taken above.


*/
SELECT TOP 10*
FROM customers; 

SELECT TOP 10*
FROM properties; 

-- delete "column1" from both tables.
ALTER TABLE customers DROP COLUMN column1;
ALTER TABLE properties DROP COLUMN column1; 

--extract "C" from customerid column

UPDATE customers
SET customerid=RIGHT(customerid,4);

UPDATE properties
SET customerid=
	CASE
		WHEN customerid IS NOT NULL THEN REPLACE(customerid,'C','')
		ELSE customerid
	END;

UPDATE customers
SET customerid=CONVERT(INT,customerid)

UPDATE properties
SET customerid=CONVERT(INT,customerid)

--round "area" column with two decimals.

UPDATE properties
SET area=area/100;


--change the format of "birthdate" and date_sale columns as "dd.mm.yyyy".

------ALTER TABLE customers ADD birth_date2 VARCHAR(10)

------UPDATE customers
------SET birth_date2 = CONVERT(VARCHAR(10), birth_date, 104);
	
-----ALTER TABLE properties ADD date_sale2 VARCHAR(10)

-----UPDATE properties
-----SET date_sale2 = CONVERT(VARCHAR, TRY_CONVERT(DATE,date_sale), 104);

ALTER TABLE properties ADD area_m2 FLOAT 

UPDATE properties
SET area_m2=ROUND(area*0.092903,2);


-----ALTER TABLE customers_clean DROP COLUMN birth_date
-----ALTER TABLE properties_clean DROP COLUMN date_sale



SELECT*
FROM customers_clean As c
RIGHT JOIN properties_clean As p
	ON c.customerid=p.customerid


