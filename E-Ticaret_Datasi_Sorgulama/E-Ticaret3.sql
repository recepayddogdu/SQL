
--En cok satis yapilan 10 musteri
SELECT TOP 10 U.USERNAME_, U.NAMESURNAME, SUM(BD.TOTAL) AS TOTAL
FROM USER_ U
INNER JOIN BASKET B ON B.USERID=U.ID
INNER JOIN BASKETDETAIL BD ON BD.BASKETID=B.ID
GROUP BY U.USERNAME_, U.NAMESURNAME
ORDER BY SUM(BD.TOTAL) DESC


--En cok satis yapilan urun kategorileri
SELECT I.CATEGORY1,I.CATEGORY2, I.CATEGORY3, SUM(OD.TOTALPRICE) AS TOTAL
FROM ITEM I
INNER JOIN ORDERDETAIL OD ON OD.ITEMID=I.ID
INNER JOIN ORDER_ O ON O.ID=OD.ORDERID
GROUP BY I.CATEGORY1,I.CATEGORY2, I.CATEGORY3
ORDER BY SUM(OD.TOTALPRICE) DESC


--2018-2020'de alisveris yapan kadin ve erkek musteriler
SELECT U.GENDER, SUM(BD.TOTAL) AS TOTAL
FROM USER_ U
INNER JOIN BASKET B ON B.USERID=U.ID
INNER JOIN BASKETDETAIL BD ON BD.BASKETID=B.ID
WHERE B.CREATEDDATE BETWEEN '20180101' AND '20201231'
GROUP BY U.GENDER
