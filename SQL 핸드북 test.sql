USE hhddb;



SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC;
--prod_id    prod_price                              prod_name
------------ --------------------------------------- ----------------------------------------
--BR03       11.99                                   18 inch teddy bear                      
--RYL01      9.49                                    King doll                               
--RYL02      9.49                                    Queen doll                              
--BR02       8.99                                    12 inch teddy bear                      
--BR01       5.99                                    8 inch teddy bear                       
--RGAN01     4.99                                    Raggedy Ann                             
--BNBG01     3.49                                    Fish bean bag toy                       
--BNBG02     3.49                                    Bird bean bag toy                       
--BNBG03     3.49                                    Rabbit bean bag toy                     



SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;

--prod_name                                prod_price
------------------------------------------ ---------------------------------------
--8 inch teddy bear                        5.99
--12 inch teddy bear                       8.99
--King doll                                9.49
--Queen doll                               9.49



SELECT prod_name, prod_price
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER by prod_name;

--prod_name                                prod_price
------------------------------------------ ---------------------------------------
--12 inch teddy bear                       8.99
--18 inch teddy bear                       11.99
--8 inch teddy bear                        5.99
--Bird bean bag toy                        3.49
--Fish bean bag toy                        3.49
--Rabbit bean bag toy                      3.49
--Raggedy Ann                              4.99

--(7개 행이 영향을 받음)



SELECT prod_name
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_id;

--prod_name
------------------------------------------
--8 inch teddy bear                       
--12 inch teddy bear                      
--18 inch teddy bear                      
--King doll                               
--Queen doll                              

--(5개 행이 영향을 받음)



SELECT prod_name
FROM Products
WHERE prod_name LIKE 'F%y';

--prod_name
------------------------------------------
--Fish bean bag toy                       



SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%';

--cust_contact
------------------------------------------
--John Smith                              
--Michelle Green                          
--Jim Jones                               

--(3개 행이 영향을 받음)



SELECT AVG(prod_price) AS avg_price
FROM Products;

--avg_price
-----------------------------------------
--6.823333



SELECT vend_id, COUNT(*) as num_prod
FROM Products
GROUP BY vend_id;

--vend_id    num_prod
------------ -----------
--BRS01      3
--DLL01      4
--FNG01      2



SELECT vend_id, COUNT(*) as num_prod
FROM Products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;
--vend_id    num_prod
------------ -----------
--BRS01      3
--FNG01      2



SELECT cust_id
FROM Orders
WHERE order_num IN 
(
    SELECT order_num
    FROM OrderItems
    WHERE prod_id = 'RGAN01'
);

--cust_id
------------
--1000000004
--1000000005



SELECT vend_name, prod_name, prod_price
FROM Vendors INNER JOIN Products
ON Vendors.vend_id = Products.vend_id;

--vend_name                                prod_name                                prod_price
------------------------------------------ ---------------------------------------- ---------------------------------------
--Doll House Inc.                          Fish bean bag toy                        3.49
--Doll House Inc.                          Bird bean bag toy                        3.49
--Doll House Inc.                          Rabbit bean bag toy                      3.49
--Bears R Us                               8 inch teddy bear                        5.99
--Bears R Us                               12 inch teddy bear                       8.99
--Bears R Us                               18 inch teddy bear                       11.99
--Doll House Inc.                          Raggedy Ann                              4.99
--Fun and Games                            King doll                                9.49
--Fun and Games                            Queen doll                               9.49



SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
    AND OrderItems.prod_id = Products.prod_id
    AND order_num = 20007;

--prod_name                                vend_name                                prod_price ...
------------------------------------------ ---------------------------------------- -----------...
--18 inch teddy bear                       Bears R Us                               11.99      ...
--Fish bean bag toy                        Doll House Inc.                          3.49       ...
--Bird bean bag toy                        Doll House Inc.                          3.49       ...
--Rabbit bean bag toy                      Doll House Inc.                          3.49       ...
--Raggedy Ann                              Doll House Inc.                          4.99       ...



SELECT c.cust_name AS '고객이름', c.cust_contact AS '고객주소'
FROM Customers AS c, Orders AS o, OrderItems AS oi
WHERE c.cust_id = o.cust_id
    AND oi.order_num = o.order_num
    AND prod_id = 'RGAN01';

