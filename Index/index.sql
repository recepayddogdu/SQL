SET STATISTICS IO ON

SELECT * FROM CUSTOMERS
WHERE NAMESURNAME='�MER �OLAKO�LU'


SELECT * FROM CUSTOMERS
WHERE TCNO='10019865823'



SELECT * FROM CUSTOMERS
WHERE ID=168483

SET STATISTICS IO ON
SELECT * FROM CUSTOMERS
WHERE TELNR='03423344747'

CREATE NONCLUSTERED INDEX IX2
ON CUSTOMERS (TELNR)


SET STATISTICS IO ON

SELECT * FROM CUSTOMERS
WHERE BIRTHDATE='1964-03-30'


SP_SPACEUSED 'CUSTOMERS' --included column sonrasinda


