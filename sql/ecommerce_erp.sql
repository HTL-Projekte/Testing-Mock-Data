-- ============================================================
-- E-Commerce / ERP Mock Data
-- Compatible with: MSSQL (SQL Server) and PostgreSQL
-- Tables: Users, Products, Orders, OrderDetails
-- ============================================================

-- ============================================================
-- DROP tables if they already exist (for re-runability)
-- ============================================================
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Users;

-- ============================================================
-- CREATE TABLES
-- ============================================================

CREATE TABLE Users (
    UserID      INT             NOT NULL,
    FirstName   VARCHAR(50)     NOT NULL,
    LastName    VARCHAR(50)     NOT NULL,
    Email       VARCHAR(100)    NOT NULL UNIQUE,
    Phone       VARCHAR(20),
    City        VARCHAR(50),
    Country     VARCHAR(50),
    CreatedAt   DATE            NOT NULL,
    CONSTRAINT PK_Users PRIMARY KEY (UserID)
);

CREATE TABLE Products (
    ProductID   INT             NOT NULL,
    Name        VARCHAR(100)    NOT NULL,
    Category    VARCHAR(50),
    Price       DECIMAL(10,2)   NOT NULL,
    Stock       INT             NOT NULL DEFAULT 0,
    CONSTRAINT PK_Products PRIMARY KEY (ProductID)
);

