Create proc prcDivision 
	@a INT,
	@b INT
AS
BEGIN
	BEGIN TRY
		Set @a = 5;
		Set @b = @a / 0
		Print @b 
	END TRY
	BEGIN CATCH
		Print 'Error is '
		Print ERROR_MESSAGE()
	END CATCH
END
GO

Exec prcDivision 12,0
GO

CREATE PROCEDURE spEvenCheck
    @n INT
AS
BEGIN
    BEGIN TRY
        IF (@n % 2 = 0)
        BEGIN
            PRINT 'No Error'
            PRINT 'Even Number'
        END
        ELSE
        BEGIN
            PRINT 'Error occurred'
            RAISERROR('Error occurred', 16, 1);
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;