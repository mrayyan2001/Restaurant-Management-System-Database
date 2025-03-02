# Restaurant Management System

# The scope of the project

A restaurant system that mange menu, orders, bills, reservation, customers, staff, roles, shifts and attendance.

# The Mandatory object

- Admin
- Customer
- Items

# The Software Type and the functionality follow in the system

## The Software Type

The software is customized because the we have a specific requirements.

## The functionality follow in the system

### Admin

- [ ] Manage menu items, categories, and discounts.
- [ ] Oversee staff roles, shifts, and attendance.
- [ ] Generate reports on sales, staff performance, and reservations.

### Customer

- [ ] View the menu and place orders.
- [ ] Make table reservations.
- [ ] Provide feedback and rate their dining experience.

# Summarize the Objects

- [x] Menu (items with name, category, price, availability, and optional discount)
- [x] Order ( table number, customer name (optional), order date, status (e.g., pending, completed), and total amount)
- [x] Reservation (customer name, contact details, number of guests, reservation date, and table number)
- [ ] Staff (employee name, role (e.g., chef, server), shift timings, attendance, and contact details)
- [x] Admin (username, password)
- [x] Customer (name, contact details)
- [x] categories (e.g., "Vegan" and "Appetizers")

## Shared Attributes

- id
- created_at
- updated_at
- created_by
- updated_by
- is_active

# Summarize the Objects Relationships

- [ ] Menu has one to many items
- [ ] Menu items can belong to multiple categories
- [ ] Orders may include multiple items with quantities
- [ ] Reservations should prevent table overbooking
