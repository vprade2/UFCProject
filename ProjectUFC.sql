--Using case statement to list the name of the fighters who won

SELECT date,
CASE
	WHEN winner = 'red' THEN R_fighter
	WHEN winner = 'blue' THEN B_fighter
END AS Winner_of_fight
FROM UFC_Project..ufc_master


--Using cte to show the fighters with the total amount of wins in UFC from 2010-2021

WITH Max_Amount_of_Wins as
(
SELECT date, 
CASE
	WHEN winner = 'red' THEN R_fighter
	WHEN winner = 'blue' THEN B_fighter
END AS Winner_of_fight
FROM UFC_Project..ufc_master
)
Select Winner_of_fight, Count(Winner_of_fight) AS Total_Wins
FROM Max_Amount_of_Wins
GROUP BY Winner_of_fight
ORDER BY Total_Wins DESC


--Showing the fighter with the total amount of wins in the lightweight division 

WITH Max_Amount_of_Wins as
(
SELECT date, weight_class,
CASE
	WHEN winner = 'red' THEN R_fighter
	WHEN winner = 'blue' THEN B_fighter
END AS Winner_of_fight
FROM UFC_Project..ufc_master
)
Select Winner_of_fight, weight_class, Count(Winner_of_fight) AS Total_Wins
FROM Max_Amount_of_Wins
Where weight_class like '%lightweight%'
GROUP BY Winner_of_fight, weight_class
ORDER BY Total_Wins DESC

--Showing the amount of fighters per country 

SELECT Count(*) AS Num_of_Fighters, Country
FROM UFC_Project..Fighters
WHERE country is NOT NULL
GROUP BY Country
ORDER BY Num_of_fighters DESC