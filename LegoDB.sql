DROP database IF  exists lego;
create database if not exists lego;
use lego;
SET FOREIGN_KEY_CHECKS = 0;
drop table if exists lego_sets, categories, users, user_sets;

create table lego_sets(
	lego_id INT	NOT NULL auto_increment,
    set_name varchar(45) default null,
    catalog_number INT(5) default null,
    price int(5) default null,
    year_of_release year default null,
    category_id char(2) not null,
    foreign key (category_id) references category(category_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY (lego_id),
    unique key (catalog_number)
)ENGINE=InnoDB auto_increment=1 default charset=utf8;

create table categories(
	category_id char(2) not null,
    category_name varchar(45) default null,
    duplo enum ('Y', 'N') not null,
    primary key (category_id),
    unique key (category_name)
)ENGINE=InnoDB default charset=utf8;

create table users(
	user_id INT NOT NULL auto_increment,
    first_name varchar(45) default null,
    last_name varchar(45) default null,
    email varchar(45) default null,
    date_of_birth date,
    primary key (user_id),
    unique key (email)
)ENGINE=InnoDB auto_increment=1 default charset=utf8;

create table user_sets(
	user_id int not null,
    lego_id int not null,
    from_year year not null,
    foreign key (user_id) references users  (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    foreign key (lego_id) references lego_sets (lego_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    primary key(user_id, lego_id)
)ENGINE=InnoDB default charset=utf8;


###Values
INSERT INTO users values
	(1, 'Andrzej', 'Sikorski', 'andrzej@mail.com', '1994-07-23'),
    (2, 'Robert', 'Kowal', 'robert@mail.com', '1993-02-21'),
    (3, 'Katarzyna', 'Kondratowska', 'kasia@mail.com', '1995-01-29'),
    (4, 'Radosław', 'Nowacki', 'radek@mail.com', '1989-09-30'),
    (5, 'Anna', 'Nowakowska', 'anna@mail.com', '1990-05-14');
    
INSERT INTO lego_sets values
	(1, 'Secret of the Sphinx', 5978, 450, '1998', 'ad'),
    (2, 'Jungle Temple', 5986, 800, '1999', 'ad'),
    (3, 'Temple of Anubis', 5988, 950, '1998', 'ad'),
    (4, 'Evil Mountain', 6087, 320, '1997', 'ca'),
    (5, 'Count Batlords Kingdom', 6099, 850, '1997', 'ca'),
    (6, 'Dino Research Compound', 5987, 1000, '2000', 'ad'),
    (7, 'Giant Zoo', 4960, 200, '2006', 'du'),
    (8, 'Brickbeards Bounty', 6243, 1500, '2009', 'pi'),
    (9, 'Black Seas Barracuda', 6285, 3000, '1989', 'pi'),
    (10, 'Skulls Eye Schooner', 6286, 4000, '1993', 'pi'),
    (11, 'Red Beard Runner', 6289, 1500, '1996', 'pi'),
    (12, 'Royal Knights Castle', 6090, 2000, '1995', 'ca'),
    (13, 'The mines of Moria', 9473, 1200, '2012', 'lo'),
    (14, 'The battle of helm''s deep', 9474, 1500, '2012', 'lo'),
    (15, 'King''s Castle', 6098, 1000, '2000', 'ca'),
    (16, 'King''s Castle', 7946, 1100, '2010', 'ca'),
    (17, 'Hospital', 5795, 200, '2011', 'du'),
    (18, 'Railway Express', 4561, 1500, '1999', 'ci'),
    (19, 'Highspeed Train Starter Kit', 4559, 1800, '1996', 'ci'),
    (20, 'Big Chief Rattle Snakes Camp', 6766, 900, '1997', 'we'),
    (21, 'Fort Legoredo', 6769, 1250, '1996', 'we');

insert into categories values
	('ad', 'Adventures', 'N'),
    ('ca', 'Castle', 'N'),
    ('du', 'Duplo', 'Y'),
    ('we', 'Western', 'N'),
    ('ci', 'City', 'N'),
    ('pi', 'Pirates', 'N'),
    ('lo', 'LOTR', 'N');
    
insert into user_sets values
	(1, 1, '1998'),
    (2, 12, '2005'),
    (1, 2, '2011'),
    (1, 21, '2010'),
    (4, 8, '1990'),
    (5, 16, '2012'),
    (1, 6, '2000'),
    (2, 11, '1998'),
    (2, 14, '2013'),
    (3, 7, '2006'),
    (1, 20, '2010'),
    (2, 3, '1999'),
    (1, 3, '2010'),
    (4, 3, '2000'),
    (5, 18, '2001'),
    (2, 18, '2000'),
    (1, 18, '2012'),
    (2, 17, '2015'),
    (3, 9, '2014'),
    (1, 8, '2012'),
    (2, 8, '2010');

SET FOREIGN_KEY_CHECKS = 1;

select u.first_name, u.last_name, l.set_name, c.category_name, us.from_year  from users u 
join user_sets us on u.user_id = us.user_id
join lego_sets l on l.lego_id = us.lego_id
join categories c on l.category_id = c.category_id
where u.first_name = 'Andrzej';
