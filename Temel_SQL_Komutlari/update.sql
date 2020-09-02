
--Yas hesaplayip AGE kolonuna yazdirmak istiyoruz.
--SQL'in kendi fonksiyonlarindan olan DATEDIFF fonksiyonunu kullanacagiz.

UPDATE CUSTOMER 
SET AGE=DATEDIFF(YEAR,BIRTHDATE,GETDATE())

SELECT * FROM CUSTOMER