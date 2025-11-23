CREATE DATABASE BanggoodDB;
USE BanggoodDB;


---Average Price per Category--
SELECT Category, AVG(Price_Clean) AS AvgPrice
FROM BanggoodProducts
GROUP BY Category;


-- Average Rating per Category--

SELECT Category, AVG(Rating_Clean) AS AvgRating
FROM BanggoodProducts
GROUP BY Category;

--Number of Products per Category--

SELECT Category, COUNT(*) AS ProductCount
FROM BanggoodProducts
GROUP BY Category;


-- Top 5 Reviewed Items per Category--

SELECT 
    Category,
    Product,
    Reviews_Clean
FROM 
    (
        SELECT *,
               ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Reviews_Clean DESC) AS rn
        FROM BanggoodProducts
    ) AS ranked
WHERE rn <= 5
ORDER BY 
    Category,
    Reviews_Clean DESC;

