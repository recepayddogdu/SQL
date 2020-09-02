
--INSERT INTO SELECT komutu ile WORKERS tablomuzu dolduracagiz.

INSERT INTO WORKERS
([WORKERCODE], [WORKERNAME], [GENDER], [BIRTHDATE], 
[TCNO], [WORKERBARCODE])
SELECT TOP 1000 
TCNO AS WORKERCODE, NAMESURNAME AS WORKERNAME, GENDER, 
BIRTHDATE, TCNO, NEWID() AS WORKERBARCODE
FROM CRM.DBO.CUSTOMERS

SELECT * FROM WORKERS

EXEC GENERATE_WORKER_TRANSACTION 1

DECLARE @I AS INT=1
WHILE @I<=1000
BEGIN
	EXEC GENERATE_WORKER_TRANSACTION @I
	SET @I=@I+1
END

SELECT COUNT(*) FROM WORKERTRANSACTIONS

--Calisanin son hareket turu ve zamanini bulan script 
SET STATISTICS IO ON
SELECT *,
(SELECT TOP 1 IOTYPE FROM WORKERTRANSACTIONS WHERE WORKERID=W.ID ORDER BY DATE_ DESC) SONHAREKETTURU,
(SELECT MAX(DATE_) FROM WORKERTRANSACTIONS WHERE WORKERID=W.ID) SONHAREKETZAMANI
FROM WORKERS W

--Son islemi alan trigger
CREATE TRIGGER TRG_TRANSACTION_INSERT
ON WORKERTRANSACTIONS
AFTER INSERT
AS
BEGIN
	DECLARE @WORKERID AS INT
	DECLARE @DATE AS DATETIME
	DECLARE @IOTYPE AS VARCHAR(1)

	SELECT @WORKERID=WORKERID, @DATE=DATE_, @IOTYPE=IOTYPE FROM INSERTED

	UPDATE WORKER_LAST_TRANSACTIONS SET LASTDATE=@DATE,LASTIOTYPE=@IOTYPE
	WHERE WORKERID=@WORKERID
END

EXEC GENERATE_WORKER_TRANSACTION 1

SELECT * FROM WORKER_LAST_TRANSACTIONS
