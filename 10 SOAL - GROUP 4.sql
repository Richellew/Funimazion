 
/*1.	Display StudioName and StaffCount (obtained from count how many distinct staff) live in the same city with the studio for every staff that was born after 1990 or Staff Password length less than 8.*/ 
	SELECT S.StudioName, COUNT(DISTINCT StaffID) AS StaffCount
	FROM MsStudio S
	JOIN MsStaff St ON S.CityID = St.CityID
	WHERE (YEAR(St.StaffDOB) > 1990 OR LEN(St.StaffPassword) < 8)
	GROUP BY S.StudioName




/*2.	Display CustomerName and CountAnimeNotFullfiledAgeCriteria (obtained from count anime the customer had subscribed) for every customer that is not fulfilled with the anime minimum age if today is January 1st, 2022, and SalesDuration is between 10 and 20.*/ 
	SELECT
	CustomerName,
	COUNT(DISTINCT c.AnimeID) AS CountAnimeNotFullfiledAgeCriteria
	FROM MsCustomer a
	JOIN SalesHeader b ON a.CustomerID = b.CustomerID
	JOIN SalesDetail c ON b.SalesID = c.SalesID
	JOIN MsAnime d ON c.AnimeID = d.AnimeID
	WHERE DurationDay BETWEEN 10 AND 20
	AND AnimeAge > YEAR('2022-01-01') - YEAR(CustomerDOB)
	GROUP BY CustomerName




/*3.	Display StudioName, AnimeMinimumAge (obtained from the minimum of anime minimum age from all animes), AnimeMaximumAge (obtained from the maximum of anime minimum age from all animes), and LatestPurchaseDateQuarter (obtained from latest quarter of purchase date) for each studio name contains two or more words and anime description length is less than 10.*/
SELECT StudioName, [AnimeMinimumAge] = MIN(AnimeAge), [AnimeMaximumAge] = MAX(AnimeAge),[LatestPurchaseDateQuarter] = DATEPART(QUARTER,MAX(PurchaseDate))
FROM MsStudio a
JOIN PurchaseHeader b ON a.StudioID = b.StudioID
JOIN PurchaseDetail c ON b.PurchaseID = c.PurchaseId
JOIN MsAnime d ON c.AnimeId = d.AnimeID
WHERE
    StudioName LIKE '% %'
    AND LEN(AnimeDescription) < 10
GROUP BY
    StudioName, AnimeName,AnimeDescription



/*4.	Display GenreName (obtained from uppercase of GenreName) and SaleCount (obtained from total sales count) and SaleDurationSum (obtained from the sum of total sale duration of animes ends with “ Days”) for each anime description that has at least 3 words and SaleCount is more than 5.*/ 
SELECT
	[GenreName] = UPPER(GenreName),
	[SaleCount] = COUNT(sd.SalesID),
	[SaleDurationSum] = CAST(SUM(DurationDay) AS VARCHAR) + ' Days' 
FROM SalesHeader sh JOIN  SalesDetail sd on sh.SalesID = sd.SalesID JOIN MsAnime ma
on sd.AnimeID = ma.AnimeID Join MsGenre mg on ma.GenreID = mg.GenreID
WHERE AnimeDescription LIKE '% %' 
GROUP BY UPPER(GenreName)
HAVING COUNT(sd.AnimeID) > 5


/*5.	Display CustomerName (obtained from lowercase of CustomerName), AnimeName (obtained from uppercase of AnimeName), and AverageSpend (obtained from average of multiplication between animePricePerDay and salesDuration) for each customer that has lowercase or uppercase vocal alphabet in the first letter of its name and has AverageSpend more than the average of all AverageSpend of customers.
(ALIAS SUBQUERY)
*/ 

SELECT
	[CustomerName] = LOWER(CustomerName),
	[AnimeName] = UPPER(AnimeName),
	[AverageSpend] = AVG(DurationDay * AnimePrice)
FROM MsCustomer a
JOIN SalesHeader b ON a.CustomerID = b.CustomerID
JOIN SalesDetail c ON b.SalesID = c.SalesID
JOIN MsAnime d ON c.AnimeID = d.AnimeID
WHERE (LEFT(CustomerName, 1) LIKE 'A%'
	OR LEFT(CustomerName, 1) LIKE 'a%'
	OR LEFT(CustomerName, 1) LIKE 'I%'
	OR LEFT(CustomerName, 1) LIKE 'i%'
	OR LEFT(CustomerName, 1) LIKE 'U%'
	OR LEFT(CustomerName, 1) LIKE 'u%'
	OR LEFT(CustomerName, 1) LIKE 'E%'
	OR LEFT(CustomerName, 1) LIKE 'e%'
	OR LEFT(CustomerName, 1) LIKE 'O%'
	OR LEFT(CustomerName, 1) LIKE 'o%')
GROUP BY CustomerName, AnimeName
HAVING AVG(DurationDay * AnimePrice) > (
    SELECT AVG(AvgSpend)
    FROM (
        SELECT AVG(DurationDay * AnimePrice) AS AvgSpend
        FROM MsCustomer mc
        JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID
		join SalesDetail sd on sd.SalesID = sh.SalesID
        JOIN MsAnime ma ON sd.AnimeID = ma.AnimeID
        GROUP BY mc.CustomerID
    ) AS avgall
)


/*6.	Display CustomerName, SalesId (obtained by replacing first 2 characters of SalesId with 'Sales-'), and SalesDayOfYear (obtained from day of year from SalesDate) for each Sale transaction that has the cheapest anime and occurs in March, May, or July.
(ALIAS SUBQUERY)
*/
SELECT CustomerName,
      [SalesId] = STUFF(sh.SalesID,1,2,'Sales-'),
      [SalesDayOfYear] = DATEPART(DAYOFYEAR, sh.SalesDate),
	  month(salesdate) as salesdate
