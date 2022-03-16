CREATE DATABASE IF NOT EXISTS `cinema_booking`; 
USE `cinema_booking`;

CREATE DATABASE IF NOT EXISTS `cinema_booking`;

USE `cinema_booking`;

 

DROP TABLE IF EXISTS `payment`; 
DROP TABLE IF EXISTS `tickets`;
DROP TABLE IF EXISTS `schedule`;
DROP TABLE IF EXISTS `movie`; 
DROP TABLE IF EXISTS `seats`;
DROP TABLE IF EXISTS `auditorium`;
DROP TABLE IF EXISTS `theater`;
DROP TABLE IF EXISTS `users`;  

 

CREATE TABLE `movie`(
`movieID` INT NOT NULL,
`name` VARCHAR(50) NOT NULL,
`description` VARCHAR(250),
`director` VARCHAR(50),
`genre` VARCHAR(50),
`language` VARCHAR(50),
PRIMARY KEY(`MovieID`));
 
 INSERT INTO `movie`(`movieID`, `name`, `description`,`director`,`genre`,`language`) VALUES
	(1001, 'The Unforgivable', 'Ruth Slater, a woman released from prison after serving a sentence for a violent crime and attempts to re-enter society.', 'Nora Fingscheidt', 'Thriller', 'English'),
	(1004, "Don't Look Up", 'Two low-level astronomers must go on a giant media tour to warn mankind of an approaching comet that will destroy planet Earth.', 'Adam McKay', 'Fantasy', 'English'),
	(1005, 'The Rescue', 'The dramatic 2018 rescue of 12 Thai boys and their soccer coach, trapped deep inside a flooded cave.', 'Jimmy Chin, Elizabeth C. Vasarhelyi', 'Documentary', 'English'),
	(1010, 'Raazi', 'During the Indo-Pakistan War of 1971, an Indian spy is married into a Pakistani family by her father so that she can get some valuable information about the enemy.', 'Meghna Gulzar', 'Action', 'Hindi'),
	(1013, 'Talaash: The Answer Lies Within', "Inspector Surjan Singh Shekhawat (Aamir Khan) investigates a popular film star's death.", 'Reema Kagti', 'Thriller', 'Hindi'),
	(1020, 'Veronica', "During a solar eclipse, a teenage girl and her friends want to summon the spirit of the girl's father using an Ouija board.", 'Paco Plaza', 'Horror', 'Spanish'),
    (1023, '7 Anos', 'After four friends become founding partners of a company, they are forced to find a solution that can save the company and themselves.', 'Roger Gual', 'Drama', 'Spanish'),
    (1027, 'Be With You', 'A woman dies, leaving her husband and young son, but during the rain season, she comes back to life and has no memories.', 'Lee Jang-hoon', 'Fantasy', 'Korean');
    
CREATE TABLE `theater`(
    `theaterID` INT NOT NULL AUTO_INCREMENT,
    `theater_name` VARCHAR(50) NOT NULL,
    `theater_location` VARCHAR(50) NOT NULL,
    `auditorium_Amount` INT NOT NULL,     -- number of screens in a theather 
    PRIMARY KEY (`theaterID`)
);

INSERT INTO `theater` (`theater_name`, `theater_location`, `auditorium_Amount`) VALUES
	('Regal Shadowood','9889 Glades Rd, Boca Raton, FL 33434', '10' ), 
	('Cinemark Palace 20 and XD','3200 Airport Rd, Boca Raton, FL 33431', '16' ),
	('IPIC Theaters','301 Plaza Real, Boca Raton, FL 33432', '6' );

CREATE TABLE `auditorium`(
    `auditoriumID` VARCHAR(4), 			
    `theaterID` INT NOT NULL,
    `auditorium_no` INT(10) NOT NULL,	
    `total_seats` INT(50) NOT NULL,
    PRIMARY KEY (`auditoriumID`),
    FOREIGN KEY (`theaterID`) REFERENCES theater(`theaterID`)
);

