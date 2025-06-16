# Database Schema (schema.sql)

This directory contains the SQL script to create the `PropertyRental` database schema.

## Files
- `schema.sql`: Contains `CREATE TABLE` statements for the following entities:
  - `User`: Stores user information with a unique email and role (guest, host, admin).
  - `Property`: Stores property details, linked to a host via `host_id`.
  - `Booking`: Manages bookings with foreign keys to `User` and `Property`.
  - `Payment`: Records payments linked to bookings.
  - `Review`: Stores property reviews with a rating constraint (1-5).
  - `Message`: Manages messages between users.

## Constraints
- Primary keys: UUIDs for all tables.
- Foreign keys: Enforce relationships (e.g., `host_id`, `property_id`, `booking_id`).
- Unique constraint: `email` in `User`.
- Check constraints: `role`, `status`, `payment_method`, and `rating`.

## Usage
Run `schema.sql` in SQL Server to create the database and tables.