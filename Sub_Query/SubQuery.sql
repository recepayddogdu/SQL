
--Bir musterinin kac adet alisveris yaptigini bulalim
SELECT U.ID, U.USERNAME_, COUNT(B.ID)
FROM USER_ U
JOIN BASKET B ON B.USERID=U.ID
GROUP BY U.ID, U.USERNAME_

--Ayni sorguyu SUBQUERY ile yapmak istersek;
SELECT U.ID, U.USERNAME_, 
(SELECT COUNT(B.ID) FROM BASKET B WHERE USERID=U.ID)
FROM USER_ U
WHERE (SELECT COUNT(B.ID) FROM BASKET B WHERE USERID=U.ID)>0


--Sub Query ile musteri bilgisi getirme
SELECT U.ID, U.USERNAME_,
(SELECT COUNT(*) FROM BASKET WHERE USERID=U.ID) AS BASKETCOUNT,
(SELECT MIN(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS FIRSTBASKETDATE,
(SELECT MAX(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS LASTBASKETDATE,
(SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID 
	IN (SELECT ID FROM BASKET WHERE USERID=U.ID)) AS TOTAL,
(SELECT COUNT(*) FROM BASKETDETAIL WHERE BASKETID
	IN (SELECT ID FROM BASKET WHERE USERID=U.ID)) AS COUNT_
FROM USER_ U
WHERE (SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID IN 
	  (SELECT ID FROM BASKET WHERE USERID=U.ID))>0

--Ayni sorguyu JOIN ile yaparsak;
SELECT U.ID, U.USERNAME_, COUNT(DISTINCT B.ID) BASKETCOUNT, MIN(B.CREATEDDATE) FIRSTBASKETDATE,
	   MAX(B.CREATEDDATE) LASTBASKETDATE, SUM(BD.TOTAL) TOTAL, COUNT(DISTINCT BD.ID) COUNT_
FROM USER_ U
JOIN BASKET B ON B.USERID=U.ID
JOIN BASKETDETAIL BD ON BD.BASKETID=B.ID
GROUP BY U.ID, U.USERNAME_

--Musterinin Sepetine Ekledigi Son Urun
SELECT U.ID, U.USERNAME_,
(SELECT COUNT(*) FROM BASKET WHERE USERID=U.ID) AS BASKETCOUNT,
(SELECT MIN(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS FIRSTBASKETDATE,
(SELECT MAX(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS LASTBASKETDATE,
(SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID 
	IN (SELECT ID FROM BASKET WHERE USERID=U.ID)) AS TOTAL,
(SELECT COUNT(*) FROM BASKETDETAIL WHERE BASKETID
	IN (SELECT ID FROM BASKET WHERE USERID=U.ID)) AS COUNT_,
(SELECT ITEMNAME FROM ITEM WHERE ID IN
	(SELECT TOP 1 ITEMID FROM BASKETDETAIL WHERE BASKETID IN
		(SELECT ID FROM BASKET WHERE USERID=U.ID)
		ORDER BY DATE_ DESC
		)) AS LASTITEMNAME
FROM USER_ U
WHERE (SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID IN 
	  (SELECT ID FROM BASKET WHERE USERID=U.ID))>0

-----------------------------------------

SELECT U.ID, U.USERNAME_,
(SELECT COUNT(*) FROM BASKET WHERE USERID=U.ID) AS BASKETCOUNT,
(SELECT MIN(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS FIRSTDATE,
(SELECT MAX(CREATEDDATE) FROM BASKET WHERE USERID=U.ID) AS LASTDATE,
(SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID IN 
	(SELECT ID FROM BASKET WHERE USERID=U.ID)) AS TOTAL,
(SELECT COUNT(*) FROM BASKETDETAIL WHERE BASKETID IN
	(SELECT ID FROM BASKET WHERE USERID=U.ID)) AS COUNT_,
(SELECT ITEMNAME FROM ITEM WHERE ID IN
	(SELECT TOP 1 ITEMID FROM BASKETDETAIL WHERE BASKETID IN
		(SELECT ID FROM BASKET WHERE USERID=U.ID)
	ORDER BY DATE_ DESC)) AS LASTITEMNAME
FROM USER_ U
WHERE (SELECT SUM(TOTAL) FROM BASKETDETAIL WHERE BASKETID IN
		(SELECT ID FROM BASKET WHERE USERID=U.ID))>0