CREATE TABLE Orders (
    OrderID     INT             NOT NULL,
    UserID      INT             NOT NULL,
    OrderDate   DATE            NOT NULL,
    Status      VARCHAR(20)     NOT NULL DEFAULT 'Pending',
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
    CONSTRAINT FK_Orders_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE OrderDetails (
    OrderDetailID   INT             NOT NULL,
    OrderID         INT             NOT NULL,
    ProductID       INT             NOT NULL,
    Quantity        INT             NOT NULL,
    UnitPrice       DECIMAL(10,2)   NOT NULL,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderDetailID),
    CONSTRAINT FK_OD_Orders   FOREIGN KEY (OrderID)   REFERENCES Orders(OrderID),
    CONSTRAINT FK_OD_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ============================================================
-- INSERT: Users (30 records)
-- ============================================================
INSERT INTO Users (UserID, FirstName, LastName, Email, Phone, City, Country, CreatedAt) VALUES
(1,  'Lena',     'Huber',       'lena.huber@example.com',       '+43 676 1234567',  'Vienna',       'Austria',     '2022-01-15'),
(2,  'Max',      'Müller',      'max.mueller@example.com',      '+43 699 2345678',  'Graz',         'Austria',     '2022-02-20'),
(3,  'Sophie',   'Schmidt',     'sophie.schmidt@example.com',   '+49 151 3456789',  'Berlin',       'Germany',     '2022-03-05'),
(4,  'Lukas',    'Fischer',     'lukas.fischer@example.com',    '+49 160 4567890',  'Munich',       'Germany',     '2022-03-22'),
(5,  'Anna',     'Weber',       'anna.weber@example.com',       '+41 79 5678901',   'Zurich',       'Switzerland', '2022-04-10'),
(6,  'Jonas',    'Meyer',       'jonas.meyer@example.com',      '+41 78 6789012',   'Bern',         'Switzerland', '2022-04-28'),
(7,  'Laura',    'Wagner',      'laura.wagner@example.com',     '+43 664 7890123',  'Linz',         'Austria',     '2022-05-14'),
(8,  'Felix',    'Becker',      'felix.becker@example.com',     '+49 176 8901234',  'Hamburg',      'Germany',     '2022-05-30'),
(9,  'Hannah',   'Schulz',      'hannah.schulz@example.com',    '+49 152 9012345',  'Cologne',      'Germany',     '2022-06-18'),
(10, 'Thomas',   'Hoffmann',    'thomas.hoffmann@example.com',  '+43 650 0123456',  'Salzburg',     'Austria',     '2022-07-01'),
(11, 'Julia',    'Koch',        'julia.koch@example.com',       '+49 157 1122334',  'Frankfurt',    'Germany',     '2022-07-19'),
(12, 'David',    'Bauer',       'david.bauer@example.com',      '+41 76 2233445',   'Geneva',       'Switzerland', '2022-08-03'),
(13, 'Sarah',    'Richter',     'sarah.richter@example.com',    '+43 677 3344556',  'Innsbruck',    'Austria',     '2022-08-21'),
(14, 'Tim',      'Klein',       'tim.klein@example.com',        '+49 162 4455667',  'Stuttgart',    'Germany',     '2022-09-07'),
(15, 'Mia',      'Wolf',        'mia.wolf@example.com',         '+49 170 5566778',  'Dresden',      'Germany',     '2022-09-25'),
(16, 'Paul',     'Schröder',    'paul.schroeder@example.com',   '+43 699 6677889',  'Klagenfurt',   'Austria',     '2022-10-12'),
(17, 'Emily',    'Neumann',     'emily.neumann@example.com',    '+41 79 7788990',   'Basel',        'Switzerland', '2022-10-30'),
(18, 'Leon',     'Schwarz',     'leon.schwarz@example.com',     '+49 178 8899001',  'Leipzig',      'Germany',     '2022-11-14'),
(19, 'Lea',      'Zimmermann',  'lea.zimmermann@example.com',   '+43 676 9900112',  'Wels',         'Austria',     '2022-11-29'),
(20, 'Nico',     'Braun',       'nico.braun@example.com',       '+49 175 1011121',  'Nuremberg',    'Germany',     '2022-12-10'),
(21, 'Lara',     'Krüger',      'lara.krueger@example.com',     '+41 77 1112131',   'Lausanne',     'Switzerland', '2023-01-05'),
(22, 'Erik',     'Hartmann',    'erik.hartmann@example.com',    '+49 155 2131415',  'Bremen',       'Germany',     '2023-01-20'),
(23, 'Mia',      'Lange',       'mia.lange@example.com',        '+43 664 3141516',  'Bregenz',      'Austria',     '2023-02-08'),
(24, 'Kevin',    'Schmitt',     'kevin.schmitt@example.com',    '+49 163 4151617',  'Düsseldorf',   'Germany',     '2023-02-25'),
(25, 'Jana',     'Werner',      'jana.werner@example.com',      '+41 76 5161718',   'Lucerne',      'Switzerland', '2023-03-15'),
(26, 'Finn',     'Krause',      'finn.krause@example.com',      '+43 650 6171819',  'Vienna',       'Austria',     '2023-03-31'),
(27, 'Clara',    'Möller',      'clara.moeller@example.com',    '+49 172 7181920',  'Hanover',      'Germany',     '2023-04-18'),
(28, 'Ben',      'Vogt',        'ben.vogt@example.com',         '+41 79 8192021',   'St. Gallen',   'Switzerland', '2023-05-06'),
(29, 'Nina',     'Günther',     'nina.guenther@example.com',    '+49 151 9202122',  'Mainz',        'Germany',     '2023-05-23'),
(30, 'Simon',    'Winkler',     'simon.winkler@example.com',    '+43 699 0212223',  'Graz',         'Austria',     '2023-06-10');

-- ============================================================
-- INSERT: Products (20 records)
-- ============================================================
INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1,  'Wireless Mouse',            'Electronics',  24.99,  150),
(2,  'USB-C Hub 7-in-1',          'Electronics',  39.99,   80),
(3,  'Mechanical Keyboard',       'Electronics',  79.99,   60),
(4,  '27" Full HD Monitor',       'Electronics', 199.99,   35),
(5,  'Laptop Stand Aluminium',    'Accessories',  29.99,  120),
(6,  'Webcam 1080p',              'Electronics',  49.99,   75),
(7,  'Noise-Cancelling Headset',  'Electronics',  89.99,   50),
(8,  'Ergonomic Office Chair',    'Furniture',   249.99,   20),
(9,  'Standing Desk 140cm',       'Furniture',   349.99,   15),
(10, 'LED Desk Lamp',             'Accessories',  19.99,  200),
(11, 'A4 Notepad (50 sheets)',    'Stationery',    3.49,  500),
(12, 'Ballpoint Pen Set (10x)',   'Stationery',    5.99,  300),
(13, 'Whiteboard 90x60cm',       'Furniture',    59.99,   40),
(14, 'HDMI Cable 2m',             'Accessories',   8.99,  250),
(15, 'Power Strip (6-way)',       'Accessories',  14.99,  180),
(16, 'External SSD 1TB',          'Electronics',  99.99,   45),
(17, 'Portable Charger 20000mAh', 'Electronics',  34.99,   90),
(18, 'Cable Management Box',      'Accessories',  12.99,  110),
(19, 'Smartphone Holder',         'Accessories',   9.99,  220),
(20, 'Screen Cleaning Kit',       'Accessories',   6.99,  350);

