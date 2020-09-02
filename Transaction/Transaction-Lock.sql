SELECT * FROM ITEMS WHERE ID=4

BEGIN TRAN
UPDATE ITEMS SET UNITPRICE=56 WHERE ID=4
--Transaction actik fakat kapatmadik.
--Onceden olusturdugumuz trigger da calisti :)

SELECT * FROM ITEMS_LOG WHERE ID=4
ROLLBACK

--Rollback isleminden sonra trigger'in ekledigi kayit da silindi.
--Trigger'lar, Transaction'larin bir parcasidir.

--Transaction islemi sirasinda islem yaptigimiz satir kilitlenir.
--Diger kullanicilar islem yaptigimiz tablodan veri cekmek istediklerinde
--Kilide takilmadan islem yapmalari gerekir. Bu islemi NOLOCK ile yapariz.

DBCC OPENTRAN --Acik transactionlar'i gosterir
