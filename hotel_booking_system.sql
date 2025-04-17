CREATE DATABASE hotel_booking;
USE hotel_booking;

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10, 2),
    availability ENUM('Available', 'Booked') DEFAULT 'Available'
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    contact VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status ENUM('Paid', 'Pending'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount_paid DECIMAL(10, 2),
    payment_method VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

INSERT INTO rooms (room_id, room_type, price_per_night, availability)
VALUES
(101, 'Deluxe', 5000, 'Available'),
(102, 'Standard', 3000, 'Booked'),
(103, 'Suite', 8000, 'Available'),
(104, 'Standard', 3000, 'Available');

INSERT INTO customers (name, contact, email)
VALUES
('Raj Malhotra', '9876543210', 'raj@gmail.com'),
('Ananya Sharma', '7894561230', 'ananya@yahoo.com');

INSERT INTO bookings (customer_id, room_id, check_in_date, check_out_date, total_amount, payment_status)
VALUES
(1, 102, '2025-04-01', '2025-04-05', 12000, 'Paid'),
(2, 103, '2025-04-10', '2025-04-15', 40000, 'Pending');

INSERT INTO payments (booking_id, amount_paid, payment_method, payment_date)
VALUES
(1, 12000, 'Credit Card', '2025-03-30'),
(2, 20000, 'UPI', '2025-04-08');

SELECT * FROM bookings;

SELECT * FROM rooms;

SELECT * FROM customers;

SELECT * FROM payments;
