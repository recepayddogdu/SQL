
--Verilen sartlara gore ilk 5 kayit
SELECT TOP 5 * FROM CUSTOMER
WHERE CITY = 'Ýstanbul'
ORDER BY CUSTOMERNAME 


--Verilen sartlara gore ilk %10'luk kayit.
SELECT TOP 10 PERCENT * FROM CUSTOMER
WHERE AGE BETWEEN 22 AND 24
ORDER BY AGE



