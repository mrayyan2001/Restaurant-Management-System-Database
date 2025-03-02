USE restaurant_db;
GO
DROP PROCEDURE IF EXISTS AddNewOrder;
DROP PROCEDURE IF EXISTS AddOrderItem;
GO
CREATE PROC AddNewOrder
    @order_datetime DATETIME,
    @total_amount DECIMAL(10, 2),
    @order_status_id INT,
    @table_id INT,
    @customer_id INT,
    @customer_rate INT,
    @customer_feedback VARCHAR(255)
AS
BEGIN
    INSERT INTO Orders
        (order_datetime, total_amount, order_status_id, table_id, customer_id, customer_rate, customer_feedback)
    VALUES
        (@order_datetime, @total_amount, @order_status_id, @table_id, @customer_id, @customer_rate, @customer_feedback);
END;
GO
CREATE PROC AddOrderItem
    @order_id INT,
    @menu_item_id INT,
    @quantity INT
AS
BEGIN
    INSERT INTO order_items
        (order_id, menu_item_id, quantity, item_price)
    VALUES
        (@order_id,
            @menu_item_id,
            @quantity,
            (SELECT item_price * (1-discount/100)
            FROM menu_items
            WHERE item_id = @menu_item_id)
        );
END;