USE restaurant_db;

SELECT c.customer_name, c.phone, number_of_guests, t.table_number
FROM reservations AS r
    JOIN customers AS c ON r.customer_id = c.customer_id
    JOIN tables AS t ON r.table_id = t.table_id
WHERE cast(reservation_datetime AS DATE) = '2025-03-02'