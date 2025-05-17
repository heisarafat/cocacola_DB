create database coca_cola_schema;

-- Table for Products (e.g., Coke, Fanta, Sprite)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

-- Table for Regions (e.g., North, South, East, West)
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

-- Main Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    RegionID INT,
    SaleMonth VARCHAR(10),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalSales DECIMAL(12, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Insert Products
INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'Coke'),
(2, 'Fanta'),
(3, 'Sprite');

-- Insert Regions
INSERT INTO Regions (RegionID, RegionName) VALUES
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West');

-- Insert Sales Data 
INSERT INTO Sales (SaleID, ProductID, RegionID, SaleMonth, Quantity, UnitPrice, TotalSales) VALUES
(1, 1, 1, 'January', 100, 1.00, 100.00),
(2, 2, 2, 'January', 80, 1.20, 96.00),
(3, 3, 3, 'January', 120, 1.10, 132.00),
(4, 1, 1, 'February', 90, 1.00, 90.00),
(5, 2, 4, 'February', 70, 1.20, 84.00),
(6, 3, 2, 'February', 130, 1.10, 143.00);


-- Total sales by region
SELECT r.RegionName, SUM(s.TotalSales) AS TotalSales
FROM Sales s
JOIN Regions r ON s.RegionID = r.RegionID
GROUP BY r.RegionName;

-- Top-selling product by total sales
SELECT p.ProductName, SUM(s.TotalSales) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC
LIMIT 1;

-- Sales by month and product
SELECT s.SaleMonth, p.ProductName, SUM(s.TotalSales) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY s.SaleMonth, p.ProductName
ORDER BY s.SaleMonth, TotalSales DESC;




