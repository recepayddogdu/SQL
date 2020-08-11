----Magazalarin Musteri Sayisini Hesaplama----

SELECT BRANCH, COUNT(DISTINCT CLIENTNAME) FROM SALES
GROUP BY BRANCH
ORDER BY COUNT(DISTINCT CLIENTNAME) DESC
--Her bir musteriyi bir kez saymasi icin DISTINCT fonksiyonunu kullandik.


--Bir musteri birden fazla magazadan alisveris yapmis olabilir mi?
SELECT CLIENTNAME, COUNT(DISTINCT BRANCH) FROM SALES
WHERE CLIENTNAME IS NOT NULL
GROUP BY CLIENTNAME
HAVING COUNT(DISTINCT BRANCH)>5 --5'Den fazla magazaya giden musteriler
ORDER BY COUNT(DISTINCT BRANCH) DESC

--Arzu ALPER'in gittigi magazalar
SELECT DISTINCT BRANCH FROM SALES
WHERE CLIENTNAME='Arzu ALPER'