--고객이름                                     고객주소
------------------------------------------ ----------------------------------------
--Fun4All                                  Denise L. Stephens                      
--The Toy Store                            Kim Howard                              



SELECT Customers.cust_id, Orders.order_num
FROM Customers INNER JOIN Orders
ON Customers.cust_id = orders.cust_id;

--cust_id    order_num
------------ -----------
--1000000001 20005
--1000000003 20006
--1000000004 20007
--1000000005 20008
--1000000001 20009



SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = orders.cust_id;

--cust_id    order_num
------------ -----------
--1000000001 20005
--1000000001 20009
--1000000002 NULL
--1000000003 20006
--1000000004 20007
--1000000005 20008




(
    SELECT cust_name, cust_contact 
    FROM Customers
    WHERE cust_state IN ('IL', 'IN', 'MI')
)
UNION
(
    SELECT * 
    FROM Customers
    WHERE cust_name = 'Fun4All'
);
--cust_id    cust_name                                cust_address                             cust_city    ...
------------ ---------------------------------------- ---------------------------------------- -------------...
--1000000001 Village Toys                             200 Maple Lane                           Detroit      ...
--1000000003 Fun4All                                  1 Sunny Place                            Muncie       ...
--1000000004 Fun4All                                  829 Riverside Drive                      Phoenix      ...
--1000000005 The Toy Store                            4545 53rd Street                         Chicago      ...




DROP TABLE CustomersNew;

CREATE TABLE CustomersNew
(
  cust_id      char(10)  NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL 
);

INSERT INTO CustomersNew
SELECT *
FROM Customers;

SELECT *
FROM CustomersNew;

--(5개 행이 영향을 받음)
--cust_id    cust_name                                cust_address                             cust_city ...
------------ ---------------------------------------- ---------------------------------------- ----------...
--1000000001 Village Toys                             200 Maple Lane                           Detroit   ...
--1000000002 Kids Place                               333 South Lake Drive                     Columbus  ...
--1000000003 Fun4All                                  1 Sunny Place                            Muncie    ...
--1000000004 Fun4All                                  829 Riverside Drive                      Phoenix   ...
--1000000005 The Toy Store                            4545 53rd Street                         Chicago   ...

--(5개 행이 영향을 받음)



UPDATE Customers
SET cust_email = 'kim@thetoystore.com'
WHERE cust_id = '1000000005';

SELECT * 
FROM Customers 
WHERE cust_id = '1000000005';

--(1개 행이 영향을 받음)
--cust_id    cust_name                                cust_address                             cust_city ...
------------ ---------------------------------------- ---------------------------------------- ----------...
--1000000005 The Toy Store                            4545 53rd Street                         Chicago   ...

--(1개 행이 영향을 받음)



SELECT * FROM CustomersNew
WHERE cust_id = '1000000005';

DELETE FROM CustomersNew
WHERE cust_id = '1000000005';

SELECT * FROM CustomersNew
WHERE cust_id = '1000000005';

--cust_id    cust_name                                cust_address                             cust_city   ...
------------ ---------------------------------------- ---------------------------------------- ------------...
--1000000005 The Toy Store                            4545 53rd Street                         Chicago     ...
                                                                                                           ...
--(1개 행이 영향을 받음)                                                                                   ...
                                                                                                           ...
--(1개 행이 영향을 받음)                                                                                   ...
                                                                                                           ...
--cust_id    cust_name                                cust_address                             cust_city   ...
------------ ---------------------------------------- ---------------------------------------- ------------...

--(0개 행이 영향을 받음)



SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Vendors';

alter table Vendors
add vend_phone char(20);

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Vendors';

alter table Vendors
drop column vend_phone;

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Vendors';

--TABLE_CATALOG           TABLE_SCHEMA  TABLE_NAME  COLUMN_NAME   ...
------------------------- ------------- ----------- --------------...
--hhddb                   dbo           Vendors     vend_id       ...
--hhddb                   dbo           Vendors     vend_name     ...
--hhddb                   dbo           Vendors     vend_address  ...
--hhddb                   dbo           Vendors     vend_city     ...
--hhddb                   dbo           Vendors     vend_state    ...
--hhddb                   dbo           Vendors     vend_zip      ...
--hhddb                   dbo           Vendors     vend_country  ...
                                                                  ...
