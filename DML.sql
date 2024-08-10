SET foreign_key_checks = 0;

-- Insert Data into Items

INSERT INTO Items (item_id, description, item_type, location, unit) VALUES
(1000, 'Bennet Farm free-range eggs', 'Dairy', 'D12', 'dozen'),
(1100, 'Freshness White beans', 'Canned', 'a2', '12 ounce can'),
(1222, 'Freshness Green beans', 'Canned', 'a3', '12 ounce can'),
(1223, 'Freshness Green beans', 'Canned', 'a7', '36 oz can'),
(1224, 'Freshness Wax beans', 'Canned', 'a3', '12 ounce can'),
(2000, 'Ruby\'s Kale', 'Produce', 'p12', 'bunch'),
(2001, 'Ruby\'s Organic Kale', 'Produce', 'po2', 'bunch');

-- Insert Data into Vendors

INSERT INTO Vendors (vendor_name, address) VALUES
('Bennet Farms, Rt. 17 Evansville, IL 55446', 'Bennet Farms, Rt. 17 Evansville, IL 55446'),
('Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678'),
('Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567');

-- Insert Data into Customers

INSERT INTO Customers (customer_id, customer_name) VALUES
(198765, 'Customer A'),
(202900, 'Customer B'),
(111000, 'Customer C'),
(100988, 'Customer D');

-- Insert data into Transactions table
INSERT INTO Transactions (item_id, quantity_on_hand, cost, purchase_date, price, date_sold, customer_id, quantity_sold, vendor_id) VALUES
-- Bennet Farm free-range eggs
(1000, 29, 2.35, '2022-02-01', NULL, NULL, NULL, NULL, 1),
(1000, NULL, NULL, NULL, 5.49, '2022-02-02', 198765, 2, 1),
(1000, NULL, NULL, NULL, 5.99, '2022-02-04', 196777, 2, 1),
(1000, NULL, NULL, NULL, 5.49, '2022-02-11', 277177, 4, 1),

-- Freshness White beans
(1100, NULL, NULL, NULL, 1.49, '2022-02-02', 202900, 2, 2),
(1100, 53, 0.69, '2022-02-02', NULL, NULL, NULL, 40, 2),
(1100, 45, NULL, '2022-02-07', 1.49, NULL, 198765, 8, 2),
(1100, 41, NULL, '2022-02-11', 1.49, NULL, NULL, 4, 2),

-- Freshness Green beans
(1222, 59, 0.59, '2022-02-10', NULL, NULL, NULL, 40, 2),
(1222, NULL, NULL, NULL, 1.29, '2022-02-12', 111000, 12, 2),
(1222, 47, NULL, '2022-02-12', NULL, NULL, NULL, 12, 2),

-- Freshness Wax beans
(1224, 31, 0.65, '2022-02-10', NULL, NULL, NULL, 30, 2),
(1224, NULL, NULL, NULL, 1.55, '2022-02-12', NULL, 8, 2),

-- Ruby's Kale
(2000, NULL, 1.29, '2022-02-12', NULL, NULL, NULL, 25, 3),
(2000, NULL, 3.99, '2022-02-15', NULL, NULL, 111000, 2, 3),

-- Ruby's Organic Kale
(2001, NULL, 2.19, '2022-02-12', NULL, NULL, NULL, 20, 3),
(2001, NULL, 6.99, '2022-02-13', NULL, NULL, 100988, 1, 3),
(2001, NULL, 6.99, '2022-02-14', NULL, NULL, 202900, 12, 3),

-- Freshness Green beans (Additional Row)
(1223, 17, 1.80, '2022-02-15', NULL, NULL, NULL, 10, 2),
(1223, 7, NULL, '2022-02-13', 3.49, NULL, 198765, 5, 2);

-- Retrieve all transactions with item details
SELECT
    t.transaction_id,                -- The unique identifier for the transaction
    t.purchase_date,                 -- The date when the item was purchased
    t.date_sold,                     -- The date when the item was sold
    t.quantity_on_hand,              -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                 -- Quantity of item sold in the transaction
    t.cost,                          -- Cost of the item at the time of transaction
    t.price,                         -- Selling price of the item
    i.description,                   -- Description of the item
    i.item_type,                     -- Type of item (e.g., Dairy, Canned)
    i.location,                      -- Location where the item is stored
    i.unit                            -- Unit of measurement for the item (e.g., dozen, bunch)
FROM
    Transactions t
JOIN
    Items i ON t.item_id = i.item_id; -- Join with Items table based on item_id

