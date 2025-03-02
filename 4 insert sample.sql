USE restaurant_db;

INSERT INTO [dbo].[admin]
    (first_name, last_name, email, password)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hashed_password_123'),
    ('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_456');
INSERT INTO [dbo].[categories]
    (category_name)
VALUES
    ('Appetizers'),
    ('Main Course'),
    ('Desserts'),
    ('Beverages');
INSERT INTO [dbo].[customers]
    (customer_name, phone)
VALUES
    ('Alice Johnson', '1234567890'),
    ('Bob Williams', '0987654321');
INSERT INTO [dbo].[tables]
    (table_number)
VALUES
    (1),
    (2),
    (3);
INSERT INTO [dbo].[menu_items]
    (item_name, item_price, is_available, discount, category_id)
VALUES
    ('Cheeseburger', 8.99, 1, 10, 2),
    ('French Fries', 3.99, 1, 0, 1),
    ('Chocolate Cake', 5.99, 1, 5, 3),
    ('Cola', 2.50, 1, 0, 4);
INSERT INTO [dbo].[order_status]
    (status_name)
VALUES
    ('Pending'),
    ('In Progress'),
    ('Completed'),
    ('Cancelled');
INSERT INTO [dbo].[orders]
    (customer_id, table_id, order_datetime, order_status_id, total_amount, customer_rate, customer_feedback)
VALUES
    (1, 1, GETDATE(), 1, 14.98, 5, 'Great food!'),
    (2, 2, GETDATE(), 2, 8.99, NULL, NULL);
INSERT INTO [dbo].[order_items]
    (order_id, menu_item_id, quantity, item_price)
VALUES
    (1, 1, 2, 8.99),
    (1, 2, 1, 3.99),
    (2, 3, 1, 5.99);
INSERT INTO [dbo].[reservations]
    (reservation_datetime, number_of_guests, customer_id, table_id)
VALUES
    (GETDATE(), 4, 1, 1),
    (GETDATE(), 2, 2, 2);
INSERT INTO [dbo].[staff_roles]
    (role_name)
VALUES
    ('Chef'),
    ('Waiter'),
    ('Manager'),
    ('Cashier');
INSERT INTO [dbo].[staff]
    (created_by, updated_by, is_active, first_name, last_name, phone_number, shift_start, shift_end, role_id)
VALUES
    (1, 1, 1, 'Michael', 'Brown', '1122334455', '08:00:00', '16:00:00', 1),
    (1, 1, 1, 'Sarah', 'Miller', '2233445566', '10:00:00', '18:00:00', 2);
INSERT INTO [dbo].[staff_attendance]
    (staff_id, attendance_date)
VALUES
    (1, '2025-03-02'),
    (2, '2025-03-02');
