----GROUP BY----

--Subelere gore gruplayarak listeleyelim.
SELECT BRANCH,
	SUM(LINENET) AS TOPLAM_FIYAT,
	COUNT(*) AS SATIS_SAYISI,
	MIN(LINENET) AS MINIMUM_SATIS_FIYATI,
	MAX(LINENET) AS MAXIMUM_SATIS_FIYATI,
	AVG(LINENET) AS ORTALAMA_SATIS_FIYATI
FROM SALES WHERE BRANCH IS NOT NULL --NULL SATIR GELMESIN
GROUP BY BRANCH

--En cok satis yapan subeleri bulalim.
SELECT TOP 5 BRANCH,
	SUM(LINENET) AS TOPLAM_FIYAT,
	COUNT(*) AS SATIS_SAYISI,
	MIN(LINENET) AS MINIMUM_SATIS_FIYATI,
	MAX(LINENET) AS MAXIMUM_SATIS_FIYATI,
	AVG(LINENET) AS ORTALAMA_SATIS_FIYATI
FROM SALES WHERE BRANCH IS NOT NULL
GROUP BY BRANCH
ORDER BY TOPLAM_FIYAT DESC
--BUYUKTEN KUCUGE OLMASI GEREKTIGINDEN DESCENDIN OLMALI

