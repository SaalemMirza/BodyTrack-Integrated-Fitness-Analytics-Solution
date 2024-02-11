SELECT 
	c.Gender
	,TRUNC(AVG(c.Age)::NUMERIC,1) AS average_age
	,TRUNC(AVG(p.Amount)::NUMERIC,1) AS average_revenue
	,TRUNC(AVG(r.BMI)::NUMERIC,1) AS average_bmi
	FROM Customer c
	INNER JOIN Customerreports r ON c.customerid = r.customerid
	INNER JOIN Membership m ON c.customerid = m.customerid
	INNER JOIN Payment p ON m.paymentid = p.paymentid
	WHERE MembershipType = 'Premium' and PaymentType IN ('Cash','PayPal')
GROUP BY c.Gender