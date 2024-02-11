SELECT
CASE 
WHEN r.BMI <= 18 THEN 'Underweight'
WHEN r.BMI > 18 AND r.BMI <= 24 THEN 'Normal'
WHEN r.BMI > 24 AND r.BMI <=30 THEN 'Obese'
WHEN r.BMI > 30 THEN 'Extremely Obese'
END bmi_category
,COUNT(DISTINCT c.CustomerID) AS no_of_members 
FROM Customer c INNER JOIN CustomerReports r 
ON c.CustomerID = r.CustomerID
GROUP BY bmi_category
ORDER BY no_of_members DESC