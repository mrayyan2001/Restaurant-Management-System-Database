USE restaurant_db;
GO
DROP PROC IF EXISTS AddReservation;
DROP PROC IF EXISTS UpdateReservation;
GO
CREATE PROC AddReservation
    @customer_id INT,
    @table_id INT,
    @reservation_datetime DATETIME,
    @number_of_guests INT
AS
BEGIN
    INSERT INTO reservations
        (customer_id, table_id, reservation_datetime, number_of_guests)
    VALUES
        (@customer_id, @table_id, @reservation_datetime, @number_of_guests)
END;
GO
-- EXEC AddReservation 2, 2, '2021-01-01 12:00:00', 5;
GO
CREATE PROC UpdateReservation
    @reservation_id INT,
    @customer_id INT,
    @table_id INT,
    @reservation_datetime DATETIME,
    @number_of_guests INT
AS
BEGIN
    UPDATE reservations
    SET customer_id = @customer_id,
        table_id = @table_id,
        reservation_datetime = @reservation_datetime,
        number_of_guests = @number_of_guests
    WHERE reservation_id = @reservation_id
END;

EXEC UpdateReservation 8, 2, 1, '2021-02-01 12:00:00', 1;

SELECT *
FROM reservations;