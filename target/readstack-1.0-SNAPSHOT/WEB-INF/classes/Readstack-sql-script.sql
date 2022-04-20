DROP DATABASE IF EXISTS readstack;
CREATE DATABASE readstack CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE readstack;

CREATE TABLE IF NOT EXISTS category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500)

);

CREATE TABLE IF NOT EXISTS discovery (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(80) NOT NULL,
    url VARCHAR(500) NOT NULL UNIQUE,
    description VARCHAR(500) NOT NULL,
    date_added DATETIME NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

insert into category (name, description) values ('Rozrywka', 'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue');
insert into category (name, description) values ('Biznes', 'erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede');
insert into category (name, description) values ('Polityka', 'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla');

insert into discovery (title, url, description, date_added, category_id) values ('molestie lorem quisque', 'http://ow.ly/odio/curabitur/convallis.js', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', '2020-04-09 13:45:51', 3);
insert into discovery (title, url, description, date_added, category_id) values ('hac', 'http://yahoo.co.jp/aliquam/non/mauris/morbi.xml', 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi', '2020-01-22 11:55:54', 3);
insert into discovery (title, url, description, date_added, category_id) values ('blandit lacinia', 'http://washington.edu/velit/id/pretium/iaculis/diam/erat.png', 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', '2020-07-05 13:02:27', 1);
insert into discovery (title, url, description, date_added, category_id) values ('ipsum primis in', 'http://pinterest.com/platea/dictumst/morbi/vestibulum/velit/id.json', 'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', '2020-11-18 14:13:53', 1);
insert into discovery (title, url, description, date_added, category_id) values ('ipsum primis in', 'http://arizona.edu/amet/nulla/quisque/arcu/libero/rutrum/ac.js', 'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce', '2020-01-30 23:36:48', 3);
insert into discovery (title, url, description, date_added, category_id) values ('id massa id', 'https://yelp.com/vel/enim/sit/amet/nunc.jsp', 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', '2020-01-30 16:58:09', 2);
insert into discovery (title, url, description, date_added, category_id) values ('ac', 'http://cmu.edu/nulla/integer/pede/justo.png', 'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim', '2020-02-04 07:16:18', 2);
insert into discovery (title, url, description, date_added, category_id) values ('pretium quis lectus', 'https://businessweek.com/nisi/vulputate/nonummy.xml', 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce', '2020-09-05 06:09:55', 1);
insert into discovery (title, url, description, date_added, category_id) values ('venenatis turpis', 'https://w3.org/diam/in/magna.aspx', 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', '2020-02-18 15:15:44', 1);
insert into discovery (title, url, description, date_added, category_id) values ('at velit', 'https://1688.com/porttitor/lacus/at/turpis/donec/posuere.html', 'magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', '2020-08-29 11:54:58', 3);

CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_role (
    username VARCHAR(50) NOT NULL,
    role_name VARCHAR(20) NOT NULL DEFAULT 'USER',
    PRIMARY KEY (username, role_name),
    FOREIGN KEY (username) REFERENCES user(username)
);

ALTER TABLE discovery
    ADD user_id INT,
    ADD FOREIGN KEY (user_id) REFERENCES user(id);
    
SET foreign_key_checks = 0;
UPDATE discovery SET user_id = 1;
SET foreign_key_checks = 1;

ALTER TABLE discovery MODIFY COLUMN user_id INT NOT NULL;

CREATE TABLE vote (
	user_id INT NOT NULL,
    discovery_id INT NOT NULL,
    type ENUM('UP', 'DOWN') NOT NULL,
    date_added DATETIME NOT NULL,
    PRIMARY KEY (user_id, discovery_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (discovery_id) REFERENCES discovery(id)
);

