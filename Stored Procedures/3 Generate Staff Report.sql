USE restaurant_db;
GO
DROP PROC IF EXISTS GenerateStaffReport;
GO
CREATE PROC GenerateStaffReport
    @staff_id INT
AS
BEGIN
    SELECT s.first_name + ' ' + s.last_name AS staff_name,
        COUNT(sa.attendance_id) AS attendance_count
    FROM staff_attendance sa
        JOIN staff s ON sa.staff_id = s.staff_id
            AND s.staff_id = @staff_id
    GROUP BY s.first_name + ' ' + s.last_name
END;
GO

EXEC GenerateStaffReport 1;