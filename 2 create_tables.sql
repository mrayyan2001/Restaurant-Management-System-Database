    USE restaurant_db;

    -- create admin table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'admin'
    )
    CREATE TABLE admin
    (
        -- admin_id is the primary key and auto-increment
        admin_id INT PRIMARY KEY IDENTITY(1, 1),
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        -- email should be unique and not null
        email VARCHAR(255) NOT NULL UNIQUE,
        -- password should be not null
        [password] VARCHAR(255) NOT NULL,
    );

    -- Shared attributes for all tables
    -- id (primary key, auto-increment)
    -- created_at (datetime, not null, default GETDATE())
    -- created_by (int, not null)
    -- updated_at (datetime, not null, default GETDATE())
    -- updated_by (int, not null)
    -- is_active (bit, not null, default 1)

    -- create staff table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'staff'
    )
    CREATE TABLE staff
    (
        staff_id INT PRIMARY KEY IDENTITY(1, 1),
        created_at DATETIME NOT NULL DEFAULT GETDATE(),
        created_by INT NOT NULL,
        updated_at DATETIME NOT NULL DEFAULT GETDATE(),
        updated_by INT NOT NULL,
        is_active BIT NOT NULL DEFAULT 1,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        phone_number VARCHAR(15),
        shift_start TIME,
        shift_end TIME,
        role_id INT NOT NULL,
    );

    -- create staff_roles table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'staff_roles'
    ) 
    CREATE TABLE staff_roles
    (
        role_id INT PRIMARY KEY IDENTITY(1, 1),
        role_name VARCHAR(50) NOT NULL UNIQUE,
    );

    -- create staff_attendance table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'staff_attendance'
    )
    CREATE TABLE staff_attendance
    (
        attendance_id INT PRIMARY KEY IDENTITY(1, 1),
        staff_id INT NOT NULL,
        attendance_date DATE NOT NULL,
    );

    -- create customers table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'customers'
    )
    CREATE TABLE customers
    (
        customer_id INT PRIMARY KEY IDENTITY(1, 1),
        customer_name VARCHAR(100) NOT NULL,
        phone VARCHAR(15) NOT NULL UNIQUE,
    );

    -- create tables table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'tables'
    )
    CREATE TABLE tables
    (
        table_id INT PRIMARY KEY IDENTITY(1, 1),
        table_number INT NOT NULL,
    );

    -- create reservations table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'reservations'
    )
    CREATE TABLE reservations
    (
        reservation_id INT PRIMARY KEY IDENTITY(1, 1),
        reservation_datetime DATETIME NOT NULL,
        number_of_guests INT NOT NULL,
        customer_id INT NOT NULL,
        table_id INT NOT NULL,
        -- To prevent overbooking, we need to add a unique constraint on reservation_datetime and table_id
        UNIQUE(reservation_datetime, table_id)
    );

    -- create orders table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'orders'
    )
    CREATE TABLE orders
    (
        order_id INT PRIMARY KEY IDENTITY(1, 1),
        customer_id INT NOT NULL,
        table_id INT NOT NULL,
        order_datetime DATETIME NOT NULL,
        order_status_id INT NOT NULL,
        total_amount DECIMAL(10, 2) NOT NULL,
        customer_rate INT,
        customer_feedback VARCHAR(255),
        -- To prevent multiple orders at the same time for the same table, we need to add a unique constraint on order_datetime and table_id
        UNIQUE(order_datetime, table_id)
    );

    -- create order_status table

    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'order_status'
    )
    CREATE TABLE order_status
    (
        order_status_id INT PRIMARY KEY IDENTITY(1, 1),
        status_name VARCHAR(50) NOT NULL UNIQUE,
    );

    -- create order_items table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'order_items'
    )
    CREATE TABLE order_items
    (
        order_item_id INT PRIMARY KEY IDENTITY(1, 1),
        order_id INT NOT NULL,
        menu_item_id INT NOT NULL,
        quantity INT NOT NULL,
        item_price DECIMAL(10, 2) NOT NULL,
    );

    -- create menu_items table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'menu_items'
    )
    CREATE TABLE menu_items
    (
        item_id INT PRIMARY KEY IDENTITY(1, 1),
        item_name VARCHAR(100) NOT NULL,
        item_price DECIMAL(10, 2) NOT NULL,
        is_available BIT NOT NULL DEFAULT 1,
        discount INT NULL,
        category_id INT NOT NULL,
    );

    -- create categories table
    IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'categories'
    )
    CREATE TABLE categories
    (
        category_id INT PRIMARY KEY IDENTITY(1, 1),
        category_name VARCHAR(50) NOT NULL UNIQUE,
    );