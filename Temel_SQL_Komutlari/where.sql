--Salih FAYDALÝ isimli musteriyi cekelim.
SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME='Salih FAYDALI'

SELECT * FROM CUSTOMER
WHERE ID=18

SELECT * FROM CUSTOMER
WHERE CITY='SAKARYA'

----AND----

--Pazar / Rize ilcesi disinda Rize'deki musteriler.
SELECT * FROM CUSTOMER
WHERE CITY='Rize' and DISTRICT<>'Pazar / Rize'

----BETWEEN----

--21 ve 23 yas araligindaki musteriler.
SELECT * FROM CUSTOMER
WHERE AGE BETWEEN 20 AND 23
--AGE>=21 AND AGE <=23 ile ayni sonucu verir.


--1998 yilinda dogan musteriler
SELECT * FROM CUSTOMER
WHERE BIRTHDATE BETWEEN '19980101' AND '19981231'

----LIKE----

SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME LIKE 'AHMET'
-- WHERE CUSTOMERNAME = 'AHMET' ile ayni anlamda.

--ismi Ahmet ile baslayan musteriler
SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME LIKE 'Ahmet%'

--isminin icerisinden 'ince' gecenler.
SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME LIKE '%ince%'

--isminin sonunda 'Ornek' olan musteriler.
SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME LIKE '%Örnek'

----IN----

SELECT*FROM CUSTOMER
WHERE CITY='ISPARTA' AND DISTRICT IN ('ULUBORLU', 'YALVAÇ')

----NOT IN----

SELECT*FROM CUSTOMER
WHERE CITY='ISPARTA' AND DISTRICT NOT IN ('ULUBORLU', 'YALVAÇ')

----DELETE ve WHERE----

DELETE FROM CUSTOMER
WHERE CUSTOMERNAME LIKE 'Serhat%'
--Ismi Serhat ile baslayanlari sil

----UPDATE ve WHERE----

UPDATE CUSTOMER SET GENDER='Erkek'
WHERE GENDER='E'

UPDATE CUSTOMER SET GENDER='Kadýn'
WHERE GENDER='K'

SELECT*FROM CUSTOMER