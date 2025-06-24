USE PropertyRental;
GO

-- Insert sample data into User table
INSERT INTO [User] (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
    ('Ahmad', 'Mohammed', 'ahmad.mohammed@example.com', 'hash_123', '050-1234567', 'guest'),
    ('Fatima', 'Ali', 'fatima.ali@example.com', 'hash_456', '050-2345678', 'host'),
    ('Khaled', 'Saeed', 'khaled.saeed@example.com', 'hash_789', '050-3456789', 'guest'),
    ('Noor', 'Hassan', 'noor.hassan@example.com', 'hash_012', NULL, 'guest'),
    ('Mudir', 'Nizam', 'admin@example.com', 'hash_admin', '050-4567890', 'admin');
GO

-- Insert sample data into Property table
INSERT INTO [Property] (host_id, name, description, location, pricepernight)
VALUES 
    ((SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), 'Villa Albahar', 'A cozy villa overlooking the sea.', 'Riyadh, Saudi Arabia', 500.00),
    ((SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), 'Shaqqa Wast Almadina', 'A modern apartment in the city.', 'Dubai, UAE', 300.00),
    ((SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), 'Kukh Aljabal', 'A rustic cabin in nature.', 'Jeddah, Saudi Arabia', 200.00);
GO

-- Insert sample data into Booking table
INSERT INTO [Booking] (property_id, user_id, start_date, end_date, total_price, status)
VALUES 
    ((SELECT property_id FROM Property WHERE name = 'Villa Albahar'), (SELECT user_id FROM [User] WHERE email = 'ahmad.mohammed@example.com'), '2025-07-01', '2025-07-04', 1500.00, 'confirmed'),
    ((SELECT property_id FROM Property WHERE name = 'Shaqqa Wast Almadina'), (SELECT user_id FROM [User] WHERE email = 'khaled.saeed@example.com'), '2025-08-10', '2025-08-12', 600.00, 'pending'),
    ((SELECT property_id FROM Property WHERE name = 'Kukh Aljabal'), (SELECT user_id FROM [User] WHERE email = 'noor.hassan@example.com'), '2025-09-15', '2025-09-18', 600.00, 'canceled');
GO

-- Insert sample data into Payment table
INSERT INTO [Payment] (booking_id, amount, payment_method)
VALUES 
    ((SELECT booking_id FROM Booking WHERE total_price = 1500.00 AND status = 'confirmed'), 1500.00, 'credit_card'),
    ((SELECT booking_id FROM Booking WHERE total_price = 600.00 AND status = 'pending'), 600.00, 'stripe');
GO

-- Insert sample data into Review table
INSERT INTO [Review] (property_id, user_id, rating, comment)
VALUES 
    ((SELECT property_id FROM Property WHERE name = 'Villa Albahar'), (SELECT user_id FROM [User] WHERE email = 'ahmad.mohammed@example.com'), 5, 'Amazing stay!'),
    ((SELECT property_id FROM Property WHERE name = 'Shaqqa Wast Almadina'), (SELECT user_id FROM [User] WHERE email = 'khaled.saeed@example.com'), 4, 'Great location.');
GO

-- Insert sample data into Message table
INSERT INTO [Message] (sender_id, recipient_id, message_body)
VALUES 
    ((SELECT user_id FROM [User] WHERE email = 'ahmad.mohammed@example.com'), (SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), 'What is check-in time?'),
    ((SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), (SELECT user_id FROM [User] WHERE email = 'ahmad.mohammed@example.com'), 'Check-in at 3 PM.'),
    ((SELECT user_id FROM [User] WHERE email = 'khaled.saeed@example.com'), (SELECT user_id FROM [User] WHERE email = 'fatima.ali@example.com'), 'Available next month?');
GO