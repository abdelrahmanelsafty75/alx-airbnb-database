# alx-airbnb-database

This repository contains the database design and implementation for a property rental system, similar to Airbnb, built for SQL Server.

## Directory Structure
- **ERD/**: Contains the Entity-Relationship diagram documentation (`requirements.md`) and optional ERD image.
- **database-script-0x01/**: Contains the database schema (`schema.sql`) and README.
- **database-script-0x02/**: Contains the seed data (`seed.sql`) and README.
- **normalization.md**: Explains the normalization process to achieve 3NF.

## Usage
1. Run `database-script-0x01/schema.sql` to create the database and tables.
2. Run `database-script-0x02/seed.sql` to populate the database with sample data.
3. Review `ERD/requirements.md` for the ER diagram details and `normalization.md` for normalization steps.

## Notes
- The schema uses UUIDs for primary keys and includes foreign key constraints for data integrity.
- Sample data uses Arabic names in English letters for cultural relevance.
- Designed for SQL Server.
