----INNER JOIN----
SELECT USER_.USERNAME_, USER_.NAMESURNAME, 
	   USER_.TELNR1, USER_.TELNR2, ADDRES.ADDRESSTEXT
FROM USER_
JOIN ADDRES ON USER_.ID=ADDRES.USERID
WHERE USERID=152

SELECT USER_.ID, USER_.USERNAME_, ADDRES.* FROM USER_
INNER JOIN ADDRES ON USER_.ID=ADDRES.USERID
WHERE USER_.ID=152

----LEFT JOIN----
SELECT USER_.USERNAME_, ADDRES.* FROM USER_
LEFT JOIN ADDRES ON ADDRES.USERID=USER_.ID
WHERE USER_.ID IN (100,101,102)
--102 ID'li user'in adres kaydi yok.

----RIGHT JOIN----
SELECT USER_.USERNAME_, ADDRES.* FROM USER_
RIGHT JOIN ADDRES ON ADDRES.USERID=USER_.ID
WHERE USER_.ID IN (100,101,102)
--102 ID'li user'in adres kaydi yok.

----FULL JOIN----
SELECT USER_.USERNAME_, ADDRES.* FROM USER_
FULL JOIN ADDRES ON ADDRES.USERID=USER_.ID
WHERE USER_.ID IN (100,101,102)
--102 ID'li user'in adres kaydi yok.


----ALIAS KULLANIMI----
SELECT U.USERNAME_,C.CITY,T.TOWN , D.DISTRICT, A.ADDRESSTEXT FROM USER_ U
LEFT JOIN ADDRES A ON U.ID=A.USERID
LEFT JOIN CITY C ON A.CITYID=C.ID
LEFT JOIN TOWN T ON A.TOWNID=T.ID
LEFT JOIN DISTRICT D ON A.DISTRICTID=D.ID
WHERE U.ID IN (100, 101, 102)


----GROUP BY KULLANIMI----
--Her bir kullanicinin kac adresi oldugunu listeleyelim
SELECT U.ID ,U.USERNAME_, COUNT(A.ID) ADRES_SAYISI, COUNT(DISTINCT C.CITY) SEHIR_SAYISI FROM USER_ U
JOIN ADDRES A ON U.ID=A.USERID
JOIN CITY C ON C.ID=A.CITYID
GROUP BY U.ID ,U.USERNAME_

--Hangi sehirde kac kullanicimiz var?
SELECT C.CITY SEHIR, COUNT(U.ID) [MUSTERƯ SAYISI] FROM CITY C
JOIN ADDRES A ON A.CITYID=C.ID
JOIN USER_ U ON U.ID=A.USERID
GROUP BY C.CITY
ORDER BY COUNT(U.ID) DESC

SELECT * FROM ADDRES
WHERE USERID IN (100,101,102)

--DELETE FROM ADDRES WHERE USERID=102