CREATE TABLE BOOK (
	BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
    BOOK_NAME VARCHAR(100), 
    BOOK_AUTHOR VARCHAR(100),
    BOOK_YEAR_OF_PUBLCATION DATETIME,
    BOOK_EDITION VARCHAR(10),
    BOOK_DISCOUNT DECIMAL(3, 2),
    BOOK_AMOUNT INT,
    BOOK_PRICE FLOAT,
    BOOK_COST FLOAT
);

-- Create the ACCOUNT table
CREATE TABLE ACCOUNT (
    ACCOUNT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ACCOUNT_NAME VARCHAR(255),
    ACCOUNT_PASSWORD VARCHAR(8),
    CUS_ID INT,
    MANAGER_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES MANAGER(MANAGER_ID)
);

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    CUS_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUS_NAME VARCHAR(255),
    VIP BOOLEAN,
    PHONE_NUMBER VARCHAR(255),
    COUPON INT
);

-- Create the MANAGER table
CREATE TABLE MANAGER (
    MANAGER_ID INT PRIMARY KEY AUTO_INCREMENT,
    MANAGER_NAME VARCHAR(255),
    PHONE_NUMBER VARCHAR(10)
);


CREATE TABLE PROFIT (
	PROFIT_CUS_ID INT PRIMARY KEY AUTO_INCREMENT,
    PROFIT_AMOUNT FLOAT
);

CREATE TABLE INVOICE (
    INV_ID INT PRIMARY KEY AUTO_INCREMENT,
    INV_CUS_ID INT,
    INV_PAYMENT_METHOD VARCHAR(100),
    INV_METHOD VARCHAR(100),
    INV_SHIP_METHOD VARCHAR(100),
    INV_PRICE FLOAT,
    INV_ADDRESS VARCHAR(100),
    INV_DATE DATE
);

CREATE TABLE CART (
    CART_ID INT PRIMARY KEY AUTO_INCREMENT,
    CART_BOOK_ID INT,
    CART_CUS_ID INT
);

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_INV_ID INT,
    ORDER_BOOK_ID INT,
    ORDER_BOOK_AMOUNT INT,
    ORDER_CUS_ID INT
);

ALTER TABLE ORDERS
ADD COLUMN ORDER_CUS_ID INT,
ADD CONSTRAINT ORDER_CUS_ID
    FOREIGN KEY (ORDER_CUS_ID) REFERENCES INVOICE(INV_CUS_ID);