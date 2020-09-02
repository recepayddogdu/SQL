CREATE TABLE TARIHLER (ID INT IDENTITY(1,1), TARIH DATETIME2(7))

DECLARE @I AS INT=0
WHILE @I<10
BEGIN
	INSERT INTO TARIHLER (TARIH) VALUES (GETDATE())
	WAITFOR DELAY '00:00:02' --2 saniye bekleyerek gerceklestir.
	SET @I=@I+1
END

SELECT * FROM TARIHLER
----------------------------------------------------------------------
--RASTGELE KISI OLUSTURMA
DECLARE @I AS INT=0
DECLARE @AD AS VARCHAR(50)
DECLARE @CINSIYET AS VARCHAR(1)
DECLARE @SOYAD AS VARCHAR(50)
DECLARE @DOGUMTARIHI AS DATE
DECLARE @YAS AS INT
DECLARE @YASGRUBU AS VARCHAR(30)

WHILE @I<1000
BEGIN
SELECT @AD=AD, @CINSIYET=CINSIYET FROM ISIMLER WHERE ID=ROUND(RAND()*611,0)
SELECT @SOYAD=SOYISIM FROM SOYISIMLER WHERE ID=ROUND(RAND()*1000,0)
SET @DOGUMTARIHI=DATEADD(DAY,ROUND(RAND()*18250,0),'1950-01-01')
SET @YAS=DATEDIFF(YEAR,@DOGUMTARIHI,GETDATE())

IF @YAS BETWEEN 10 AND 20
	SET @YASGRUBU='20 YAS ALTI'
IF @YAS BETWEEN 21 AND 30
	SET @YASGRUBU='20-30 ARASI'
IF @YAS BETWEEN 31 AND 40
	SET @YASGRUBU='30-40 ARASI'
IF @YAS BETWEEN 41 AND 50
	SET @YASGRUBU='40-50 ARASI'
IF @YAS BETWEEN 51 AND 60
	SET @YASGRUBU='50-60 ARASI'
IF @YAS>60
	SET @YASGRUBU='60''DAN BUYUK'

INSERT INTO KISILER (AD,SOYAD,CINSIYET,DOGUMTARIHI,YAS,YASGRUBU)
VALUES (@AD, @SOYAD, @CINSIYET, @DOGUMTARIHI, @YAS, @YASGRUBU)

SET @I=@I+1
END

SELECT * FROM KISILER

