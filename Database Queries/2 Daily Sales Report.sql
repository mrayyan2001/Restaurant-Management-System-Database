USE restaurant_db;

SELECT
    mi.category_id,
    sum(total_amount) AS total_sales
FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN menu_items mi ON mi.item_id = oi.menu_item_id
WHERE cast(o.order_datetime AS DATE) =  '2025-03-02'
GROUP BY mi.category_id