--(7개 행이 영향을 받음)                                          ...
                                                                  ...
--TABLE_CATALOG           TABLE_SCHEMA  TABLE_NAME  COLUMN_NAME   ...
------------------------- ------------- ----------- --------------...
--hhddb                   dbo           Vendors     vend_id       ...
--hhddb                   dbo           Vendors     vend_name     ...
--hhddb                   dbo           Vendors     vend_address  ...
--hhddb                   dbo           Vendors     vend_city     ...
--hhddb                   dbo           Vendors     vend_state    ...
--hhddb                   dbo           Vendors     vend_zip      ...
--hhddb                   dbo           Vendors     vend_country  ...
--hhddb                   dbo           Vendors     vend_phone    ...
                                                                  ...
--(8개 행이 영향을 받음)                                          ...
                                                                  ...
--TABLE_CATALOG           TABLE_SCHEMA  TABLE_NAME  COLUMN_NAME   ...
------------------------- ------------- ----------- --------------...
--hhddb                   dbo           Vendors     vend_id       ...
--hhddb                   dbo           Vendors     vend_name     ...
--hhddb                   dbo           Vendors     vend_address  ...
--hhddb                   dbo           Vendors     vend_city     ...
--hhddb                   dbo           Vendors     vend_state    ...
--hhddb                   dbo           Vendors     vend_zip      ...
--hhddb                   dbo           Vendors     vend_country  ...

--(7개 행이 영향을 받음)



CREATE PROCEDURE sp_new_order @cust_id CHAR(10)
AS
    DECLARE @order_num INTEGER;

    SELECT @order_num = MAX(order_num)
    FROM Orders;

    SELECT @order_num = @order_num + 1;

    INSERT INTO Orders(order_num, order_date, cust_id)
    VALUES(@order_num, GETDATE(), @cust_id);

    RETURN @order_num;
GO

SELECT * FROM sys.procedures;

SELECT * FROM Orders;

EXECUTE sp_new_order '1000000001';
EXECUTE sp_new_order '1000000001';
EXECUTE sp_new_order '1000000001';

SELECT * FROM Orders;

DROP PROCEDURE sp_new_order;

--name                                     object_id   principal_id schema_id   parent_object_id type type_desc                                ...
------------------------------------------ ----------- ------------ ----------- ---------------- ---- ---------------------------------------- ...
--sp_new_order                             869578136   NULL         1           0                P    SQL_STORED_PROCEDURE                     ...

--(1개 행이 영향을 받음)

--order_num   order_date              cust_id
------------- ----------------------- ----------
--20005       2004-05-01 00:00:00.000 1000000001
--20006       2004-01-12 00:00:00.000 1000000003
--20007       2004-01-30 00:00:00.000 1000000004
--20008       2004-02-03 00:00:00.000 1000000005

--(4개 행이 영향을 받음)

--(1개 행이 영향을 받음)


--(1개 행이 영향을 받음)

--(1개 행이 영향을 받음)
--order_num   order_date              cust_id
------------- ----------------------- ----------
--20005       2004-05-01 00:00:00.000 1000000001
--20006       2004-01-12 00:00:00.000 1000000003
--20007       2004-01-30 00:00:00.000 1000000004
--20008       2004-02-03 00:00:00.000 1000000005
--20009       2004-02-08 00:00:00.000 1000000001
--20010       2015-10-01 14:20:39.107 1000000001
--20011       2015-10-01 14:20:39.113 1000000001

--(7개 행이 영향을 받음)






BEGIN TRANSACTION;
SAVE TRANSACTION start_point;

SELECT * 
FROM OrderItems;

--order_num   order_item  prod_id    quantity    item_price
------------- ----------- ---------- ----------- ---------------------------------------
--20005       1           BR01       100         5.49
--20005       2           BR03       100         10.99
--20006       1           BR01       20          5.99
--20006       2           BR02       10          8.99
--20006       3           BR03       10          11.99
--20007       1           BR03       50          11.49
--20007       2           BNBG01     100         2.99
--20007       3           BNBG02     100         2.99
--20007       4           BNBG03     100         2.99
--20007       5           RGAN01     50          4.49
--20008       1           RGAN01     5           4.99
--20008       2           BR03       5           11.99
--20008       3           BNBG01     10          3.49
--20008       4           BNBG02     10          3.49
--20008       5           BNBG03     10          3.49
--20009       1           BNBG01     250         2.49
--20009       2           BNBG02     250         2.49
--20009       3           BNBG03     250         2.49



