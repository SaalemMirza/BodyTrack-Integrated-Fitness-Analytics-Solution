SELECT
	/*Using Dense Rank function to assign consecutive ranks.
	  Ranks are assigned based on total revenue in descending order*/
	DENSE_RANK() OVER (ORDER BY SUM(p.Amount) DESC) AS day_rank,
	DayofWeek,
	SUM(Amount) AS revenue
FROM Schedule s LEFT JOIN Membership m 
ON s.MembershipID = m.MembershipID
INNER JOIN Payment p 
ON m.PaymentID = p.PaymentID
GROUP BY DayofWeek