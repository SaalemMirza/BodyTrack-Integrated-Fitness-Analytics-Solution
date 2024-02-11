SELECT 
	DISTINCT d.week, 
	SUM(p.Amount) AS revenue,
	/*Using LAG function to get the previous week
	Assigning 0 to previous week columns of first week using COALESCE function*/
	COALESCE(LAG (d.week,1) OVER (ORDER BY d.week),0) AS previous_week,
	/* Change in percentage = (Current Week - Previous Week)/Previous Week
	Truncating the Double Precision output to 1 precision*/
        COALESCE(LAG (SUM(p.Amount),1) OVER (),0) AS previous_revenue,
	COALESCE(
		TRUNC(((SUM(p.Amount) - LAG (SUM(p.Amount),1) OVER ())/LAG (SUM(p.Amount),1) OVER ()*100)::NUMERIC,1),0) 
		AS growth_in_percentage
FROM dates d
INNER JOIN Payment p ON d.DateID = p.DateID
GROUP BY d.week
ORDER BY d.week