/*Regal Shadowood*/
INSERT INTO `auditorium`(`auditoriumID`,`theaterID`, `auditorium_no`, `total_seats`) VALUES
('a1', '1', '1', '30'),  
('a2','1', '2', '30'), 
('a3','1', '3', '30'),
('a4','1', '4', '30'),
('a5','1', '5', '30'),
('a6','1', '6', '30'),
('a7','1', '7', '30'),
('a8','1', '8', '30'),
('a9','1', '9', '30'),
('a10','1', '10', '30');

/*Cinemark Palace 20 and XD*/
INSERT INTO `auditorium`(`auditoriumID`,`theaterID`, `auditorium_no`, `total_seats`) VALUES
('b1',2, 1, 35 ), 
('b2',2, 2, 35 ),
('b3',2, 3, 35 ),
('b4',2, 4, 35 ),
('b5',2, 5, 35 ),
('b6',2, 6, 35 ),
('b7',2, 7, 35 ),
('b8',2, 8, 35 ),
('b9',2, 9, 35 ),
('b10',2, 10, 35 ),
('b11',2, 11, 35 ),
('b12',2, 12, 35 ),
('b13',2, 13, 35 ),
('b14',2, 14, 35 ),
('b15',2, 15, 35 ),
('b16',2, 16, 35 );

/*IPIC Theater*/
INSERT INTO `auditorium`(`auditoriumID`,`theaterID`, `auditorium_no`, `total_seats`) VALUES
('c1',3, 1,20 ),
('c2',3, 2,20 ),
('c3',3, 3,20 ),
('c4',3, 4,20 ),
('c5',3, 5,20 ),
('c6',3, 6,20 );

 

CREATE TABLE `seats`(
    `seatID` INT NOT NULL AUTO_INCREMENT,
    `auditoriumID` VARCHAR(4),
    `seat_no` INT(50) NOT NULL,
    PRIMARY KEY (`seatID`),
    FOREIGN KEY (`auditoriumID`) REFERENCES auditorium(`auditoriumID`)
);

INSERT INTO `seats` (`auditoriumID`,`seat_no`) VALUES