-- ============================================================
-- INSERT: Orders (30 records)
-- ============================================================
INSERT INTO Orders (OrderID, UserID, OrderDate, Status) VALUES
(1,   1,  '2023-01-10', 'Delivered'),
(2,   2,  '2023-01-15', 'Delivered'),
(3,   3,  '2023-01-22', 'Delivered'),
(4,   4,  '2023-02-03', 'Delivered'),
(5,   5,  '2023-02-14', 'Delivered'),
(6,   6,  '2023-02-28', 'Delivered'),
(7,   7,  '2023-03-07', 'Shipped'),
(8,   8,  '2023-03-19', 'Delivered'),
(9,   9,  '2023-04-01', 'Delivered'),
(10,  10, '2023-04-15', 'Shipped'),
(11,  11, '2023-04-27', 'Delivered'),
(12,  12, '2023-05-09', 'Delivered'),
(13,  13, '2023-05-21', 'Cancelled'),
(14,  14, '2023-06-02', 'Delivered'),
(15,  15, '2023-06-14', 'Delivered'),
(16,  16, '2023-06-26', 'Pending'),
(17,  17, '2023-07-08', 'Delivered'),
(18,  18, '2023-07-20', 'Delivered'),
(19,  19, '2023-08-01', 'Shipped'),
(20,  20, '2023-08-13', 'Delivered'),
(21,  21, '2023-08-25', 'Delivered'),
(22,  22, '2023-09-06', 'Delivered'),
(23,  23, '2023-09-18', 'Pending'),
(24,  24, '2023-09-30', 'Delivered'),
(25,  25, '2023-10-12', 'Delivered'),
(26,  26, '2023-10-24', 'Shipped'),
(27,  27, '2023-11-05', 'Delivered'),
(28,  28, '2023-11-17', 'Delivered'),
(29,  29, '2023-11-29', 'Cancelled'),
(30,  30, '2023-12-11', 'Delivered');

-- ============================================================
-- INSERT: OrderDetails (~60 records, 2 per order on average)
-- ============================================================
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1,   1,  1,  2, 24.99),
(2,   1,  14, 1,  8.99),
(3,   2,  3,  1, 79.99),
(4,   2,  5,  1, 29.99),
(5,   3,  6,  1, 49.99),
(6,   3,  7,  1, 89.99),
(7,   4,  4,  1,199.99),
(8,   4,  2,  1, 39.99),
(9,   5,  8,  1,249.99),
(10,  5,  10, 2, 19.99),
(11,  6,  9,  1,349.99),
(12,  6,  13, 1, 59.99),
(13,  7,  16, 1, 99.99),
(14,  7,  17, 2, 34.99),
(15,  8,  11, 5,  3.49),
(16,  8,  12, 3,  5.99),
(17,  9,  1,  1, 24.99),
(18,  9,  19, 2,  9.99),
(19,  10, 3,  1, 79.99),
(20,  10, 14, 3,  8.99),
(21,  11, 15, 2, 14.99),
(22,  11, 18, 1, 12.99),
(23,  12, 20, 4,  6.99),
(24,  12, 10, 1, 19.99),
(25,  13, 7,  1, 89.99),
(26,  14, 2,  2, 39.99),
(27,  14, 6,  1, 49.99),
(28,  15, 4,  1,199.99),
(29,  15, 5,  2, 29.99),
(30,  16, 16, 2, 99.99),
(31,  17, 8,  1,249.99),
(32,  17, 9,  1,349.99),
(33,  18, 11, 10, 3.49),
(34,  18, 12, 5,  5.99),
(35,  19, 1,  3, 24.99),
(36,  19, 2,  1, 39.99),
(37,  20, 3,  1, 79.99),
(38,  20, 7,  1, 89.99),
(39,  21, 13, 1, 59.99),
(40,  21, 14, 2,  8.99),
(41,  22, 17, 1, 34.99),
(42,  22, 19, 3,  9.99),
(43,  23, 15, 1, 14.99),
(44,  24, 6,  1, 49.99),
(45,  24, 10, 3, 19.99),
(46,  25, 4,  1,199.99),
(47,  25, 16, 1, 99.99),
(48,  26, 5,  2, 29.99),
(49,  26, 18, 2, 12.99),
(50,  27, 1,  1, 24.99),
(51,  27, 20, 2,  6.99),
(52,  28, 3,  1, 79.99),
(53,  28, 2,  1, 39.99),
(54,  29, 7,  1, 89.99),
(55,  30, 4,  1,199.99),
(56,  30, 8,  1,249.99),
(57,  30, 14, 1,  8.99),
(58,  29, 17, 1, 34.99),
(59,  23, 11, 3,  3.49),
(60,  13, 20, 1,  6.99);
