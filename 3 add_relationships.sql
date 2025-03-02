USE restaurant_db;

-- staff has a role 
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_staff_role_id'
)
ALTER TABLE staff 
ADD CONSTRAINT FK_staff_role_id
FOREIGN KEY (role_id)
REFERENCES staff_roles(role_id);


-- attendance is for a staff
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_staff_attendance_staff_id'
)
ALTER TABLE staff_attendance
ADD CONSTRAINT FK_staff_attendance_staff_id
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);

-- reservation is for a customer and on a table
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_reservations_customer_id' 
)
ALTER TABLE reservations
ADD CONSTRAINT FK_reservations_customer_id
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id) ON DELETE CASCADE;

IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_reservations_table_id'
)
ALTER TABLE reservations
ADD CONSTRAINT FK_reservations_table_id
FOREIGN KEY (table_id)
REFERENCES tables(table_id);

-- order is for a customer and on a table
-- order has a status
-- order is on a table
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_orders_customer_id'
)
ALTER TABLE orders
ADD CONSTRAINT FK_orders_customer_id
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id) ON DELETE CASCADE;

IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_orders_table_id'
)
ALTER TABLE orders
ADD CONSTRAINT FK_orders_table_id
FOREIGN KEY (table_id)
REFERENCES tables(table_id);

IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_orders_order_status_id'
)
ALTER TABLE orders
ADD CONSTRAINT FK_orders_order_status_id
FOREIGN KEY (order_status_id)
REFERENCES order_status(order_status_id);

-- order_item is for an order
-- order_item is a menu item
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_order_items_order_id'
)
ALTER TABLE order_items
ADD CONSTRAINT FK_order_items_order_id
FOREIGN KEY (order_id)
REFERENCES orders(order_id) ON DELETE CASCADE;

IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_order_items_menu_item_id'
)
ALTER TABLE order_items
ADD CONSTRAINT FK_order_items_menu_item_id
FOREIGN KEY (menu_item_id)
REFERENCES menu_items(item_id);

-- menu item belongs to a category
IF NOT EXISTS (
    SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'FK_menu_items_category_id'
)
ALTER TABLE menu_items
ADD CONSTRAINT FK_menu_items_category_id
FOREIGN KEY (category_id)
REFERENCES categories(category_id);