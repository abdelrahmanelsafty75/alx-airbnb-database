CREATE DATABASE PropertyRental;
GO

USE PropertyRental;
GO

CREATE TABLE [User](
user_id UNIQUEIDENTIFIER Primary key Default NEWID(),
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(50) NOT NULL,
password_hash varchar(50) NOT NULL,
phone_number varchar(20) NOT NULL,
role varchar(5) Check(role in('guest','admin','host')) NOT NULL,
created_at datetime Default GetDate(),
Constraint Uq_email Unique (email)
);

CREATE TABLE [Property](
property_id UNIQUEIDENTIFIER Primary key Default NEWID(),
host_id UNIQUEIDENTIFIER,
name varchar(20) NOT NULL,
description text NOT NULL,
location varchar(50) NOT NULL,
pricepernight numeric(10,2) NOT NULL,
created_at datetime Default GetDAte(),
updated_at datetime Default GetDAte(),
Constraint Property_User_Fk Foreign key (host_id)
References [User] (user_id)
);


CREATE TABLE [Booking](
booking_id UNIQUEIDENTIFIER Primary key Default NEWID(),
property_id UNIQUEIDENTIFIER,
user_id UNIQUEIDENTIFIER,
start_date date NOT NULL,
end_date date NOT NULL,
total_price numeric(10,2),
status varchar(12) Check(status in('pending','confirmed','canceled')),
created_at datetime Default GetDAte()
Constraint Booking_Property_FK Foreign key (property_id)
References [Property] (property_id),
Constraint Booking_User_FK Foreign key (user_id)
References [User] (user_id)
);

CREATE TABLE [Payment](
payment_id UNIQUEIDENTIFIER Primary key Default NEWID(),
booking_id UNIQUEIDENTIFIER,
amount numeric(10,2) NOT NULL,
payment_data datetime Default GetDate(),
payment_method varchar(20) Check(payment_method in('credit_card','paypal','stripe')) NOT NULL,
Constraint Payment_Booking_FK Foreign key (booking_id)
References [Booking] (booking_id)
);

CREATE TABLE [Review](
review_id UNIQUEIDENTIFIER Primary key Default NEWID(),
property_id UNIQUEIDENTIFIER,
user_id UNIQUEIDENTIFIER,
rating int Check(rating >= 1 and rating <= 5) NOT NULL,
comment text NOT NULL,
created_at datetime Default GetDAte()
Constraint Review_Property_FK Foreign key (property_id)
References [Property] (property_id),
Constraint Review_User_FK Foreign key (user_id)
References [User] (user_id)
);

CREATE TABLE [Message](
message_id UNIQUEIDENTIFIER Primary key Default NEWID(),
sender_id UNIQUEIDENTIFIER,
recipient_id UNIQUEIDENTIFIER,
message_body text NOT NULL,
sent_at datetime Default GetDate(),
Constraint Message_User_FK1 Foreign key (sender_id)
References [User] (user_id),
Constraint Message_User_FK2 Foreign key (recipient_id)
References [User] (user_id)
);
