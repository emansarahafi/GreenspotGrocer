CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    description VARCHAR(255),
    item_type VARCHAR(50),
    location VARCHAR(50),
    unit VARCHAR(20)
);

CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    quantity_on_hand INT,
    cost DECIMAL(10, 2),
    purchase_date DATE,
    price DECIMAL(10, 2),
    date_sold DATE,
    customer_id INT,
    quantity_sold INT,
    vendor_id INT,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
);