/*Regal Shadowood ---> 10 auditoriums[ids a1 to a10],30 seats each*/
('a1' , 1), ('a1' , 2), ('a1' , 3), ('a1' , 4), ('a1' , 5), ('a1' , 6), ('a1' , 7), ('a1' , 8), ('a1' , 9), ('a1' , 10), ('a1' , 11), ('a1' , 12), ('a1' , 13), ('a1' , 14), ('a1' , 15), ('a1' , 16), ('a1' , 17), ('a1' , 18), ('a1' , 19), ('a1' , 20), ('a1' , 21), ('a1' , 22), ('a1' , 23), ('a1' , 24), ('a1' , 25), ('a1' , 26), ('a1' , 27), ('a1' , 28), ('a1' , 29), ('a1' , 30),
('a2' , 1), ('a2' , 2), ('a2' , 3), ('a2' , 4), ('a2' , 5), ('a2' , 6), ('a2' , 7), ('a2' , 8), ('a2' , 9), ('a2' , 10), ('a2' , 11), ('a2' , 12), ('a2' , 13), ('a2' , 14), ('a2' , 15), ('a2' , 16), ('a2' , 17), ('a2' , 18), ('a2' , 19), ('a2' , 20), ('a2' , 21), ('a2' , 22), ('a2' , 23), ('a2' , 24), ('a2' , 25), ('a2' , 26), ('a2' , 27), ('a2' , 28), ('a2' , 29), ('a2' , 30), 
('a3' , 1), ('a3' , 2), ('a3' , 3), ('a3' , 4), ('a3' , 5), ('a3' , 6), ('a3' , 7), ('a3' , 8), ('a3' , 9), ('a3' , 10), ('a3' , 11), ('a3' , 12), ('a3' , 13), ('a3' , 14), ('a3' , 15), ('a3' , 16), ('a3' , 17), ('a3' , 18), ('a3' , 19), ('a3' , 20), ('a3' , 21), ('a3' , 22), ('a3' , 23), ('a3' , 24), ('a3' , 25), ('a3' , 26), ('a3' , 27), ('a3' , 28), ('a3' , 29), ('a3' , 30), 
('a4' , 1), ('a4' , 2), ('a4' , 3), ('a4' , 4), ('a4' , 5), ('a4' , 6), ('a4' , 7), ('a4' , 8), ('a4' , 9), ('a4' , 10), ('a4' , 11), ('a4' , 12), ('a4' , 13), ('a4' , 14), ('a4' , 15), ('a4' , 16), ('a4' , 17), ('a4' , 18), ('a4' , 19), ('a4' , 20), ('a4' , 21), ('a4' , 22), ('a4' , 23), ('a4' , 24), ('a4' , 25), ('a4' , 26), ('a4' , 27), ('a4' , 28), ('a4' , 29), ('a4' , 30), 
('a5' , 1), ('a5' , 2), ('a5' , 3), ('a5' , 4), ('a5' , 5), ('a5' , 6), ('a5' , 7), ('a5' , 8), ('a5' , 9), ('a5' , 10), ('a5' , 11), ('a5' , 12), ('a5' , 13), ('a5' , 14), ('a5' , 15), ('a5' , 16), ('a5' , 17), ('a5' , 18), ('a5' , 19), ('a5' , 20), ('a5' , 21), ('a5' , 22), ('a5' , 23), ('a5' , 24), ('a5' , 25), ('a5' , 26), ('a5' , 27), ('a5' , 28), ('a5' , 29), ('a5' , 30), 
('a6' , 1), ('a6' , 2), ('a6' , 3), ('a6' , 4), ('a6' , 5), ('a6' , 6), ('a6' , 7), ('a6' , 8), ('a6' , 9), ('a6' , 10), ('a6' , 11), ('a6' , 12), ('a6' , 13), ('a6' , 14), ('a6' , 15), ('a6' , 16), ('a6' , 17), ('a6' , 18), ('a6' , 19), ('a6' , 20), ('a6' , 21), ('a6' , 22), ('a6' , 23), ('a6' , 24), ('a6' , 25), ('a6' , 26), ('a6' , 27), ('a6' , 28), ('a6' , 29), ('a6' , 30), 
('a7' , 1), ('a7' , 2), ('a7' , 3), ('a7' , 4), ('a7' , 5), ('a7' , 6), ('a7' , 7), ('a7' , 8), ('a7' , 9), ('a7' , 10), ('a7' , 11), ('a7' , 12), ('a7' , 13), ('a7' , 14), ('a7' , 15), ('a7' , 16), ('a7' , 17), ('a7' , 18), ('a7' , 19), ('a7' , 20), ('a7' , 21), ('a7' , 22), ('a7' , 23), ('a7' , 24), ('a7' , 25), ('a7' , 26), ('a7' , 27), ('a7' , 28), ('a7' , 29), ('a7' , 30), 
('a8' , 1), ('a8' , 2), ('a8' , 3), ('a8' , 4), ('a8' , 5), ('a8' , 6), ('a8' , 7), ('a8' , 8), ('a8' , 9), ('a8' , 10), ('a8' , 11), ('a8' , 12), ('a8' , 13), ('a8' , 14), ('a8' , 15), ('a8' , 16), ('a8' , 17), ('a8' , 18), ('a8' , 19), ('a8' , 20), ('a8' , 21), ('a8' , 22), ('a8' , 23), ('a8' , 24), ('a8' , 25), ('a8' , 26), ('a8' , 27), ('a8' , 28), ('a8' , 29), ('a8' , 30), 
('a9' , 1), ('a9' , 2), ('a9' , 3), ('a9' , 4), ('a9' , 5), ('a9' , 6), ('a9' , 7), ('a9' , 8), ('a9' , 9), ('a9' , 10), ('a9' , 11), ('a9' , 12), ('a9' , 13), ('a9' , 14), ('a9' , 15), ('a9' , 16), ('a9' , 17), ('a9' , 18), ('a9' , 19), ('a9' , 20), ('a9' , 21), ('a9' , 22), ('a9' , 23), ('a9' , 24), ('a9' , 25), ('a9' , 26), ('a9' , 27), ('a9' , 28), ('a9' , 29), ('a9' , 30), 
('a10' , 1), ('a10' , 2), ('a10' , 3), ('a10' , 4), ('a10' , 5), ('a10' , 6), ('a10' , 7), ('a10' , 8), ('a10' , 9), ('a10' , 10), ('a10' , 11), ('a10' , 12), ('a10' , 13), ('a10' , 14), ('a10' , 15), ('a10' , 16), ('a10' , 17), ('a10' , 18), ('a10' , 19), ('a10' , 20), ('a10' , 21), ('a10' , 22), ('a10' , 23), ('a10' , 24), ('a10' , 25), ('a10' , 26), ('a10' , 27), ('a10' , 28), ('a10' , 29), ('a10' , 30);


