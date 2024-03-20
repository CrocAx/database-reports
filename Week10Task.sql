-- 1 Count, how many ways can you choose 2 products, in Products table, so that the combined price is exactly 10.


SELECT COUNT(*) AS combination_count 
FROM (
    SELECT P1.id AS id1, P2.id AS id2 
    FROM Products P1 
    JOIN Products P2 ON P1.id <= P2.id 
    WHERE P1.price + P2.price = 10
) AS subquery;

-- 2 Calculate the smallest difference between two products, that don't share same price

SELECT MIN(id_diff) AS smallest_difference
FROM (
	SELECT ABS(P1.id - P2.id) AS id_diff
	FROM Products P1
	JOIN Products P2 ON P1.id < P2.id
	WHERE P1.price != P2.price
)AS subquery; 

-- 3 Calculate the balance of each account based on the transactions

SELECT A.owner, COALESCE(SUM(T.change), 0) AS Balance
FROM Accounts A
LEFT JOIN Transactions T ON A.id = T.account_id
GROUP BY A.owner
ORDER BY Balance DESC;


--4 Get the balance history for Uolevi's account balance. Transactions are in order by their id.

SELECT SUM(T.change) OVER (ORDER BY T.id) AS Balance_history
FROM Accounts A
LEFT JOIN Transactions T ON A.id = T.account_id
WHERE A.owner = 'Uolevi'

-- 5 Get the largest balance of each account during their history.

WITH BalanceHistory AS (
    SELECT 
        T.account_id, 
        A.owner, 
        SUM(T.change) OVER (PARTITION BY T.account_id ORDER BY T.id) AS Balance
    FROM Accounts A
    LEFT JOIN Transactions T ON A.id = T.account_id
)

SELECT 
    owner, 
    COALESCE(MAX(Balance), 0) AS LargestBalance
FROM BalanceHistory
GROUP BY owner
ORDER BY LargestBalance DESC;


-- 6 Calculate, how many different exercises each student has solved correctly.

SELECT S.name, COUNT(DISTINCT T.exercise_id) AS correct_exercises
FROM Students S
LEFT JOIN Transmissions T ON S.id = T.student_id AND T.state = 1
GROUP BY S.name;

-- 7 Calculate how many transmissions each student has made to a single exercise.

SELECT S.name, ISNULL(MAX(T.transmissions_count), 0) AS max_transmissions
FROM Students AS S 
LEFT JOIN (
	SELECT student_id, exercise_id, COUNT(*) AS transmissions_count
    FROM Transmissions
    GROUP BY student_id, exercise_id ) AS T 
	ON S.id = T.student_id
GROUP BY S.name;
