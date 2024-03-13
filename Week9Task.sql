--1 Get products with unique prices
SELECT name FROM ( SELECT name, COUNT(price) OVER (PARTITION BY price) as price_count FROM products ) t WHERE price_count = 1 ORDER BY name;

--2 Get the first word in alphabetical order
SELECT MIN(word) AS word FROM Words;

--3 Get all words except the first in alphabetical order
SELECT word FROM Words where word > (SELECT MIN(word) FROM words) ORDER BY word;

--4 Get all words containing the letter 'i'
SELECT word FROM Words WHERE word LIKE '%i%';

--5 Get all words beginning with the letter 'a'
SELECT word FROM Words WHERE word LIKE 'a%';

--6 Get all words with exactly 5 letters and second letter 'p'
SELECT word FROM Words WHERE word LIKE '_p___';

--7 Get all words with exactly two 'a' letters
SELECT word FROM Words WHERE LEN(word) - LEN(REPLACE(word, 'a', '')) = 2;

--8 Get the number of groups each user is in (groups per user)
SELECT U.username, COUNT(group_id) AS group_count FROM Users U LEFT JOIN Memberships M ON U.id = M.user_id GROUP BY U.username;

--9 Get the number of users in each group
SELECT name, COUNT(M.user_id) AS user_count FROM Groups G JOIN Memberships M ON G.id = M.group_id GROUP BY G.name;

--10 Get all users who are part of more than one group
SELECT U.username FROM Users U LEFT JOIN Memberships M ON U.id = M.user_id GROUP BY U.username HAVING COUNT(M.group_id) > 1;

--11 Get all the users who are in at least one same group as the user 'uolevi'
SELECT DISTINCT(username) FROM Users U 
INNER JOIN Memberships M ON U.id = M.user_id
WHERE M.group_id IN (
	SELECT M2.group_id 
    FROM Users U2 
    INNER JOIN Memberships M2 ON U2.id = M2.user_id 
    WHERE U2.username = 'uolevi'
);

--12 Get all the members who are not in any of the same groups as the user 'uolevi'
SELECT username FROM Users U 
WHERE U.id NOT IN (
	SELECT M.user_id
    FROM Memberships M
    WHERE M.group_id IN (
        SELECT M2.group_id 
        FROM Users U2 
        INNER JOIN Memberships M2 ON U2.id = M2.user_id 
        WHERE U2.username = 'uolevi'
		)
);

--13 Get the words in alphabetical order, without case sensitivity
SELECT word FROM Words ORDER BY LOWER(word);

--14 Get the product with the cheapest price. If there are several, pick the first one in alphabetical order
SELECT TOP 1 name, price FROM Products WHERE price = (SELECT MIN(price) FROM Products) ORDER BY name;