/*Cinemark Palace 20 and XD---> 16 auditoriums [ids b1 to b16], 35 seats each*/
INSERT INTO `seats` (`auditoriumID`,`seat_no`) VALUES
('b1' , 1), ('b1' , 2), ('b1' , 3), ('b1' , 4), ('b1' , 5), ('b1' , 6), ('b1' , 7), ('b1' , 8), ('b1' , 9), ('b1' , 10), ('b1' , 11), ('b1' , 12), ('b1' , 13), ('b1' , 14), ('b1' , 15), ('b1' , 16), ('b1' , 17), ('b1' , 18), ('b1' , 19), ('b1' , 20), ('b1' , 21), ('b1' , 22), ('b1' , 23), ('b1' , 24), ('b1' , 25), ('b1' , 26), ('b1' , 27), ('b1' , 28), ('b1' , 29), ('b1' , 30), ('b1' , 31), ('b1' , 32), ('b1' , 33), ('b1' , 34), ('b1' , 35), 
('b2' , 1), ('b2' , 2), ('b2' , 3), ('b2' , 4), ('b2' , 5), ('b2' , 6), ('b2' , 7), ('b2' , 8), ('b2' , 9), ('b2' , 10), ('b2' , 11), ('b2' , 12), ('b2' , 13), ('b2' , 14), ('b2' , 15), ('b2' , 16), ('b2' , 17), ('b2' , 18), ('b2' , 19), ('b2' , 20), ('b2' , 21), ('b2' , 22), ('b2' , 23), ('b2' , 24), ('b2' , 25), ('b2' , 26), ('b2' , 27), ('b2' , 28), ('b2' , 29), ('b2' , 30), ('b2' , 31), ('b2' , 32), ('b2' , 33), ('b2' , 34), ('b2' , 35), 
('b3' , 1), ('b3' , 2), ('b3' , 3), ('b3' , 4), ('b3' , 5), ('b3' , 6), ('b3' , 7), ('b3' , 8), ('b3' , 9), ('b3' , 10), ('b3' , 11), ('b3' , 12), ('b3' , 13), ('b3' , 14), ('b3' , 15), ('b3' , 16), ('b3' , 17), ('b3' , 18), ('b3' , 19), ('b3' , 20), ('b3' , 21), ('b3' , 22), ('b3' , 23), ('b3' , 24), ('b3' , 25), ('b3' , 26), ('b3' , 27), ('b3' , 28), ('b3' , 29), ('b3' , 30), ('b3' , 31), ('b3' , 32), ('b3' , 33), ('b3' , 34), ('b3' , 35), 
('b4' , 1), ('b4' , 2), ('b4' , 3), ('b4' , 4), ('b4' , 5), ('b4' , 6), ('b4' , 7), ('b4' , 8), ('b4' , 9), ('b4' , 10), ('b4' , 11), ('b4' , 12), ('b4' , 13), ('b4' , 14), ('b4' , 15), ('b4' , 16), ('b4' , 17), ('b4' , 18), ('b4' , 19), ('b4' , 20), ('b4' , 21), ('b4' , 22), ('b4' , 23), ('b4' , 24), ('b4' , 25), ('b4' , 26), ('b4' , 27), ('b4' , 28), ('b4' , 29), ('b4' , 30), ('b4' , 31), ('b4' , 32), ('b4' , 33), ('b4' , 34), ('b4' , 35),
('b5' , 1), ('b5' , 2), ('b5' , 3), ('b5' , 4), ('b5', 5), ('b5', 6), ('b5', 7), ('b5', 8), ('b5', 9), ('b5', 10), ('b5', 11), ('b5', 12), ('b5', 13), ('b5', 14), ('b5', 15), ('b5', 16), ('b5', 17), ('b5', 18), ('b5', 19), ('b5', 20), ('b5', 21), ('b5', 22), ('b5', 23), ('b5', 24), ('b5', 25), ('b5', 26), ('b5', 27), ('b5', 28), ('b5', 29), ('b5', 30), ('b5', 31), ('b5', 32), ('b5', 33), ('b5', 34), ('b5', 35), 
('b6' , 1), ('b6' , 2), ('b6' , 3), ('b6' , 4), ('b6' , 5), ('b6' , 6), ('b6' , 7), ('b6' , 8), ('b6' , 9), ('b6' , 10), ('b6' , 11), ('b6' , 12), ('b6' , 13), ('b6' , 14), ('b6' , 15), ('b6' , 16), ('b6' , 17), ('b6' , 18), ('b6' , 19), ('b6' , 20), ('b6' , 21), ('b6' , 22), ('b6' , 23), ('b6' , 24), ('b6' , 25), ('b6' , 26), ('b6' , 27), ('b6' , 28), ('b6' , 29), ('b6' , 30), ('b6' , 31), ('b6' , 32), ('b6' , 33), ('b6' , 34), ('b6' , 35), 
('b7' , 1), ('b7' , 2), ('b7' , 3), ('b7' , 4), ('b7' , 5), ('b7' , 6), ('b7' , 7), ('b7' , 8), ('b7' , 9), ('b7' , 10), ('b7' , 11), ('b7' , 12), ('b7' , 13), ('b7' , 14), ('b7' , 15), ('b7' , 16), ('b7' , 17), ('b7' , 18), ('b7' , 19), ('b7' , 20), ('b7' , 21), ('b7' , 22), ('b7' , 23), ('b7' , 24), ('b7' , 25), ('b7' , 26), ('b7' , 27), ('b7' , 28), ('b7' , 29), ('b7' , 30), ('b7' , 31), ('b7' , 32), ('b7' , 33), ('b7' , 34), ('b7' , 35), 
('b8' , 1), ('b8' , 2), ('b8' , 3), ('b8' , 4), ('b8' , 5), ('b8' , 6), ('b8' , 7), ('b8' , 8), ('b8' , 9), ('b8' , 10), ('b8' , 11), ('b8' , 12), ('b8' , 13), ('b8' , 14), ('b8' , 15), ('b8' , 16), ('b8' , 17), ('b8' , 18), ('b8' , 19), ('b8' , 20), ('b8' , 21), ('b8' , 22), ('b8' , 23), ('b8' , 24), ('b8' , 25), ('b8' , 26), ('b8' , 27), ('b8' , 28), ('b8' , 29), ('b8' , 30), ('b8' , 31), ('b8' , 32), ('b8' , 33), ('b8' , 34), ('b8' , 35), 
('b9' , 1), ('b9' , 2), ('b9' , 3), ('b9' , 4), ('b9' , 5), ('b9' , 6), ('b9' , 7), ('b9' , 8), ('b9' , 9), ('b9' , 10), ('b9' , 11), ('b9' , 12), ('b9' , 13), ('b9' , 14), ('b9' , 15), ('b9' , 16), ('b9' , 17), ('b9' , 18), ('b9' , 19), ('b9' , 20), ('b9' , 21), ('b9' , 22), ('b9' , 23), ('b9' , 24), ('b9' , 25), ('b9' , 26), ('b9' , 27), ('b9' , 28), ('b9' , 29), ('b9' , 30), ('b9' , 31), ('b9' , 32), ('b9' , 33), ('b9' , 34), ('b9' , 35), 
('b10' , 1), ('b10' , 2), ('b10' , 3), ('b10' , 4), ('b10' , 5), ('b10' , 6), ('b10' , 7), ('b10' , 8), ('b10' , 9), ('b10' , 10), ('b10' , 11), ('b10' , 12), ('b10' , 13), ('b10' , 14), ('b10' , 15), ('b10' , 16), ('b10' , 17), ('b10' , 18), ('b10' , 19), ('b10' , 20), ('b10' , 21), ('b10' , 22), ('b10' , 23), ('b10' , 24), ('b10' , 25), ('b10' , 26), ('b10' , 27), ('b10' , 28), ('b10' , 29), ('b10' , 30), ('b10' , 31), ('b10' , 32), ('b10' , 33), ('b10' , 34), ('b10' , 35), 
('b11' , 1) , ('b11' , 2), ('b11' , 3), ('b11' , 4), ('b11' , 5), ('b11' , 6), ('b11' , 7), ('b11' , 8), ('b11' , 9), ('b11' , 10), ('b11' , 11), ('b11' , 12), ('b11' , 13), ('b11' , 14), ('b11' , 15), ('b11' , 16), ('b11' , 17), ('b11' , 18), ('b11' , 19), ('b11' , 20), ('b11' , 21), ('b11' , 22), ('b11' , 23), ('b11' , 24), ('b11' , 25), ('b11' , 26), ('b11' , 27), ('b11' , 28), ('b11' , 29), ('b11' , 30), ('b11' , 31), ('b11' , 32), ('b11' , 33), ('b11' , 34), ('b11' , 35), 
('b12' , 1), ('b12' , 2), ('b12' , 3), ('b12' , 4), ('b12' , 5), ('b12' , 6), ('b12' , 7), ('b12' , 8), ('b12' , 9), ('b12' , 10), ('b12' , 11), ('b12' , 12), ('b12' , 13), ('b12' , 14), ('b12' , 15), ('b12' , 16), ('b12' , 17), ('b12' , 18), ('b12' , 19), ('b12' , 20), ('b12' , 21), ('b12' , 22), ('b12' , 23), ('b12' , 24), ('b12' , 25), ('b12' , 26), ('b12' , 27), ('b12' , 28), ('b12' , 29), ('b12' , 30), ('b12' , 31), ('b12' , 32), ('b12' , 33), ('b12' , 34), ('b12' , 35), 
('b13' , 1), ('b13' , 2), ('b13' , 3), ('b13' , 4), ('b13' , 5), ('b13' , 6), ('b13' , 7), ('b13' , 8), ('b13' , 9), ('b13' , 10), ('b13' , 11), ('b13' , 12), ('b13' , 13), ('b13' , 14), ('b13' , 15), ('b13' , 16), ('b13' , 17), ('b13' , 18), ('b13' , 19), ('b13' , 20), ('b13' , 21), ('b13' , 22), ('b13' , 23), ('b13' , 24), ('b13' , 25), ('b13' , 26), ('b13' , 27), ('b13' , 28), ('b13' , 29), ('b13' , 30), ('b13' , 31), ('b13' , 32), ('b13' , 33), ('b13' , 34), ('b13' , 35), 
('b14' , 1), ('b14' , 2), ('b14' , 3), ('b14' , 4), ('b14' , 5), ('b14' , 6), ('b14' , 7), ('b14' , 8), ('b14' , 9), ('b14' , 10), ('b14' , 11), ('b14' , 12), ('b14' , 13), ('b14' , 14), ('b14' , 15), ('b14' , 16), ('b14' , 17), ('b14' , 18), ('b14' , 19), ('b14' , 20), ('b14' , 21), ('b14' , 22), ('b14' , 23), ('b14' , 24), ('b14' , 25), ('b14' , 26), ('b14' , 27), ('b14' , 28), ('b14' , 29), ('b14' , 30), ('b14' , 31), ('b14' , 32), ('b14' , 33), ('b14' , 34), ('b14' , 35),
('b15' , 1),('b15' , 2),('b15' , 3),('b15' , 4),('b15' , 5),('b15' , 6),('b15' , 7),('b15' , 8),('b15' , 9), ('b15' , 10), ('b15' , 11), ('b15' , 12), ('b15' , 13), ('b15' , 14), ('b15' , 15), ('b15' , 16), ('b15' , 17), ('b15' , 18), ('b15' , 19), ('b15' , 20), ('b15' , 21), ('b15' , 22), ('b15' , 23), ('b15' , 24), ('b15' , 25), ('b15' , 26), ('b15' , 27), ('b15' , 28), ('b15' , 29), ('b15' , 30), ('b15' , 31), ('b15' , 32), ('b15' , 33), ('b15' , 34), ('b15' , 35), 
('b16' , 1), ('b16' , 2), ('b16' , 3), ('b16' , 4), ('b16' , 5), ('b16' , 6), ('b16' , 7), ('b16' , 8), ('b16' , 9), ('b16' , 10), ('b16' , 11), ('b16' , 12), ('b16' , 13), ('b16' , 14), ('b16' , 15), ('b16' , 16), ('b16' , 17), ('b16' , 18), ('b16' , 19), ('b16' , 20), ('b16' , 21), ('b16' , 22), ('b16' , 23), ('b16' , 24), ('b16' , 25), ('b16' , 26), ('b16' , 27), ('b16' , 28), ('b16' , 29), ('b16' , 30), ('b16' , 31), ('b16' , 32), ('b16' , 33), ('b16' , 34), ('b16' , 35);


