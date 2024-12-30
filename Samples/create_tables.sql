-- Create the Categories table
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create the Regions table
CREATE TABLE IF NOT EXISTS Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Create the Products table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the Sales fact table for the star schema db
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
