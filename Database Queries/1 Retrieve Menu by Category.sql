USE restaurant_db;

-- based on the category_id
SELECT item_name, item_price, is_available
FROM menu_items
WHERE category_id = 3;

-- based on the category_name using a subquery using IN
SELECT item_name, item_price, is_available
FROM menu_items
WHERE category_id IN (
    SELECT category_id
FROM categories
WHERE category_name = 'Desserts'
)

-- based on the category_name using a subquery using EXISTS
SELECT item_name, item_price, is_available
FROM menu_items
WHERE EXISTS (
    SELECT *
FROM categories
WHERE category_name = 'Desserts' AND category_id = menu_items.category_id
)

-- based on the category_name using a JOIN
SELECT item_name, item_price, is_available
FROM menu_items AS mi
    JOIN categories AS c
    ON mi.category_id = c.category_id AND c.category_name = 'Desserts';
-- WHERE c.category_name = 'Desserts';