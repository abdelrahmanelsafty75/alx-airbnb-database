# Database Normalization (3NF)

## Original Schema Review
The initial database schema for PropertyRental was designed with the following entities: User, Property, Booking, Payment, Review, and Message. Each table was analyzed for normalization issues.

## Normalization Steps
### 1. First Normal Form (1NF)
- Ensured all attributes are atomic (e.g., `first_name` and `last_name` are separate instead of a single `name` field).
- Removed repeating groups (no multi-valued attributes).
- Each table has a primary key (`user_id`, `property_id`, etc., using UUIDs).
- All tables meet 1NF as attributes are single-valued and uniquely identified.

### 2. Second Normal Form (2NF)
- 2NF applies to tables with composite keys. Since all tables use single-column UUID primary keys, there are no partial dependencies.
- All non-key attributes (e.g., `email`, `pricepernight`, `rating`) fully depend on the primary key.
- All tables are already in 2NF.

### 3. Third Normal Form (3NF)
- Checked for transitive dependencies (non-key attributes depending on other non-key attributes).
- **User**: `email` is unique and not dependent on other non-key attributes. No transitive dependencies.
- **Property**: `host_id` references `User`, and other attributes (`name`, `description`, etc.) depend only on `property_id`. No issues.
- **Booking**: Attributes like `total_price` depend on `booking_id`, not on `user_id` or `property_id`. No transitive dependencies.
- **Payment**: `amount` and `payment_method` depend on `payment_id`, not `booking_id`. No issues.
- **Review**: `rating` and `comment` depend on `review_id`. No transitive dependencies.
- **Message**: `message_body` depends on `message_id`, not `sender_id` or `recipient_id`. No issues.
- No adjustments were needed as the schema is already in 3NF.

## Conclusion
The database schema is fully normalized to 3NF, with no redundancies or transitive dependencies. Each table uses appropriate data types, constraints, and foreign keys to maintain data integrity.