CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(10)
        CHECK (phone_number ~ '^[0-9]{10}$'),
    mail_id VARCHAR(100),
    billing_address TEXT
);

INSERT INTO users VALUES
('21wrcxuy-67erfn', 'John Doe', '9700000000', 'john.doe@example.com', 'XX Street, ABC City'),
('31abcyz-89ghjk', 'Alice Smith', '9800000001', 'alice@example.com', 'MG Road, Bangalore'),
('41pqrsx-12lmno', 'Bob Lee', '9900000002', 'bob@example.com', 'Anna Nagar, Chennai'),
('51uvwxz-34qrst', 'Charlie Brown', '9600000003', 'charlie@example.com', 'Banjara Hills, Hyderabad'),
('61user-001', 'Rahul Sharma', '9012345670', 'rahul@gmail.com', 'Delhi'),
('61user-002', 'Priya Singh', '9012345671', 'priya@gmail.com', 'Mumbai'),
('61user-003', 'Kiran Kumar', '9012345672', 'kiran@gmail.com', 'Hyderabad'),
('61user-004', 'Neha Verma', '9012345673', 'neha@gmail.com', 'Pune'),
('61user-005', 'Amit Patel', '9012345674', 'amit@gmail.com', 'Ahmedabad'),
('61user-006', 'Suresh Reddy', '9012345675', 'suresh@gmail.com', 'Chennai'),
('61user-007', 'Anjali Gupta', '9012345676', 'anjali@gmail.com', 'Delhi'),
('61user-008', 'Vikas Yadav', '9012345677', 'vikas@gmail.com', 'Lucknow'),
('61user-009', 'Deepak Jain', '9012345678', 'deepak@gmail.com', 'Indore'),
('61user-010', 'Pooja Mehta', '9012345679', 'pooja@gmail.com', 'Surat'),
('61user-011', 'Rohan Das', '9023456780', 'rohan@gmail.com', 'Kolkata'),
('61user-012', 'Sneha Kapoor', '9023456781', 'sneha@gmail.com', 'Delhi'),
('61user-013', 'Arvind Nair', '9023456782', 'arvind@gmail.com', 'Kerala'),
('61user-014', 'Manoj Singh', '9023456783', 'manoj@gmail.com', 'Patna'),
('61user-015', 'Divya Iyer', '9023456784', 'divya@gmail.com', 'Chennai');


CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date TIMESTAMP,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-11a2b-11aa', '2021-10-05 10:30:00', 'rm-101', '31abcyz-89ghjk'),
('bk-22b3c-22bb', '2021-11-10 12:45:00', 'rm-102', '21wrcxuy-67erfn'),
('bk-33c4d-33cc', '2021-11-15 14:20:00', 'rm-201', '41pqrsx-12lmno'),
('bk-44d5e-44dd', '2021-12-01 09:10:00', 'rm-301', '51uvwxz-34qrst'),
('bk-5001', '2021-10-10 10:00:00', 'rm-401', '61user-001'),
('bk-5002', '2021-11-11 11:00:00', 'rm-402', '61user-002'),
('bk-5003', '2021-11-12 12:30:00', 'rm-403', '61user-003'),
('bk-5004', '2021-12-01 09:00:00', 'rm-404', '61user-004'),
('bk-5005', '2021-09-15 08:45:00', 'rm-405', '61user-005'),
('bk-5006', '2021-10-20 13:20:00', 'rm-406', '61user-006'),
('bk-5007', '2021-11-25 15:10:00', 'rm-407', '61user-007'),
('bk-5008', '2021-12-05 17:00:00', 'rm-408', '61user-008'),
('bk-5009', '2021-10-30 18:00:00', 'rm-409', '61user-009'),
('bk-5010', '2021-11-02 07:30:00', 'rm-410', '61user-010'),
('bk-5011', '2021-09-10 06:15:00', 'rm-411', '61user-011'),
('bk-5012', '2021-12-12 14:00:00', 'rm-412', '61user-012'),
('bk-5013', '2021-11-18 16:00:00', 'rm-413', '61user-013'),
('bk-5014', '2021-10-22 19:30:00', 'rm-414', '61user-014'),
('bk-5015', '2021-12-20 20:45:00', 'rm-415', '61user-015');



CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate NUMERIC
);


INSERT INTO items VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 180),
('itm-a07vh-aer8', 'Mix Veg', 350),
('itm-b123-xy12', 'Paneer Curry', 350),
('itm-c456-ab34', 'Rice Plate', 150),
('itm-d789-cd56', 'Dal Fry', 155),
('itm-e111', 'Butter Naan', 45),
('itm-e222', 'Chicken Curry', 450),
('itm-e333', 'Veg Biryani', 380),
('itm-e444', 'Egg Curry', 250),
('itm-e555', 'Curd Rice', 110);



CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date TIMESTAMP,
    item_id VARCHAR(50),
    item_quantity NUMERIC,

    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);



INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('bc-101', 'bk-11a2b-11aa', 'bl-101', '2021-10-05 13:00:00', 'itm-b123-xy12', 3),
('bc-102', 'bk-11a2b-11aa', 'bl-101', '2021-10-05 13:00:00', 'itm-c456-ab34', 2),
('bc-201', 'bk-22b3c-22bb', 'bl-201', '2021-11-10 14:00:00', 'itm-d789-cd56', 4),
('bc-202', 'bk-22b3c-22bb', 'bl-201', '2021-11-10 14:00:00', 'itm-b123-xy12', 1),
('bc-203', 'bk-33c4d-33cc', 'bl-202', '2021-11-15 16:00:00', 'itm-a07vh-aer8', 5),
('bc-301', 'bk-44d5e-44dd', 'bl-301', '2021-12-01 11:00:00', 'itm-a9e8-q8fu', 6),
('bc-302', 'bk-44d5e-44dd', 'bl-301', '2021-12-01 11:00:00', 'itm-c456-ab34', 2),
('bc-401', 'bk-5001', 'bl-401', '2021-10-10 11:00:00', 'itm-e111', 4),
('bc-402', 'bk-5002', 'bl-402', '2021-11-11 12:00:00', 'itm-e222', 2),
('bc-403', 'bk-5003', 'bl-403', '2021-11-12 13:00:00', 'itm-e333', 3),
('bc-404', 'bk-5004', 'bl-404', '2021-12-01 10:00:00', 'itm-e444', 2),
('bc-405', 'bk-5005', 'bl-405', '2021-09-15 09:30:00', 'itm-e555', 5),
('bc-406', 'bk-5006', 'bl-406', '2021-10-20 14:00:00', 'itm-a9e8-q8fu', 6),
('bc-407', 'bk-5007', 'bl-407', '2021-11-25 16:00:00', 'itm-a07vh-aer8', 4),
('bc-408', 'bk-5008', 'bl-408', '2021-12-05 18:00:00', 'itm-b123-xy12', 2),
('bc-409', 'bk-5009', 'bl-409', '2021-10-30 19:00:00', 'itm-c456-ab34', 3),
('bc-410', 'bk-5010', 'bl-410', '2021-11-02 08:30:00', 'itm-d789-cd56', 5),
('bc-411', 'bk-5011', 'bl-411', '2021-09-10 07:00:00', 'itm-e111', 2),
('bc-412', 'bk-5012', 'bl-412', '2021-12-12 15:00:00', 'itm-e222', 3),
('bc-413', 'bk-5013', 'bl-413', '2021-11-18 17:00:00', 'itm-e333', 4),
('bc-414', 'bk-5014', 'bl-414', '2021-10-22 20:00:00', 'itm-e444', 1),
('bc-415', 'bk-5015', 'bl-415', '2021-12-20 21:00:00', 'itm-e555', 6);






