USE restaurant_db;

SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff_name, sa.attendance_date
FROM staff_attendance AS sa
    JOIN staff AS s ON sa.staff_id = s.staff_id
WHERE cast(sa.attendance_date AS DATE) BETWEEN '2025-03-02' AND '2025-03-03';