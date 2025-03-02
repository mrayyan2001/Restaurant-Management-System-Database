USE restaurant_db;
GO
DROP PROCEDURE IF EXISTS UpdateMenuAvailability;
GO
CREATE PROCEDURE UpdateMenuAvailability
    @item_id INT,
    @is_available BIT
AS
BEGIN
    UPDATE menu_items
    SET is_available = @is_available
    WHERE item_id = @item_id;
END;
GO

EXEC UpdateMenuAvailability 1,0;

SELECT *
FROM menu_items;