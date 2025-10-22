
CREATE SCHEMA Store_dataset
;

-- 1. Offices 
CREATE TABLE Offices (
    OfficeCode INTEGER PRIMARY KEY,
    City VARCHAR,
    Phone VARCHAR,
    AddressLine1 VARCHAR,
    AddressLine2 VARCHAR,
    State VARCHAR,
    Country VARCHAR,
    PostalCode VARCHAR,
    Territory VARCHAR
);

-- 2. Employees 
CREATE TABLE Employees (
    EmployeeNumber INTEGER PRIMARY KEY,
    LastName VARCHAR,
    FirstName VARCHAR,
    Extension VARCHAR, 
    Email VARCHAR,
    OfficeCode INTEGER REFERENCES offices (OfficeCode),
    ReportsTo INTEGER,
    JobTitle VARCHAR
);

-- 3. Customers 
CREATE TABLE Customers (
    CustomerNumber VARCHAR PRIMARY KEY,
    CustomerName VARCHAR,
    ContactLastName VARCHAR,
    ContactFirstName VARCHAR,
    Phone VARCHAR,
    AddressLine1 VARCHAR,
    AddressLine2 VARCHAR,
    City VARCHAR,
    State VARCHAR,
    PostalCode VARCHAR,
    Country VARCHAR,
    SalesRepEmployeeNumber INTEGER REFERENCES employees (EmployeeNumber),
    CreditLimit FLOAT 
);

-- 4. ProductLines
CREATE TABLE ProductLines (
    ProductLine VARCHAR PRIMARY KEY,
    TextDescription VARCHAR,
    HtmlDescription VARCHAR,
    Image VARCHAR
);

-- 5. Products 
CREATE TABLE Products (
    ProductCode VARCHAR PRIMARY KEY,
    ProductName VARCHAR,
    ProductLine VARCHAR REFERENCES Productlines (ProductLine),
    ProductScale VARCHAR,
    ProductVendor VARCHAR,
    ProductDescription TEXT,
    QuantityInStock INTEGER,
    BuyPrice FLOAT,
    MSRP FLOAT
);

-- 6. Orders 
CREATE TABLE Orders (
    OrderNumber VARCHAR PRIMARY KEY,
    OrderDate VARCHAR,
    RequiredDate VARCHAR,
    ShippedDate VARCHAR,
    Status VARCHAR,
    Comments VARCHAR,
    CustomerNumber VARCHAR REFERENCES customers (CustomerNumber) 
);

-- 7. OrderDetails 
CREATE TABLE OrderDetails (
    OrderNumber VARCHAR REFERENCES orders (OrderNumber),
    ProductCode VARCHAR REFERENCES products (ProductCode),
    QuantityOrdered INTEGER,
    PriceEach FLOAT,
    OrderLineNumber INTEGER,
    PRIMARY KEY (OrderNumber, ProductCode)
);

-- 8. Payments
CREATE TABLE Payments (
    CustomerNumber VARCHAR,
    CheckNumber VARCHAR,
    PaymentDate DATE,
    Amount FLOAT,
    PRIMARY KEY (CustomerNumber, CheckNumber),
    FOREIGN KEY (CustomerNumber) REFERENCES Customers(CustomerNumber)
);
