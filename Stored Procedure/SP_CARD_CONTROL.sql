ALTER PROCEDURE SP_CARD_CONTROL_DENEME
@WORKERBARCODE AS VARCHAR(50)
AS
BEGIN
	DECLARE @WORKERNAME AS VARCHAR(100)
	SELECT @WORKERNAME=WORKERNAME FROM WORKERS WHERE WORKERBARCODE=@WORKERBARCODE

	IF @WORKERNAME IS NULL
	BEGIN
		RAISERROR('KART GECERSIZ',16,1)
		RETURN
	END
	ELSE
	BEGIN
		SELECT @WORKERNAME
	END
END

EXEC SP_CARD_CONTROL_DENEME '7D53DB7F-2B73-41CB-93AB-98080D3109AC'
--Dogru kart okutunca

EXEC SP_CARD_CONTROL_DENEME '7G53DB7F-2B73-41CB-93AB-98080D3109AC'
--Yanlis kart okutunca
