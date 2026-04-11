CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

INSERT INTO clinics VALUES
('cnc-0100001', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100002', 'ABC Clinic', 'Bangalore', 'Karnataka', 'India'),
('cnc-0100003', 'Care Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100004', 'Health Plus', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100005', 'Metro Clinic', 'Delhi', 'Delhi', 'India'),
('cnc-0100006', 'LifeCare', 'Mumbai', 'Maharashtra', 'India'),
('cnc-0100007', 'Wellness Center', 'Pune', 'Maharashtra', 'India'),
('cnc-0100008', 'City Hospital', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100009', 'Prime Health', 'Hyderabad', 'Telangana', 'India');

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
		CHECK (mobile ~ '^[0-9]{10}$')
);

INSERT INTO customer VALUES
('bk-09f3e-95hj', 'Jon Doe', '9700000000'),
('cu-1001', 'Ravi Kumar', '9800000001'),
('cu-1002', 'Sneha Reddy', '9900000002'),
('cu-1003', 'Arjun Rao', '9600000003'),
('cu-1004', 'Meena Devi', '9500000004'),
('cu-2001', 'Nikhil', '9111111111'),
('cu-2002', 'Varsha', '9222222222'),
('cu-2003', 'Teja', '9333333333'),
('cu-2004', 'Ramesh', '9444444444'),
('cu-2005', 'Kavya', '9555555555'),
('cu-2006', 'Harsha', '9666666666'),
('cu-2007', 'Sanjay', '9777777777'),
('cu-2008', 'Latha', '9888888888'),
('cu-2009', 'Vinay', '9999999999'),
('cu-2010', 'Bhavya', '9000000009'),
('cu-2011', 'Anil', '9011111111'),
('cu-2012', 'Geeta', '9022222222'),
('cu-2013', 'Mohan', '9033333333'),
('cu-2014', 'Radha', '9044444444'),
('cu-2015', 'Kiran', '9055555555');


CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount NUMERIC,
    datetime TIMESTAMP,
    sales_channel VARCHAR(50),

    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinic_sales VALUES
('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'online'),
('ord-002', 'cu-1001', 'cnc-0100001', 5000, '2021-01-10 10:00:00', 'offline'),
('ord-003', 'cu-1002', 'cnc-0100002', 8000, '2021-02-15 11:00:00', 'online'),
('ord-004', 'cu-1003', 'cnc-0100003', 12000, '2021-03-20 12:00:00', 'offline'),
('ord-005', 'cu-1001', 'cnc-0100002', 7000, '2021-02-25 14:00:00', 'online'),
('ord-006', 'cu-1004', 'cnc-0100004', 9000, '2021-03-05 15:00:00', 'offline'),
('ord-101', 'cu-2001', 'cnc-0100005', 6000, '2021-04-10 10:00:00', 'online'),
('ord-102', 'cu-2002', 'cnc-0100006', 7000, '2021-05-11 11:00:00', 'offline'),
('ord-103', 'cu-2003', 'cnc-0100007', 8000, '2021-06-12 12:00:00', 'online'),
('ord-104', 'cu-2004', 'cnc-0100008', 9000, '2021-07-13 13:00:00', 'offline'),
('ord-105', 'cu-2005', 'cnc-0100009', 10000, '2021-08-14 14:00:00', 'online'),
('ord-106', 'cu-2006', 'cnc-0100005', 11000, '2021-09-15 15:00:00', 'offline'),
('ord-107', 'cu-2007', 'cnc-0100006', 12000, '2021-10-16 16:00:00', 'online'),
('ord-108', 'cu-2008', 'cnc-0100007', 13000, '2021-11-17 17:00:00', 'offline'),
('ord-109', 'cu-2009', 'cnc-0100008', 14000, '2021-12-18 18:00:00', 'online'),
('ord-110', 'cu-2010', 'cnc-0100009', 15000, '2021-01-19 19:00:00', 'offline'),
('ord-111', 'cu-2011', 'cnc-0100005', 16000, '2021-02-20 20:00:00', 'online'),
('ord-112', 'cu-2012', 'cnc-0100006', 17000, '2021-03-21 21:00:00', 'offline'),
('ord-113', 'cu-2013', 'cnc-0100007', 18000, '2021-04-22 22:00:00', 'online'),
('ord-114', 'cu-2014', 'cnc-0100008', 19000, '2021-05-23 23:00:00', 'offline'),
('ord-115', 'cu-2015', 'cnc-0100009', 20000, '2021-06-24 09:00:00', 'online');

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description TEXT,
    amount NUMERIC,
    datetime TIMESTAMP,

    FOREIGN KEY (cid) REFERENCES clinics(cid)
);


INSERT INTO expenses VALUES
('exp-0100-00100', 'cnc-0100001', 'First Aid Supplies', 557, '2021-09-23 07:36:48'),
('exp-002', 'cnc-0100001', 'Equipment', 3000, '2021-01-12 09:00:00'),
('exp-003', 'cnc-0100002', 'Maintenance', 4000, '2021-02-20 10:00:00'),
('exp-004', 'cnc-0100003', 'Rent', 5000, '2021-03-22 11:00:00'),
('exp-005', 'cnc-0100004', 'Utilities', 2000, '2021-03-10 12:00:00'),
('exp-101', 'cnc-0100005', 'Medicines', 2000, '2021-04-10 08:00:00'),
('exp-102', 'cnc-0100006', 'Staff Salary', 3000, '2021-05-11 09:00:00'),
('exp-103', 'cnc-0100007', 'Maintenance', 2500, '2021-06-12 10:00:00'),
('exp-104', 'cnc-0100008', 'Electricity', 1800, '2021-07-13 11:00:00'),
('exp-105', 'cnc-0100009', 'Rent', 4000, '2021-08-14 12:00:00'),
('exp-106', 'cnc-0100005', 'Equipment', 3500, '2021-09-15 13:00:00'),
('exp-107', 'cnc-0100006', 'Supplies', 2200, '2021-10-16 14:00:00'),
('exp-108', 'cnc-0100007', 'Repairs', 2700, '2021-11-17 15:00:00'),
('exp-109', 'cnc-0100008', 'Water Bill', 1500, '2021-12-18 16:00:00'),
('exp-110', 'cnc-0100009', 'Cleaning', 1200, '2021-01-19 17:00:00'),
('exp-111', 'cnc-0100005', 'Insurance', 3000, '2021-02-20 18:00:00'),
('exp-112', 'cnc-0100006', 'Transport', 2000, '2021-03-21 19:00:00'),
('exp-113', 'cnc-0100007', 'Security', 2800, '2021-04-22 20:00:00'),
('exp-114', 'cnc-0100008', 'Misc', 1700, '2021-05-23 21:00:00'),
('exp-115', 'cnc-0100009', 'Software', 2600, '2021-06-24 22:00:00');