/*IPIC Theater --> 6 auditoriums[ids c1 to c6], 20 seats each*/
INSERT INTO `seats` (`auditoriumID`,`seat_no`) VALUES
('c1' , 1),('c1' , 2),('c1' , 3),('c1' , 4),('c1' , 5),('c1' , 6),('c1' , 7),('c1' , 8), ('c1' , 9), ('c1' , 10), ('c1' , 11), ('c1' , 12), ('c1' , 13), ('c1' , 14), ('c1' , 15), ('c1' , 16), ('c1' , 17), ('c1' , 18), ('c1' , 19), ('c1' , 20),
('c2' , 1), ('c2' , 2), ('c2' , 3), ('c2' , 4), ('c2' , 5), ('c2' , 6), ('c2' , 7), ('c2' , 8), ('c2' , 9), ('c2' , 10), ('c2' , 11), ('c2' , 12), ('c2' , 13), ('c2' , 14), ('c2' , 15), ('c2' , 16), ('c2' , 17), ('c2' , 18), ('c2' , 19), ('c2' , 20), 
('c3' , 1), ('c3' , 2), ('c3' , 3), ('c3' , 4), ('c3' , 5), ('c3' , 6), ('c3' , 7), ('c3' , 8), ('c3' , 9), ('c3' , 10), ('c3' , 11), ('c3' , 12), ('c3' , 13), ('c3' , 14), ('c3' , 15), ('c3' , 16), ('c3' , 17), ('c3' , 18), ('c3' , 19), ('c3' , 20),
('c4' , 1), ('c4', 2), ('c4' , 3), ('c4', 4), ('c4', 5), ('c4', 6), ('c4', 7), ('c4', 8), ('c4', 9), ('c4', 10), ('c4', 11), ('c4', 12), ('c4', 13), ('c4', 14), ('c4', 15), ('c4', 16), ('c4', 17), ('c4', 18), ('c4', 19), ('c4', 20),
('c5' , 1), ('c5' , 2), ('c5' , 3), ('c5' , 4), ('c5' , 5), ('c5' , 6), ('c5' , 7), ('c5' , 8), ('c5' , 9), ('c5' , 10), ('c5' , 11), ('c5' , 12), ('c5' , 13), ('c5' , 14), ('c5' , 15), ('c5' , 16), ('c5' , 17), ('c5' , 18), ('c5' , 19), ('c5' , 20), 
('c6' , 1), ('c6' , 2), ('c6' , 3), ('c6' , 4), ('c6' , 5), ('c6' , 6), ('c6' , 7), ('c6' , 8), ('c6' , 9), ('c6' , 10), ('c6' , 11), ('c6' , 12), ('c6' , 13), ('c6' , 14), ('c6' , 15), ('c6' , 16), ('c6' , 17), ('c6' , 18), ('c6' , 19), ('c6' , 20);


