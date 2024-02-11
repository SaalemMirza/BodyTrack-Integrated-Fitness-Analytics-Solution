SELECT 
	--Using CAOLESCE statements for adding text to non-existing trainers
	COALESCE(CAST(t.TrainerID AS VARCHAR),'No Trainer Assigned') AS trainer
    ,COALESCE(CAST(t.TrainerName AS VARCHAR),'No Trainer Assigned') AS trainer_name
    ,COALESCE(t.workouttype,'No workout plan for now') AS workout_type
   ,COUNT(DISTINCT c.CustomerID) AS no_of_customers
FROM
Trainer t RIGHT JOIN Schedule s ON t.ScheduleID = s.ScheduleID
LEFT JOIN Membership m ON s.MembershipID = m.MembershipID
LEFT JOIN Customer c ON c.CustomerID = m.CustomerID
GROUP BY t.TrainerID, t.TrainerName, workout_type
ORDER BY no_of_customers DESC