FROM SalesHeader sh
JOIN SalesDetail sd on sh.SalesID = sd.SalesID
JOIN MsAnime ma ON sd.AnimeID = ma.AnimeID
JOIN MsCustomer mc ON mc.CustomerID = sh.CustomerID,
(
SELECT MIN(AnimePrice) AS min1
FROM MsAnime
) as min2 
WHERE MONTH(SalesDate) IN (3, 5, 7)AND  AnimePrice = min2.min1


/*7.	Display CustomerName, CustomerDOB (obtained from formatting Customer to 'Dayname DD-Month-YY'), and TotalSpending (obtained from combining the sum of SalesDuration and AnimePricePerDay with ' Rupiah') for each customer born in the first half of the month (day of CustomerDOB is less than or equal 15) and has subscribed all kind of genre of anime.
(ALIAS SUBQUERY)
*/

SELECT
    mc.CustomerName,
    CONVERT (varchar,CustomerDOB, 5) AS CustomerDOB,
    CONCAT(SUM(sd.DurationDay * AnimePrice), ' Rupiah') AS TotalSpending
FROM
    MsCustomer mc
    JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID
    JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
    JOIN MsAnime ma ON sd.AnimeID = ma.AnimeID
WHERE
    DAY(CustomerDOB) <= 15
    AND mc.CustomerID NOT IN (
        SELECT
					mc.CustomerID
				FROM
					MsCustomer mc
					JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID
					JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
					JOIN msAnime a ON sd.AnimeID = a.AnimeID
					JOIN MsGenre g ON a.GenreID = g.GenreID
				GROUP BY
					mc.CustomerID
				HAVING
					COUNT(DISTINCT g.GenreID) < (SELECT COUNT(*) FROM MsGenre)
			)
		GROUP BY
			mc.CustomerID, mc.CustomerName, mc.CustomerDOB;


/*8.	Display StaffName, StaffId (obtained from replacing 'SF' from Staffid to 'Staff '), StaffPassword (obtained from reversing staffPassword for security reason), and LatestPurchaseYear (obtained from the latest year of purchase transaction) for each staff that had handled the most purchase transactions with different studio and each studio name doesn’t contain any special character (special characters is characters beside lowercase or uppercase alphabet, numeric, and space) in its name.
(ALIAS SUBQUERY)
*/
SELECT StaffName,
    [StaffId] = REPLACE(ms.StaffID,'SF','Staff '),
    [StaffPassword] = REVERSE(StaffPassword),
	[LatestPurchaseYear] = YEAR(MAX(PurchaseDate))
FROM MsStaff AS ms JOIN PurchaseHeader ph  ON ms.StaffId = ph.StaffID JOIN (
	SELECT StaffId
    FROM PurchaseHeader
	GROUP BY StaffId, StudioID
    HAVING COUNT(*) = (
       SELECT MAX(count1)
       FROM 
	   (
	   SELECT COUNT(*) AS count1
       FROM PurchaseHeader
       GROUP BY StaffId, StudioID
        ) AS count2
        )
    ) AS maxtransaction ON ms.StaffId = maxtransaction.StaffID
GROUP BY StaffName, ms.StaffID, StaffPassword;


/*9.	Create view CustomerData that displays CustomerName and CustomerEmailName (obtained from letters before '@' in CustomerEmail) for each customer that has average of SalesDuration more than 10 and never watch 2 or more animes with the same genre.*/ 
CREATE VIEW CustomerData AS
SELECT CustomerName, LEFT(CustomerEmail, CHARINDEX('@', CustomerEmail) - 1) AS[CustomerEmailName]
FROM MsCustomer mc LEFT JOIN ( SELECT SH.CustomerID, COUNT(DISTINCT ma.GenreID) AS [UniqueGenres] 
FROM SalesHeader sh JOIN SalesDetail sd ON sh.SalesID = sd.SalesID JOIN MsAnime ma ON ma.AnimeID = sd.AnimeID
    GROUP BY sh.CustomerID
    HAVING COUNT(DISTINCT ma.GenreID) = COUNT(ma.AnimeID)
) AS ABC ON mc.CustomerID = ABC.CustomerID LEFT JOIN (
    SELECT sh.CustomerID, AVG(sd.DurationDay) AS avg1
    FROM SalesHeader sh JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
    GROUP BY sh.CustomerID
) AS ma ON mc.CustomerID = ma.CustomerID
WHERE ma.avg1 > 10

SELECT*FROM CustomerData

/*10.	Create view AnimesCustomerMayWatch that displays CustomerName, CouldWatchAnimeCount (obtained from count anime), and AveragePrice (obtained by combining average of anime price per day ends with ' Rupiah') for every customer that fulfilled with the anime minimum age criteria if today is July 8th, 2021, and the average price is less than 18000.*/ 
CREATE VIEW AnimesCustomerMayWatch AS
SELECT
  CustomerName,
  [CouldWatchAnimeCount] = COUNT(DISTINCT c.AnimeID),
  [AveragePrice] = CAST(AVG(AnimePrice) AS VARCHAR) + ' Rupiah'
FROM MsCustomer a
JOIN SalesHeader b ON a.CustomerID = b.CustomerID
JOIN SalesDetail c ON b.SalesID = c.SalesID
JOIN MsAnime d ON c.AnimeID = d.AnimeID
WHERE AnimeAge <= DATEDIFF(YEAR, CustomerDOB,'2021-07-08')
GROUP BY CustomerName
HAVING AVG(AnimePrice) < 18000

SELECT*FROM AnimesCustomerMayWatch