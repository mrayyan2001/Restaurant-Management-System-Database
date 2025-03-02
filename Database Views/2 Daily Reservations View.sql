USE restaurant_db;
GO
CREATE VIEW daily_reservations
AS
    SELECT c.customer_name, c.phone, t.table_number, r.number_of_guests
    FROM reservations r
        JOIN customers c ON r.customer_id = c.customer_id
        JOIN tables t ON r.table_id = t.table_id
    WHERE cast(reservation_datetime AS DATE) = cast(GETDATE() AS DATE);
GO
SELECT *
FROM daily_reservations;