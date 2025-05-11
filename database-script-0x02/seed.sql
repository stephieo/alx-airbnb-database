-- Insert data into the users table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('1', 'John','Doe', 'john.doe@example.com', 'password123', 'host'),
('2', 'Tosin', 'Smith', 'tosin.smith@example.com', 'password456', 'guest'),
('3', 'Khalid', 'Ahmed', 'khalid.ahmed@example.com	', 'password789', 'admin');

-- Insert data into the property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
('101', '1', 'Luxury Apartment', 'A luxury apartment in the city center.', 'New York', 150.00),
('201', '1', 'CMordern Penthouse', 'A modern penthouse in the suburbs.', 'Los Angeles', 100.00),
('301', '1', 'Beach House', 'A beautiful beach house with ocean views.', 'Miami', 200.00);

-- Insert dummy data into Bookings table
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('201', '101', '2', '2023-11-01', '2023-11-05', 400.00, 'confirmed'),
('202', '102', '2', '2023-11-10', '2023-11-15', 750.00, 'pending');

-- Insert dummy data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('301', '201', 400.00, 'credit_card'),
('302', '202', 750.00, 'paypal');

-- Insert dummy data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('401', '101', '2', 5, 'Great place to stay!'),
('402', '102', '2', 4, 'Very modern and clean.');

-- Insert dummy data into Message table
INSERT INTO Message (message_id, sender_id, receiver_id, property_id, content) VALUES
('501', '2', '1', '101', 'Hello, is the cottage available next month?'),
('502', '1', '2', '101', 'Yes, it is available. Would you like to book?');