CREATE TABLE `schedule`(
`scheduleID` INT NOT NULL AUTO_INCREMENT,
`auditoriumID` INT NOT NULL,
`start_time` DATE,
`end_time` DATE,
`remaining_seats` INT(50) NOT NULL,
`movieID` INT NOT NULL,
PRIMARY KEY (`scheduleID`),
FOREIGN KEY (`movieID`) REFERENCES movie(`movieID`),
FOREIGN KEY (`auditoriumID`) REFERENCES auditorium(`auditoriumID`)
 );
 
 INSERT INTO `schedule` (`auditoriumID`, `start_time`, `end_time`, `remaining_seats`, `movieID`) VALUES
 ('11', '2019-03-20', '2019-04-05', '15', '1005'),
 ('32', '2020-12-22', '2021-03-20', '35', '1001'),
 ('29', '2022-01-05', '2022-02-28', '8', '1013'),
  ('3', '2022-02-01', '2022-04-20', '20', '1004');

 
CREATE TABLE `users`(
    `userID` INT NOT NULL,
    `role` VARCHAR(50) NOT NULL,
    `username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`userID`)
);

INSERT INTO `users` (`userID`,`role`, `username`, `password`, `email`, `firstName`, `lastName`) VALUES
('3000','general', 'Ally44', '394lica', 'ally44@live.com', 'Ally', 'Lester'),
('3002','general', 'CJ3476', 'temp34', 'CJproduction@gmail.com', 'Clark', 'Jackson'),
('0001','admin', 'AdminAccess', 'Access22', 'admins@gmail.com', 'Admin', 'Use'),   
('3005','general', 'DougO', 'maxxy2004', 'Doug.Oakley@yahoo.com', 'Douglas', 'Oakley'),
('3006','general', 'CleveT', 'cleveroness', 'cleveland_t@hotmail.com', 'Cleveland', 'Trujillo'),
('3009','general', 'diaa23', 'temp123', 'mahdia@hotmail.com', 'Mahdia', 'Rashid');


 
CREATE TABLE `tickets`(
`ticketID` INT NOT NULL,
`date` DATE,
`price` DECIMAL(20) NOT NULL,
`paymentID` INT NOT NULL,
`userID` INT NOT NULL,
`scheduleID` INT NOT NULL,
PRIMARY KEY (`ticketID`),
FOREIGN KEY (`userID`) REFERENCES users(`userID`),
FOREIGN KEY (`scheduleID`) REFERENCES `schedule` (`scheduleID`)
);
 
 INSERT INTO `tickets` (`ticketID`,`date`, `price`, `paymentID`, `userID`, `scheduleID`) VALUES
 ('1111','2019-03-22', '40.00', '2', '3009', '4'),
 ('1112', '2019-04-01', '10.00', '3', '3006', '2'),
 ('1114', '2020-01-13', '15.00', '1', '3005', '1');
 
 
 

CREATE TABLE `payment`(
    `paymentID` INT NOT NULL AUTO_INCREMENT,
    `ticketID` INT NOT NULL,
    `amount` INT(12) NOT NULL,
    `cardNumber` VARCHAR(20) NOT NULL,
    `userID` INT NOT NULL,
    PRIMARY KEY (`paymentID`),
    FOREIGN KEY (`ticketID`)  REFERENCES tickets(`ticketID`),
    FOREIGN KEY (`userID`) REFERENCES users(`userID`)
);

INSERT INTO `payment` (`ticketID`, `amount`, `cardNumber`, `userID`) VALUES
('1111', '20.00', '3440947502842836', '3002'),
('1114', '30.00', '9248395729374773', '3006'),
('1112', '10.00','2938999300229393', '3009');
