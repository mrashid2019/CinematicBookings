/*1.Find the names of movies showing in "English"*/
SELECT name
FROM movie
WHERE language = 'English';

/* 2. What customer made the biggest payment*/

SELECT users.firstName,users.lastName, MAX(p.amount) as Total
FROM payment p
INNER JOIN users ON  users.userID = p.userID;

/* 3. Name of the movies that are schedule to play this year*/
SELECT m.name
FROM movie m 
WHERE m.movieID IN (SELECT s.movieID  FROM schedule s
					WHERE YEAR(s.start_time) = (SELECT year(CURDATE())));

/*4. What is the role, name, and id of general user has not purchased a ticket*/
SELECT s.userID,s.role,s.firstName,s.lastName
FROM users s
WHERE s.role = 'general' AND s.userID NOT IN
( SELECT t.userID
 FROM tickets t);

/*5. What movie has not sold any tickets?*/
SELECT m.name FROM movie m 
WHERE m.movieID IN ( SELECT s.movieID FROM schedule s
INNER JOIN auditorium ON auditorium.auditoriumID = s.auditoriumID
WHERE s.remaining_seats =  auditorium.total_seats);

/*6. What is the name of the theater user(3009) will attend*/
SELECT t.theater_name
FROM theater t WHERE t.theaterID = (SELECT a.theaterID FROM auditorium a
					WHERE a.auditoriumID = (SELECT s.auditoriumID FROM schedule s
					WHERE s.scheduleID = (SELECT t.scheduleID FROM tickets t
					WHERE userID = 3009)))