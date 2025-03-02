USE restaurant_db;
DROP VIEW IF EXISTS sales_summary;
GO
CREATE VIEW sales_summary
AS
    SELECT c.category_name, mi.item_name, sum(oi.quantity * oi.item_price) AS total_sales
    FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        JOIN menu_items mi ON oi.menu_item_id  = mi.item_id
        JOIN categories c ON mi.category_id = c.category_id
    GROUP BY c.category_name, mi.item_name;
GO
SELECT *
FROM sales_summary;