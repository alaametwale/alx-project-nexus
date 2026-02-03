
# Entity Relationship Diagram (ERD)
## Airbnb Database Design

**Project:** ALX Airbnb Database Module  
**Purpose:** This document defines the entities, attributes, and relationships used to design the Airbnb relational database system.

---

## Entities and Attributes

### 1. User
- user_id (Primary Key)
- first_name
- last_name
- email
- phone
- created_at

### 2. Property
- property_id (Primary Key)
- owner_id (Foreign Key → User.user_id)
- title
- description
- location
- price_per_night
- created_at

### 3. Booking
- booking_id (Primary Key)
- user_id (Foreign Key → User.user_id)
- property_id (Foreign Key → Property.property_id)
- start_date
- end_date
- total_price
- status

### 4. Payment
- payment_id (Primary Key)
- booking_id (Foreign Key → Booking.booking_id)
- amount
- payment_date
- payment_method
- payment_status

### 5. Review
- review_id (Primary Key)
- user_id (Foreign Key → User.user_id)
- property_id (Foreign Key → Property.property_id)
- rating
- comment
- created_at

---

## Relationships Between Entities

- A **User** can own multiple **Properties** (1 : N)
- A **User** can make multiple **Bookings** (1 : N)
- A **Property** can have multiple **Bookings** (1 : N)
- Each **Booking** has exactly one **Payment** (1 : 1)
- A **User** can write multiple **Reviews** (1 : N)
- A **Property** can receive multiple **Reviews** (1 : N)

---

## ER Diagram Tool Used

The ER Diagram was designed using Draw.io to visually represent the database schema and relationships between entities.

