
-- ========================================
-- 📚 Online Bookstore SQL Script (Oracle)
-- With Only Executed Queries
-- ========================================

-- Table Creation

CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    email VARCHAR2(100),
    city VARCHAR2(50)
);

CREATE TABLE Books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    author VARCHAR2(100),
    price NUMBER(10, 2),
    genre VARCHAR2(50)
);

CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    book_id NUMBER,
    order_date DATE,
    quantity NUMBER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Data Insertion

INSERT INTO Customers VALUES (1, 'Alice Johnson', 'alice@email.com', 'New York');
INSERT INTO Customers VALUES (2, 'Bob Smith', 'bob@email.com', 'Los Angeles');
INSERT INTO Customers VALUES (3, 'Charlie Lee', 'charlie@email.com', 'Chicago');
INSERT INTO Customers VALUES (4, 'Diana King', 'diana@email.com', 'Houston');

INSERT INTO Books VALUES (101, 'The Alchemist', 'Paulo Coelho', 350.00, 'Fiction');
INSERT INTO Books VALUES (102, 'Sapiens', 'Yuval Noah Harari', 499.50, 'History');
INSERT INTO Books VALUES (103, 'Deep Work', 'Cal Newport', 300.00, 'Productivity');
INSERT INTO Books VALUES (104, 'The Hobbit', 'J.R.R. Tolkien', 399.00, 'Fantasy');

INSERT INTO Orders VALUES (1001, 1, 101, TO_DATE('2025-06-01', 'YYYY-MM-DD'), 2);
INSERT INTO Orders VALUES (1002, 2, 103, TO_DATE('2025-06-02', 'YYYY-MM-DD'), 1);
INSERT INTO Orders VALUES (1003, 1, 102, TO_DATE('2025-06-03', 'YYYY-MM-DD'), 1);
INSERT INTO Orders VALUES (1004, 3, 104, TO_DATE('2025-06-05', 'YYYY-MM-DD'), 3);
INSERT INTO Orders VALUES (1005, 4, 101, TO_DATE('2025-06-06', 'YYYY-MM-DD'), 1);

-- ========================================
-- 🔎 Executed SELECT Queries
-- ========================================

-- View all customers
SELECT * FROM Customers;

-- View selected columns from Books
SELECT title, price FROM Books;

-- Get customers from Chicago
SELECT name, city FROM Customers WHERE city = 'Chicago';

-- Valid OR query
SELECT name, email FROM Customers WHERE city = 'New York' OR city = 'Los Angeles';

-- AND condition on name and city
SELECT name, email FROM Customers WHERE city = 'New York' AND name = 'Alice Johnson';

-- LIKE query on title
SELECT title FROM Books WHERE title LIKE 'Deep%';

-- LIKE query on email
SELECT email FROM Customers WHERE email LIKE '%email.com';

-- BETWEEN query on order dates
SELECT * FROM Orders 
WHERE order_date BETWEEN TO_DATE('2025-06-01', 'YYYY-MM-DD') 
                    AND TO_DATE('2025-06-05', 'YYYY-MM-DD');

-- ORDER BY book_id ascending
SELECT * FROM Books ORDER BY book_id;

-- ORDER BY book_id descending
SELECT * FROM Books ORDER BY book_id DESC;