-- Retrieve all transactions with vendor details
SELECT
    t.transaction_id,                -- The unique identifier for the transaction
    t.purchase_date,                 -- The date when the item was purchased
    t.date_sold,                     -- The date when the item was sold
    t.quantity_on_hand,              -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                 -- Quantity of item sold in the transaction
    t.cost,                          -- Cost of the item at the time of transaction
    t.price,                         -- Selling price of the item
    v.vendor_name,                   -- Name of the vendor
    v.address                        -- Address of the vendor
FROM
    Transactions t
JOIN
    Vendors v ON t.vendor_id = v.vendor_id; -- Join with Vendors table based on vendor_id

-- Retrieve all transactions with customer details
SELECT
    t.transaction_id,                -- The unique identifier for the transaction
    t.purchase_date,                 -- The date when the item was purchased
    t.date_sold,                     -- The date when the item was sold
    t.quantity_on_hand,              -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                 -- Quantity of item sold in the transaction
    t.cost,                          -- Cost of the item at the time of transaction
    t.price,                         -- Selling price of the item
    c.customer_name                  -- Name of the customer
FROM
    Transactions t
JOIN
    Customers c ON t.customer_id = c.customer_id; -- Join with Customers table based on customer_id

-- Retrieve all items with transaction details
SELECT
    i.item_id,                       -- The unique identifier for the item
    i.description,                  -- Description of the item
    i.item_type,                    -- Type of item (e.g., Dairy, Canned)
    i.location,                     -- Location where the item is stored
    i.unit,                         -- Unit of measurement for the item
    t.transaction_id,               -- The unique identifier for the transaction
    t.purchase_date,                -- The date when the item was purchased
    t.date_sold,                    -- The date when the item was sold
    t.quantity_on_hand,             -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                -- Quantity of item sold in the transaction
    t.cost,                         -- Cost of the item at the time of transaction
    t.price                         -- Selling price of the item
FROM
    Items i
JOIN
    Transactions t ON i.item_id = t.item_id; -- Join with Transactions table based on item_id

-- Retrieve total quantity sold and total revenue by item
SELECT
    i.item_id,                       -- The unique identifier for the item
    i.description,                  -- Description of the item
    SUM(t.quantity_sold) AS total_quantity_sold, -- Total quantity sold for the item
    SUM(t.quantity_sold * t.price) AS total_revenue -- Total revenue generated from the item
FROM
    Items i
JOIN
    Transactions t ON i.item_id = t.item_id -- Join with Transactions table based on item_id
GROUP BY
    i.item_id, i.description;        -- Group by item_id and description to aggregate results

-- Retrieve transactions with vendor and customer details
SELECT
    t.transaction_id,                -- The unique identifier for the transaction
    t.purchase_date,                 -- The date when the item was purchased
    t.date_sold,                     -- The date when the item was sold
    t.quantity_on_hand,              -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                 -- Quantity of item sold in the transaction
    t.cost,                          -- Cost of the item at the time of transaction
    t.price,                         -- Selling price of the item
    i.description AS item_description, -- Description of the item
    v.vendor_name,                   -- Name of the vendor
    v.address AS vendor_address,     -- Address of the vendor
    c.customer_name                  -- Name of the customer
FROM
    Transactions t
JOIN
    Items i ON t.item_id = i.item_id -- Join with Items table based on item_id
JOIN
    Vendors v ON t.vendor_id = v.vendor_id -- Join with Vendors table based on vendor_id
JOIN
    Customers c ON t.customer_id = c.customer_id; -- Join with Customers table based on customer_id

-- Retrieve items and their associated transactions
SELECT
    i.item_id,                       -- The unique identifier for the item
    i.description,                  -- Description of the item
    i.item_type,                    -- Type of item (e.g., Dairy, Canned)
    i.location,                     -- Location where the item is stored
    i.unit,                         -- Unit of measurement for the item
    t.transaction_id,               -- The unique identifier for the transaction
    t.purchase_date,                -- The date when the item was purchased
    t.date_sold,                    -- The date when the item was sold
    t.quantity_on_hand,             -- Quantity of item on hand at the time of transaction
    t.quantity_sold,                -- Quantity of item sold in the transaction
    t.cost,                         -- Cost of the item at the time of transaction
    t.price                         -- Selling price of the item
FROM
    Items i
LEFT JOIN
    Transactions t ON i.item_id = t.item_id; -- Left join with Transactions table to include items with no transactions
