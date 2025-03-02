USE restaurant_db;
DROP VIEW IF EXISTS available_menu_items;
GO
CREATE VIEW available_menu_items
AS
    (
    SELECT item_name, item_price, category_name
    FROM menu_items mi
        JOIN categories c ON  mi.category_id = c.category_id
    WHERE is_available = 1
)
GO
SELECT *
FROM available_menu_items;