create database LESSON5;
USE LESSON5;
SHOW TABLES;
INSERT INTO `men` (`name`, `address`) 
VALUES 
('Вася', 'Россия'),
('Роман', 'Россия'),
('Джон', 'США'),
('Том', 'Греция'),
('Джек', 'Италия');
INSERT INTO `mount` (`mount_name`, `mount_height`, `mount_address`) 
VALUES
('Эверест', '8848', 'Гималаи'),
('Аннапурна', '8901', 'Гималаи'),
('Чогори', '8614', 'Каракорум');
INSERT INTO `date` (`iddate`, `date_in_mount`, `date_out_mount`, `mount_idmount`) 
VALUES
(1, '2018.02.13', '2018.04.23', 1),
(2, '2018.08.13', '2018.09.20', 1),
(3, '2018.05.13', '2018.05.18', 2),
(4, '2019.04.13', '2019.05.30', 2),
(5, '2019.08.13', '2019.11.03', 3),
(6, '2019.06.13', '2019.08.23', 1);
SELECT * FROM `mount`;
-- 1. Для каждой горы показать список групп, осуществлявших восхождение, в хронологическом порядке. 
SELECT m.mount_name, d.date_in_mount FROM mount m, date d
WHERE m.idmount = d.mount_idmount
ORDER BY d.date_in_mount ASC;

-- 2. Предоставить возможность добавления новой вершины, с указанием названия вершины, высоты и страны местоположения.
INSERT INTO mount(mount_name, mount_height, mount_address)
VALUE ('Чо-Ойю', 8201, 'Гималаи');

-- 3. Предоставить возможность изменения данных о вершине, если на неё не было восхождений. !!!!!
SELECT m.idmount, m.mount_name FROM mount m LEFT JOIN date d ON m.idmount = d.mount_idmount 
WHERE d.date_in_mount IS NULL;
UPDATE mount SET mount_height=5660 WHERE idmount=4; 

-- 4. Показать список альпинистов, осуществлявших восхождение в указанный интервал дат. 
SELECT d.date_in_mount FROM date d
WHERE d.date_in_mount BETWEEN '2019.03.01' AND '2019.06.31';

-- 5. Предоставить возможность добавления нового альпиниста в состав указанной группы. 


-- 6. Показать информацию о количестве восхождений каждого альпиниста на каждую гору. 


-- 7. Показать список восхождений (групп), которые совершались в указанный интервал дат. 
SELECT d.date_in_mount FROM date d
WHERE d.date_in_mount BETWEEN '2019.04.01' AND '2019.07.31'
ORDER BY d.date_in_mount ASC;
-- 8. Предоставить возможность добавления нового восхождения (группы), указав её название, вершину, время начала восхождения. 


-- 9. Предоставить информацию о том, сколько альпинистов побывали на каждой горе. 
 SELECT count(article.title) AS articles_count, user.login FROM user, article
 WHERE user.iduser = article.user_iduser
 GROUP BY user.login;
 
SELECT count(`men.name`),  FROM `men` n
INNER JOIN m.mount ON