DELETE OrderItems 
WHERE order_num = 20005;

SELECT * 
FROM OrderItems;

--order_num   order_item  prod_id    quantity    item_price
------------- ----------- ---------- ----------- ---------------------------------------
--20006       1           BR01       20          5.99
--20006       2           BR02       10          8.99
--20006       3           BR03       10          11.99
--20007       1           BR03       50          11.49
--20007       2           BNBG01     100         2.99
--20007       3           BNBG02     100         2.99
--20007       4           BNBG03     100         2.99
--20007       5           RGAN01     50          4.49
--20008       1           RGAN01     5           4.99
--20008       2           BR03       5           11.99
--20008       3           BNBG01     10          3.49
--20008       4           BNBG02     10          3.49
--20008       5           BNBG03     10          3.49
--20009       1           BNBG01     250         2.49
--20009       2           BNBG02     250         2.49
--20009       3           BNBG03     250         2.49



SELECT * 
FROM Orders;

--order_num   order_date              cust_id
------------- ----------------------- ----------
--20005       2004-05-01 00:00:00.000 1000000001
--20006       2004-01-12 00:00:00.000 1000000003
--20007       2004-01-30 00:00:00.000 1000000004
--20008       2004-02-03 00:00:00.000 1000000005
--20009       2004-02-08 00:00:00.000 1000000001



DELETE Orders
WHERE order_num = 20005;

--(1개 행이 영향을 받음)



SELECT * 
FROM Orders;

--order_num   order_date              cust_id
------------- ----------------------- ----------
--20006       2004-01-12 00:00:00.000 1000000003
--20007       2004-01-30 00:00:00.000 1000000004
--20008       2004-02-03 00:00:00.000 1000000005
--20009       2004-02-08 00:00:00.000 1000000001



DELETE Orders
WHERE order_num = 20006;

IF @@ERROR <> 0
BEGIN
    PRINT N'에러 발생함 start_point 로 롤백함...';
    ROLLBACK TRANSACTION start_point;
END

--메시지 547, 수준 16, 상태 0, 줄 22
--DELETE 문이 REFERENCE 제약 조건 "FK_OrderItems_Orders"과(와) 충돌했습니다. 데이터베이스 "hhddb", 테이블 "dbo.OrderItems", column 'order_num'에서 충돌이 발생했습니다.
--문이 종료되었습니다.
--에러 발생함 start_point 로 롤백함...



SELECT * 
FROM Orders;

--order_num   order_date              cust_id
------------- ----------------------- ----------
--20005       2004-05-01 00:00:00.000 1000000001
--20006       2004-01-12 00:00:00.000 1000000003
--20007       2004-01-30 00:00:00.000 1000000004
--20008       2004-02-03 00:00:00.000 1000000005
--20009       2004-02-08 00:00:00.000 1000000001



COMMIT TRANSACTION;






SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Products';

CREATE INDEX idx_prod_name
ON Products(prod_name);

SELECT *
FROM sys.indexes
WHERE name LIKE 'idx_%';

DROP INDEX idx_prod_name 
ON Products;

--TABLE_CATALOG  TABLE_SCHEMA  TABLE_NAME  COLUMN_NAME  ...
---------------- ------------- ----------- -------------...
--hhddb          dbo           Products    prod_id      ...
--hhddb          dbo           Products    vend_id      ...
--hhddb          dbo           Products    prod_name    ...
--hhddb          dbo           Products    prod_price   ...
--hhddb          dbo           Products    prod_desc    ...

--(5개 행이 영향을 받음)

--object_id   name           index_id    type type_desc      is_unique data_space_id ...
------------- -------------- ----------- ---- -------------- --------- ------------- ...
--293576084   idx_prod_name  2           2    NONCLUSTERED   0         1             ...

--(1개 행이 영향을 받음)