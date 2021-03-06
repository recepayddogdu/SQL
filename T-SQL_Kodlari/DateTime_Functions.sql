----DATE TIME-FONKSIYONLARI----
--DATEADD
--Belirledigimiz bir tarihe ekleme yapmamizi saglar
DECLARE @TARIH AS DATETIME
SET @TARIH='2019-01-01 16:21:37'
DECLARE @TARIH2 AS DATETIME
SET @TARIH2=DATEADD(MONTH,6,@TARIH)
SELECT @TARIH, @TARIH2

--DATEDIFF
--�ki tarih aras�ndaki fark� hesaplar
DECLARE @TARIH AS DATETIME
SET @TARIH='2019-01-01 16:21:37'
DECLARE @TARIH2 AS DATETIME
SET @TARIH2='2019-07-01 16:21:37'
SELECT DATEDIFF(MONTH, @TARIH, @TARIH2) AS FARK*

--DATEFROMPARTS
DECLARE @TARIH AS DATE
SELECT @TARIH=DATEFROMPARTS(2020,07,20)
SELECT @TARIH

--DATEPART
DECLARE @TARIH AS DATE
SELECT @TARIH=DATEFROMPARTS(2020,07,20)
SELECT DATEPART(YEAR, @TARIH)

--Dogum tarihi girilen birinin yasini hesap edelim
DECLARE @DOGUMTARIHI AS DATE
SET @DOGUMTARIHI='1999-11-13'
DECLARE @YAS AS INT
SET @YAS=DATEDIFF(YEAR,@DOGUMTARIHI, GETDATE())
SELECT @YAS