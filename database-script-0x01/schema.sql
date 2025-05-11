-- Database schema for the Airbnb clone project
-- This script creates the necessary tables and relationships for the database

-- User table
CREATE TABLE IF NOT EXISTS User(
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    password_hash VARCHAR(250) NOT NULL,
    phone_number VARCHAR(250) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property table
CREATE TABLE IF NOT EXISTS Property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(250) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(250) NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(host_id) REFERENCES User(user_id)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id)      
);

-- Payment Table
CREATE TABLE IF NOT EXISTS Payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id)
);

-- Review Table
CREATE TABLE IF NOT EXISTS Review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id)

);

-- Message Table
CREATE TABLE IF NOT EXISTS Message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    receiver_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(sender_id) REFERENCES User(user_id),
    FOREIGN KEY(receiver_id) REFERENCES User(user_id),
    FOREIGN KEY(property_id) REFERENCES Property(property_id)
);

