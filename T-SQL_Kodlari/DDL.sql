
CREATE DATABASE TEST
--TABLO OLUSTURMA
CREATE TABLE TEST (ID INT IDENTITY(1,1), ISIM VARCHAR(20))

--TABLOYA COLUMN EKLEME
ALTER TABLE TEST ADD ADRES VARCHAR(500)

--TABLODAN COLUMN SILME
ALTER TABLE TEST DROP COLUMN ADRES

--TABLODA COLUMN GUNCELLEME
ALTER TABLE TEST ALTER COLUMN ISIM VARCHAR(50)


