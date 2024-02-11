WITH Customer_ranking AS (
  SELECT
     CRS.customerid
    ,CRS.customerreportid
    ,CRS.weightinlbs
    ,CRS.BMI
    ,CRS.notes
    --Ranking customers as per their weights.
    ,ROW_NUMBER() OVER (ORDER BY CRS.weightinlbs DESC) as Rank
  FROM Customerreports  AS CRS
)
  SELECT
  CR.customerid as Customer_ID
,CR.customerreportid as Customer_Reportid
,CONCAT(CONCAT (c. FirstName,' '), c. LastName) as Customer_Name
,CR.weightinlbs as Weightin_lbs
,CR.BMI
,CR.notes
,C.Gender
,Rank
FROM Customer_ranking  CR
JOIN CUSTOMER C
ON CR.CUSTOMERID=C.CUSTOMERID
WHERE Rank <= 5
ORDER BY Rank