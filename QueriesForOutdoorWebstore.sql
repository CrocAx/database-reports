--1
UPDATE Products SET Price = Price * 2;

--2
SELECT ProductName, LEN(ProductName) AS NameLenght FROM Products;

--3
SELECT ProductName, LEN(ProductName) AS NameLenght FROM Products WHERE LEN(ProductName) < 20;

--4
SELECT ProductName FROM Products ORDER BY LEN(ProductName), ProductName;

--5
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Customers;

--6
SELECT SUM(LEN(CONCAT(FirstName, ' ', LastName))) AS TotalLenght FROM Customers;

--7
SELECT OrderDetails.OrderId, SUM(Products.Price) AS TotalPrice FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductId GROUP BY OrderDetails.OrderId;

--8
SELECT SUM(Products.Price) AS TotalSumOfAllOrders FROM Products JOIN OrderDetails ON Products.ProductId = OrderDetails.ProductId;

--9
SELECT * FROM Orders WHERE OrderDate BETWEEN '2023-10-03' AND '2024-01-31'; 

--10
SELECT ProductName FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

--11
SELECT ProductName FROM Products WHERE Price <= 2 * (SELECT MIN(Price) FROM Products);

--12
SELECT OrderDetails.OrderId, SUM(Products.Price) AS TotalPrice FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductId GROUP BY OrderDetails.OrderId HAVING SUM(Products.Price) > 100 AND SUM(Products.Price) < 200;

--13
-- Creating VIEW EmployeeOrderTotals
CREATE VIEW EmployeeOrderTotals AS
SELECT E.StoreId, E.EmployeeId, E.FirstName, E.LastName, COUNT(Orders.OrderId) AS TotalOrders 
FROM Employee E 
JOIN Orders ON Orders.EmployeeId = E.EmployeeId 
GROUP BY E.StoreId, E.EmployeeId, E.FirstName, E.LastName; 

-- SELECT for the created VIEW.
SELECT * FROM EmployeeOrderTotals;

--14
--Creating VIEW StoreSalesTotals
CREATE VIEW StoreSalesTotals AS
SELECT S.StoreId, S.StoreName, SUM(P.Price) AS TotalSales
FROM Store S 
JOIN Employee E ON E.StoreId = S.StoreId
JOIN Orders O ON O.EmployeeId = E.EmployeeId
JOIN OrderDetails OD ON OD.OrderId = O.OrderId
JOIN Products P ON P.ProductId = OD.ProductId
GROUP BY S.StoreId, S.StoreName;

--SELECT for the created VIEW.
SELECT * FROM StoreSalesTotals;

--15
--SELECT Employee FullName from created VIEWS
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeFullName
FROM EmployeeOrderTotals EOT
JOIN StoreSalesTotals SST ON EOT.StoreId = SST.StoreId
WHERE TotalSales = (SELECT MAX(TotalSales) FROM StoreSalesTotals);
