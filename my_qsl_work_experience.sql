-- CREATE TABLE Science_class (
-- 	Enrollment_no INT,
-- 	Name VARCHAR,
-- 	Science_Marks INT
-- );

-- INSERT INTO Science_class VALUES ( 1, 'Popeye', 33 ), ( 2, 'Olive', 54 ), (3, 'Brutus', 98);

-- COPY Science_class (Enrollment_no, Name, Science_Marks ) FROM 'C:\Users\TontonLaForce\Desktop\SQL Masterclass SQL for Data Analytics\Student.csv' DELIMITER ',' csv header;

-- SELECT * FROM Science_class;

-- SELECT DISTINCT Name FROM Science_class WHERE Science_Marks > 60;

-- SELECT * FROM Science_class WHERE Science_Marks BETWEEN 35 AND 60;

-- SELECT * FROM Science_class WHERE Science_Marks NOT BETWEEN 35 AND 60;

-- UPDATE Science_class SET Science_Marks=5 WHERE Name='Popeye';

-- DELETE FROM Science_class WHERE Name='Robb';

-- ALTER TABLE Science_class RENAME COLUMN Name TO student_name;

-- DROP TABLE Science_class ;


-- CREATE TABLE Science_class (
-- 	Enrollment_no INT,
-- 	Name VARCHAR,
-- 	Science_Marks INT
-- );

--  COPY Science_class (Enrollment_no, Name, Science_Marks ) FROM 'C:\Users\TontonLaForce\Desktop\SQL Masterclass SQL for Data Analytics\Student.csv' DELIMITER ',' csv header;
 
 SELECT DISTINCT city
 FROM customer
 WHERE region IN ( 'North', 'East' );
 
 SELECT * FROM customer;
 
 SELECT * FROM sales
 WHERE sales BETWEEN 100 AND 500;
 
 SELECT * FROM customer 
 WHERE customer_name LIKE '%___';
 
 SELECT * FROM sales
 WHERE discount >= 0 
 ORDER BY discount DESC;
 

 SELECT * FROM sales
 WHERE discount >= 0 
 ORDER BY discount DESC
 LIMIT 10;
 
 SELECT SUM ( sales ) "sum of all sales value"
 FROM sales;
 
 SELECT COUNT( customer_id )
 FROM customer
 WHERE region = 'North' AND ( age BETWEEN 20 AND 30 );
 
 SELECT AVG( age )
 FROM customer
 WHERE region = 'East';
 
 SELECT MIN( age ), MAX( age )
 FROM customer
 WHERE city = 'Philadelphia';
 
 SELECT product_id, SUM( sales )
 FROM sales
 GROUP BY product_id
 ORDER BY product_id DESC;
 
 SELECT product_id, SUM( quantity )
 FROM sales
 GROUP BY product_id
 ORDER BY product_id DESC;
 
SELECT product_id, COUNT( order_id )
 FROM sales
 GROUP BY product_id
 ORDER BY product_id DESC;
 
 SELECT product_id, MAX( sales )
 FROM sales
 GROUP BY product_id
 ORDER BY product_id DESC;
 
  SELECT product_id, MIN( sales )
 FROM sales
 GROUP BY product_id
 ORDER BY product_id DESC;
 
  SELECT product_id
 FROM sales
 GROUP BY product_id
 HAVING sum(quantity) >= 10
 ORDER BY product_id DESC;
 
 CREATE VIEW customer_20_60 AS SELECT * FROM customer WHERE age BETWEEN 20 AND 60;
 CREATE VIEW sales_2015 AS SELECT * FROM sales WHERE ship_date BETWEEN '2015-01-01' AND '2015-12-31';
 
 SELECT c.state, SUM( s.sales )
 FROM customer_20_60 c
 INNER JOIN sales_2015 s
 ON c.customer_id = s.customer_id
 GROUP BY c.state;
 
 SELECT p.product_id, p.product_name, p.category,SUM( sales ), SUM( quantity )
 FROM sales s
 INNER JOIN product p
 ON s.product_id = p.product_id
 GROUP BY p.product_id, p.product_name, p.category;
 
 SELECT pc.*, c.customer_name, c.age
 FROM ( SELECT customer_id, customer_name, age  FROM customer ) as c
 RIGHT JOIN ( SELECT p.product_name, p.category, s.* FROM product p RIGHT JOIN sales s ON p.product_id = s.product_id ) AS pc
 ON c.customer_id = pc.customer_id;
 
CREATE VIEW Daily_Billing AS 
( 
	SELECT order_line, product_id, sales, discount 
	FROM sales 
	WHERE order_date IN( SELECT MAX( order_date ) FROM sales )
);

DROP VIEW Daily_Billing;
 
 SELECT MAX( LENGTH( product_name ) ) FROM product;
 
 SELECT product_name, sub_category, category, product_name || ' ' || sub_category || ' ' || category  FROM product;
 
 SELECT STRING_AGG( product_name, ',') FROM product
 WHERE sub_category IN ( 'Chairs', 'Tables');
 
 SELECT FLOOR( random()*6 ) ;
 
 SELECT customer_id, SUM( CEIL( sales ) ), SUM( FLOOR( sales ) ), SUM( ROUND( sales ) )
 FROM sales
 GROUP BY customer_id;
 
 SELECT AGE( CURRENT_DATE, '1939-04-06')
 FROM customer
 WHERE customer_name = 'Batman';
 

 
 
 
 
 