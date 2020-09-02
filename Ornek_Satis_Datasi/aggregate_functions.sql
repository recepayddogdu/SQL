SELECT * FROM SALES

--Ilcelerdeki toplam satislarini getirelim.
SELECT * FROM SALES
WHERE BRANCH='Kocaeli Subesi'
-- Kocaeli Subesi'de 14.292 satis var.

--Kocaeli subesindeki satislarin toplam fiyati
SELECT SUM(LINENET) AS TOPLAMFIYAT FROM SALES 
WHERE BRANCH='Kocaeli Subesi'
--53.151,02 TL Toplam Satis var.

SELECT SUM(LINENET) AS TOPLAM_SATIS, 
	   COUNT(*) AS SATIR_SAYISI, 
	   MIN(LINENET) AS MINIMUM_SATIS, 
	   MAX(LINENET) AS MAXIMUM_SATIS,
	   AVG(LINENET) AS ORTALAMA_SATIS_FIYATI
FROM SALES 
WHERE BRANCH='Kocaeli Subesi'

SELECT SUM(LINENET) AS TOPLAM_SATIS, 
	   COUNT(*) AS SATIR_SAYISI, 
	   MIN(LINENET) AS MINIMUM_SATIS, 
	   MAX(LINENET) AS MAXIMUM_SATIS,
	   AVG(LINENET) AS ORTALAMA_SATIS_FIYATI
FROM SALES 
WHERE BRANCH='istanbul Subesi'