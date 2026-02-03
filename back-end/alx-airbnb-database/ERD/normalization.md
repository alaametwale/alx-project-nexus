# Database Normalization to 3NF

## Introduction
Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.  
This database design for the Airbnb system has been normalized up to the Third Normal Form (3NF).

---

## First Normal Form (1NF)

To satisfy 1NF:
- All attributes contain atomic (indivisible) values.
- Each record is unique.
- No repeating groups or arrays.

### Application in our design:
- Each table has a primary key.
- Fields like phone, email, price, rating contain single values.
- No multiple values stored in one column.

---

## Second Normal Form (2NF)

To satisfy 2NF:
- The table must be in 1NF.
- All non-key attributes must depend on the whole primary key.

### Application in our design:
- Tables use single primary keys (user_id, property_id, booking_id).
- Attributes fully depend on their table’s primary key.
- No partial dependencies exist.

---

## Third Normal Form (3NF)

To satisfy 3NF:
- The table must be in 2NF.
- No transitive dependencies (non-key attribute depending on another non-key attribute).

### Application in our design:
- User details are stored only in the User table.
- Property details are stored only in the Property table.
- Booking, Payment, and Review reference other tables using foreign keys.
- No duplicated data across tables.

---

## Conclusion
The Airbnb database schema is fully normalized to 3NF, ensuring:
- Minimal redundancy
- High data integrity
- Efficient storage
- Scalable design
