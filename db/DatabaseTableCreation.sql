DROP TABLE "UsersToProjects"
DROP TABLE "Tasks"
DROP TABLE "Users"
DROP TABLE "Records"
DROP TABLE "Projects"

CREATE TABLE "Users" (
  "Id" int NOT NULL PRIMARY KEY,
  "Name" varchar(50)
);

CREATE TABLE "Projects" (
  "Id" int NOT NULL PRIMARY KEY,
  "Name" varchar(50),
  "isArchived" bit,
  "Description" varchar(500)
);

CREATE TABLE "UsersToProjects" (
  "Id" int NOT NULL PRIMARY KEY,
  "UserId" int,
  "ProjectId" int
);

CREATE TABLE "Tasks" (
  "Id" int PRIMARY KEY,
  "Name" varchar(50),
  "EstimatedPomodori" int,
  "ActualPomodori" int,
  "InternalInterruptions" int,
  "ExternalInterruptions" int,
  "UserId" int,
  "isArchived" bit,
  "ProjectId" int,
  "RecordId" int,
  "isAssigned" bit
);

CREATE TABLE "Records" (
  "Id" int PRIMARY KEY,
  "StartTime" datetime,
  "EndTime" datetime,
  "ProjectId" int
);

ALTER TABLE "Tasks" ADD FOREIGN KEY ("UserId") REFERENCES "Users" ("Id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");

ALTER TABLE "Records" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("RecordId") REFERENCES "Records" ("Id");

ALTER TABLE "UsersToProjects" ADD FOREIGN KEY ("UserId") REFERENCES "Users" ("Id");

ALTER TABLE "UsersToProjects" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");

INSERT INTO Users([Id],[Name]) VALUES(0,'Fleur'),(1,'Steven'),(2,'Kasimir'),(3,'Rhea'),(4,'Amber'),(5,'Keiko'),(6,'Upton'),(7,'Kuame'),(8,'April'),(9,'Phillip'),(10,'Emmanuel'),(11,'Cassady'),(12,'Lani'),(13,'Leo'),(14,'Regina'),(15,'Justin'),(16,'Arden'),(17,'Felicia'),(18,'Leandra'),(19,'Thaddeus'),(20,'Gil'),(21,'Francesca'),(22,'Hakeem'),(23,'Bruno'),(24,'Yolanda'),(25,'Amir'),(26,'Katell'),(27,'Eagan'),(28,'Olivia'),(29,'Donna'),(30,'Maya'),(31,'Gary'),(32,'Nolan'),(33,'Petra'),(34,'Iliana'),(35,'Joel'),(36,'Rama'),(37,'Alisa'),(38,'Britanney'),(39,'Riley'),(40,'Jelani'),(41,'Connor'),(42,'McKenzie'),(43,'Kirestin'),(44,'Irene'),(45,'James'),(46,'Colton'),(47,'Sonya'),(48,'Cooper'),(49,'Bethany'),(50,'Kitra'),(51,'Bryar'),(52,'Quintessa'),(53,'Herrod'),(54,'Victor'),(55,'Beau'),(56,'Knox'),(57,'Ursa'),(58,'Phoebe'),(59,'Barclay'),(60,'Shoshana'),(61,'Burke'),(62,'Patience'),(63,'Yoko'),(64,'Dominique'),(65,'Rajah'),(66,'Kelly'),(67,'Mallory'),(68,'Dakota'),(69,'Alexandra'),(70,'Mary'),(71,'Tobias'),(72,'Malachi'),(73,'Belle'),(74,'Blaze'),(75,'Forrest'),(76,'Claire'),(77,'Holly'),(78,'Autumn'),(79,'Fletcher'),(80,'Lyle'),(81,'Nehru'),(82,'Deborah'),(83,'Nehru'),(84,'Remedios'),(85,'Simon'),(86,'Ina'),(87,'Tana'),(88,'Mark'),(89,'Henry'),(90,'Aline'),(91,'Tasha'),(92,'September'),(93,'Myra'),(94,'Ryder'),(95,'Jessamine'),(96,'Edward'),(97,'Tamekah'),(98,'Byron'),(99,'Sasha');

INSERT INTO Projects([Id],[Name],[isArchived],[Description]) VALUES(0,'Nathaniel',0,'Ac Ipsum Limited'),(1,'Autumn',0,'At Velit LLP'),(2,'Aline',0,'Nisi Dictum Corporation'),(3,'Barclay',0,'Consequat Purus Inc.'),(4,'Lareina',0,'A Purus Duis LLP'),(5,'Malachi',0,'Amet Faucibus Ut Industries'),(6,'Bree',0,'Consectetuer Adipiscing Corporation'),(7,'Yeo',0,'Blandit Foundation'),(8,'Adena',0,'Aliquet Vel Institute'),(9,'Desirae',0,'Elit Dictum Industries'),(10,'Robert',0,'Donec Tempor Associates'),(11,'Sasha',0,'Aliquet Diam Sed Ltd'),(12,'Beatrice',0,'Volutpat Corporation'),(13,'Rachel',0,'Blandit LLP'),(14,'Vladimir',0,'Amet Incorporated'),(15,'Reagan',0,'Ipsum Associates'),(16,'Quincy',0,'Dapibus Quam Quis Institute'),(17,'Troy',0,'Auctor Nunc Nulla Company'),(18,'Michael',0,'Metus Foundation'),(19,'Thomas',0,'Elit Fermentum Risus PC'),(20,'Thaddeus',0,'Risus Foundation'),(21,'Porter',0,'Nunc Quisque LLC'),(22,'Elvis',0,'Nonummy Ultricies Company'),(23,'Jane',0,'Auctor Consulting'),(24,'Dieter',0,'Quisque Corp.'),(25,'Tanek',0,'Gravida Praesent Eu Associates'),(26,'Levi',0,'Libero Lacus Varius Foundation'),(27,'Cassady',0,'Fusce Fermentum Fermentum Associates'),(28,'Bevis',0,'In Aliquet Lobortis Limited'),(29,'Hedwig',0,'Aliquet Libero Corporation'),(30,'Nevada',0,'Morbi Tristique Senectus PC'),(31,'Montana',0,'Eu Company'),(32,'Denton',0,'Eget Volutpat Industries'),(33,'Blaze',0,'Quisque Porttitor Corp.'),(34,'Nasim',0,'Et Nunc Foundation'),(35,'Linus',0,'Magna Corp.'),(36,'Basia',0,'Lobortis Risus In Institute'),(37,'Paul',0,'Rhoncus Associates'),(38,'Zeus',0,'Molestie Sodales Industries'),(39,'Isadora',0,'Dui Company'),(40,'Chaim',0,'Porttitor Eros Consulting'),(41,'Hayley',0,'Augue Incorporated'),(42,'Violet',0,'Nec PC'),(43,'Noel',0,'Nec Eleifend Non Corporation'),(44,'Athena',0,'Duis Sit Amet Company'),(45,'Flavia',0,'Aliquam Tincidunt Nunc Ltd'),(46,'Maggie',0,'Justo Sit Amet PC'),(47,'Athena',0,'Sapien Molestie Orci Institute'),(48,'Kirsten',0,'Nec Orci Corp.'),(49,'Tobias',0,'Enim Limited'),(50,'Graham',0,'Curabitur Vel Lectus Foundation'),(51,'Callum',0,'Dignissim Pharetra Institute'),(52,'Vaughan',0,'Risus In Inc.'),(53,'Salvador',0,'Eget Massa Incorporated'),(54,'Omar',0,'Lacus LLP'),(55,'TaShya',0,'Maecenas Mi Consulting'),(56,'Lee',0,'Tincidunt Tempus Company'),(57,'Colby',0,'Sit Amet Risus Company'),(58,'Maia',0,'In Magna Institute'),(59,'Magee',0,'Lorem Ipsum Corp.'),(60,'Adrian',0,'A Malesuada Id LLP'),(61,'Jamalia',0,'Aliquam Fringilla Cursus Associates'),(62,'Russell',0,'Mauris Integer Sem Corp.'),(63,'Haley',0,'Et Corporation'),(64,'Phelan',0,'Suscipit Nonummy Corp.'),(65,'Judith',0,'Quisque Imperdiet Incorporated'),(66,'Calista',0,'Volutpat Consulting'),(67,'Naomi',0,'Mauris Institute'),(68,'Hanae',0,'Vestibulum Lorem Corporation'),(69,'Sacha',0,'Ipsum Dolor Limited'),(70,'Madeson',0,'Etiam Vestibulum Associates'),(71,'Sylvia',0,'Tellus Suspendisse Sed Consulting'),(72,'Ishmael',0,'Cursus A Enim Incorporated'),(73,'Vance',0,'Nec Malesuada Ut LLC'),(74,'Yoshio',0,'Ullamcorper Magna Company'),(75,'Elton',0,'Velit Eget Ltd'),(76,'Bernard',0,'Arcu PC'),(77,'Daryl',0,'Metus Vivamus Euismod Institute'),(78,'Hedley',0,'Penatibus Corporation'),(79,'Wyatt',0,'In Molestie Tortor Institute'),(80,'Bernard',0,'Nisl Elementum Institute'),(81,'Kameko',0,'Sed Tortor Integer Institute'),(82,'Melanie',0,'Magna Company'),(83,'Elijah',0,'Ut Pharetra Sed Inc.'),(84,'Rhonda',0,'Ac Turpis Egestas LLC'),(85,'Cyrus',0,'Neque Pellentesque Foundation'),(86,'Martin',0,'Turpis Non Enim Corporation'),(87,'Darius',0,'Lectus Pede PC'),(88,'Byron',0,'Sit Amet Massa Consulting'),(89,'Tara',0,'Fames Ac Industries'),(90,'Galena',0,'Suspendisse Sagittis Company'),(91,'Wang',0,'Cras Sed Leo Consulting'),(92,'Germaine',0,'Vitae Velit Industries'),(93,'Kieran',0,'Pede Sagittis Associates'),(94,'Odette',0,'Vitae Company'),(95,'Joseph',0,'Sit Company'),(96,'Lani',0,'Purus Accumsan Associates'),(97,'Katell',0,'Habitant Morbi Incorporated'),(98,'Lareina',0,'Nibh Phasellus Nulla Institute'),(99,'Logan',0,'Lectus Pede Incorporated');

INSERT INTO UsersToProjects([Id],[UserId],[ProjectId]) VALUES(0,0,0),(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57),(58,58,58),(59,59,59),(60,60,60),(61,61,61),(62,62,62),(63,63,63),(64,64,64),(65,65,65),(66,66,66),(67,67,67),(68,68,68),(69,69,69),(70,70,70),(71,71,71),(72,72,72),(73,73,73),(74,74,74),(75,75,75),(76,76,76),(77,77,77),(78,78,78),(79,79,79),(80,80,80),(81,81,81),(82,82,82),(83,83,83),(84,84,84),(85,85,85),(86,86,86),(87,87,87),(88,88,88),(89,89,89),(90,90,90),(91,91,91),(92,92,92),(93,93,93),(94,94,94),(95,95,95),(96,96,96),(97,97,97),(98,98,98),(99,99,99);

INSERT INTO Records([Id],[StartTime],[EndTime],[ProjectId]) VALUES(0,'2018-05-10 12:49:53','2018-09-16 20:30:09',0),(1,'2019-11-17 23:53:07','2018-06-14 11:40:30',1),(2,'2019-02-14 22:40:49','2019-08-29 17:29:38',2),(3,'2019-05-05 15:45:36','2019-11-24 01:41:16',3),(4,'2019-04-21 08:23:39','2019-01-25 16:28:01',4),(5,'2018-04-26 10:25:30','2018-07-01 04:23:34',5),(6,'2018-05-06 14:53:49','2019-12-27 09:40:06',6),(7,'2019-12-20 17:22:05','2019-06-03 13:34:06',7),(8,'2018-12-28 18:57:24','2019-10-08 05:14:49',8),(9,'2018-05-07 12:23:23','2019-03-16 05:27:36',9),(10,'2019-07-12 21:39:11','2018-02-28 22:09:10',10),(11,'2019-03-23 14:03:18','2018-09-10 22:58:28',11),(12,'2018-05-20 19:32:25','2019-09-16 00:37:26',12),(13,'2018-09-10 15:15:12','2019-09-25 05:07:19',13),(14,'2018-03-11 04:16:58','2019-09-25 16:21:22',14),(15,'2020-01-10 07:40:54','2019-05-18 02:37:26',15),(16,'2018-09-06 21:34:31','2018-04-11 02:09:04',16),(17,'2019-12-19 01:44:22','2018-06-13 14:41:22',17),(18,'2019-12-14 22:55:11','2019-08-07 10:25:34',18),(19,'2018-08-09 08:33:52','2019-01-20 14:06:31',19),(20,'2018-09-24 21:12:00','2018-04-03 09:58:11',20),(21,'2019-08-18 22:01:33','2019-04-27 17:13:05',21),(22,'2019-08-17 14:19:39','2019-03-17 16:22:36',22),(23,'2018-03-24 22:02:17','2018-05-14 17:45:02',23),(24,'2018-08-07 19:49:18','2019-03-22 13:17:15',24),(25,'2019-03-16 02:43:33','2019-08-17 11:37:15',25),(26,'2018-04-10 10:51:24','2019-02-06 11:31:15',26),(27,'2018-10-10 23:46:32','2019-10-29 07:39:12',27),(28,'2019-02-26 16:19:00','2019-06-02 15:47:49',28),(29,'2018-11-22 14:11:53','2019-07-25 01:54:23',29),(30,'2019-03-08 21:56:56','2019-01-26 22:17:24',30),(31,'2019-04-11 14:34:14','2019-03-04 05:30:06',31),(32,'2018-09-29 00:47:27','2019-11-22 18:39:00',32),(33,'2018-10-02 18:48:16','2019-05-27 08:56:14',33),(34,'2018-08-20 22:41:54','2019-10-16 11:20:51',34),(35,'2019-09-01 20:03:29','2019-01-13 23:38:04',35),(36,'2019-06-05 03:59:26','2019-11-16 02:41:01',36),(37,'2018-02-08 06:31:30','2019-09-16 08:50:19',37),(38,'2018-08-11 02:39:34','2018-03-20 13:22:27',38),(39,'2019-01-16 19:05:39','2019-01-04 08:54:19',39),(40,'2019-04-16 11:25:27','2018-04-29 18:36:17',40),(41,'2018-09-24 04:05:48','2018-04-17 16:31:06',41),(42,'2019-03-08 01:38:32','2019-10-05 13:31:10',42),(43,'2019-07-18 17:12:45','2019-01-02 11:15:46',43),(44,'2018-10-13 02:58:46','2018-12-04 23:27:24',44),(45,'2018-04-16 12:39:48','2018-05-01 00:04:54',45),(46,'2018-09-18 16:25:41','2019-03-01 08:04:29',46),(47,'2019-01-19 12:28:39','2019-03-08 08:20:40',47),(48,'2019-05-27 22:23:30','2018-10-08 01:21:05',48),(49,'2019-10-13 10:45:14','2018-10-28 20:29:42',49),(50,'2019-10-10 16:08:55','2018-09-29 02:49:20',50),(51,'2018-06-05 13:23:51','2019-11-24 01:11:31',51),(52,'2018-07-16 06:17:49','2018-10-09 12:58:21',52),(53,'2018-07-18 16:15:02','2019-09-08 11:53:48',53),(54,'2019-04-20 20:24:21','2018-04-07 23:03:20',54),(55,'2019-08-26 21:54:23','2019-10-17 19:24:04',55),(56,'2019-09-15 14:18:54','2019-09-25 02:54:08',56),(57,'2019-02-23 20:05:39','2020-01-15 17:42:44',57),(58,'2019-09-23 06:37:02','2018-08-29 04:09:00',58),(59,'2019-11-12 12:13:24','2019-09-25 10:49:48',59),(60,'2018-04-26 04:21:14','2018-10-30 06:15:50',60),(61,'2019-01-08 17:02:43','2018-07-12 04:08:23',61),(62,'2019-08-08 07:09:09','2018-12-19 07:52:01',62),(63,'2018-04-24 13:59:07','2019-03-22 03:08:23',63),(64,'2018-10-20 10:24:32','2018-08-06 08:54:39',64),(65,'2019-09-08 03:42:11','2019-10-04 20:47:36',65),(66,'2018-10-31 04:21:41','2018-07-11 23:43:49',66),(67,'2019-11-02 10:23:22','2019-08-21 04:17:55',67),(68,'2018-11-21 22:38:12','2018-04-03 01:27:36',68),(69,'2019-06-07 07:58:00','2019-09-15 19:21:09',69),(70,'2018-12-07 14:49:06','2019-06-08 14:41:29',70),(71,'2019-09-08 17:37:43','2018-08-14 22:21:13',71),(72,'2019-12-26 18:14:58','2018-02-12 06:10:32',72),(73,'2018-05-11 09:44:28','2018-09-30 23:45:45',73),(74,'2019-08-16 02:06:11','2019-04-14 18:18:38',74),(75,'2020-01-08 11:45:52','2018-09-13 09:30:04',75),(76,'2018-05-03 15:34:26','2018-10-27 11:50:35',76),(77,'2019-12-27 15:00:00','2020-01-11 03:59:37',77),(78,'2020-01-19 11:57:24','2020-01-03 12:10:51',78),(79,'2018-10-16 10:20:02','2019-09-18 12:29:31',79),(80,'2019-12-05 07:59:03','2018-06-30 19:56:51',80),(81,'2019-03-25 20:57:40','2018-10-01 08:53:11',81),(82,'2019-06-28 03:26:02','2019-09-28 01:30:46',82),(83,'2019-02-01 10:29:39','2018-05-08 16:38:05',83),(84,'2019-05-07 04:50:38','2018-09-06 07:45:40',84),(85,'2018-11-03 15:06:19','2019-12-16 00:05:47',85),(86,'2020-01-31 22:09:02','2019-12-12 16:17:00',86),(87,'2019-09-26 02:34:19','2019-08-28 20:24:59',87),(88,'2019-10-20 15:34:38','2019-05-12 22:01:57',88),(89,'2019-02-09 14:15:20','2018-10-17 18:56:58',89),(90,'2019-02-09 10:59:52','2018-11-20 05:56:44',90),(91,'2018-07-11 12:46:12','2018-09-22 12:21:10',91),(92,'2019-04-02 22:54:50','2019-11-22 19:33:03',92),(93,'2018-09-01 15:37:58','2019-07-09 20:09:11',93),(94,'2019-10-23 03:07:11','2019-05-17 12:33:47',94),(95,'2019-07-05 22:09:02','2019-06-27 13:00:40',95),(96,'2020-02-03 04:30:45','2019-03-07 20:12:50',96),(97,'2019-12-26 23:15:16','2018-10-31 11:13:01',97),(98,'2019-01-22 03:00:42','2019-06-13 20:32:17',98),(99,'2019-05-22 23:48:44','2018-12-26 21:47:13',99);

INSERT INTO Tasks([Id],[Name],[EstimatedPomodori],[ActualPomodori],[InternalInterruptions],[ExternalInterruptions],[UserId],[isArchived],[ProjectId],[RecordId],[isAssigned]) VALUES(0,'Gisela',0,0,0,0,0,0,0,0,0),(1,'Brynn',0,0,0,0,1,0,1,1,0),(2,'Jared',0,0,0,0,2,0,2,2,0),(3,'Remedios',0,0,0,0,3,0,3,3,0),(4,'Ramona',0,0,0,0,4,0,4,4,0),(5,'Delilah',0,0,0,0,5,0,5,5,0),(6,'Bertha',0,0,0,0,6,0,6,6,0),(7,'Hamilton',0,0,0,0,7,0,7,7,0),(8,'Keefe',0,0,0,0,8,0,8,8,0),(9,'Hanna',0,0,0,0,9,0,9,9,0),(10,'Sacha',0,0,0,0,10,0,10,10,0),(11,'Neve',0,0,0,0,11,0,11,11,0),(12,'Helen',0,0,0,0,12,0,12,12,0),(13,'Glenna',0,0,0,0,13,0,13,13,0),(14,'Jarrod',0,0,0,0,14,0,14,14,0),(15,'Channing',0,0,0,0,15,0,15,15,0),(16,'Rowan',0,0,0,0,16,0,16,16,0),(17,'Ross',0,0,0,0,17,0,17,17,0),(18,'Nasim',0,0,0,0,18,0,18,18,0),(19,'Tatiana',0,0,0,0,19,0,19,19,0),(20,'Yvonne',0,0,0,0,20,0,20,20,0),(21,'Jaime',0,0,0,0,21,0,21,21,0),(22,'Jakeem',0,0,0,0,22,0,22,22,0),(23,'Germaine',0,0,0,0,23,0,23,23,0),(24,'Gisela',0,0,0,0,24,0,24,24,0),(25,'Gwendolyn',0,0,0,0,25,0,25,25,0),(26,'Christine',0,0,0,0,26,0,26,26,0),(27,'Donovan',0,0,0,0,27,0,27,27,0),(28,'Bruno',0,0,0,0,28,0,28,28,0),(29,'Gage',0,0,0,0,29,0,29,29,0),(30,'Christopher',0,0,0,0,30,0,30,30,0),(31,'Nola',0,0,0,0,31,0,31,31,0),(32,'Akeem',0,0,0,0,32,0,32,32,0),(33,'Kiayada',0,0,0,0,33,0,33,33,0),(34,'Anthony',0,0,0,0,34,0,34,34,0),(35,'Seth',0,0,0,0,35,0,35,35,0),(36,'Wang',0,0,0,0,36,0,36,36,0),(37,'Elaine',0,0,0,0,37,0,37,37,0),(38,'Kermit',0,0,0,0,38,0,38,38,0),(39,'Elizabeth',0,0,0,0,39,0,39,39,0),(40,'Ezekiel',0,0,0,0,40,0,40,40,0),(41,'Sage',0,0,0,0,41,0,41,41,0),(42,'Robin',0,0,0,0,42,0,42,42,0),(43,'Uriel',0,0,0,0,43,0,43,43,0),(44,'Leslie',0,0,0,0,44,0,44,44,0),(45,'Penelope',0,0,0,0,45,0,45,45,0),(46,'Raven',0,0,0,0,46,0,46,46,0),(47,'Kaseem',0,0,0,0,47,0,47,47,0),(48,'Lisandra',0,0,0,0,48,0,48,48,0),(49,'Isaiah',0,0,0,0,49,0,49,49,0),(50,'Renee',0,0,0,0,50,0,50,50,0),(51,'Ulysses',0,0,0,0,51,0,51,51,0),(52,'Maya',0,0,0,0,52,0,52,52,0),(53,'Chantale',0,0,0,0,53,0,53,53,0),(54,'Wyoming',0,0,0,0,54,0,54,54,0),(55,'Nyssa',0,0,0,0,55,0,55,55,0),(56,'Geoffrey',0,0,0,0,56,0,56,56,0),(57,'Ferdinand',0,0,0,0,57,0,57,57,0),(58,'Carol',0,0,0,0,58,0,58,58,0),(59,'Priscilla',0,0,0,0,59,0,59,59,0),(60,'Camille',0,0,0,0,60,0,60,60,0),(61,'Jakeem',0,0,0,0,61,0,61,61,0),(62,'Madaline',0,0,0,0,62,0,62,62,0),(63,'Abigail',0,0,0,0,63,0,63,63,0),(64,'Chaney',0,0,0,0,64,0,64,64,0),(65,'Melyssa',0,0,0,0,65,0,65,65,0),(66,'Christen',0,0,0,0,66,0,66,66,0),(67,'Kylee',0,0,0,0,67,0,67,67,0),(68,'Hilary',0,0,0,0,68,0,68,68,0),(69,'Travis',0,0,0,0,69,0,69,69,0),(70,'Nicole',0,0,0,0,70,0,70,70,0),(71,'Martha',0,0,0,0,71,0,71,71,0),(72,'Ross',0,0,0,0,72,0,72,72,0),(73,'Marcia',0,0,0,0,73,0,73,73,0),(74,'Marcia',0,0,0,0,74,0,74,74,0),(75,'Orlando',0,0,0,0,75,0,75,75,0),(76,'Sonia',0,0,0,0,76,0,76,76,0),(77,'Gemma',0,0,0,0,77,0,77,77,0),(78,'Sarah',0,0,0,0,78,0,78,78,0),(79,'Sylvester',0,0,0,0,79,0,79,79,0),(80,'Olga',0,0,0,0,80,0,80,80,0),(81,'Alexa',0,0,0,0,81,0,81,81,0),(82,'Hadassah',0,0,0,0,82,0,82,82,0),(83,'Amery',0,0,0,0,83,0,83,83,0),(84,'Virginia',0,0,0,0,84,0,84,84,0),(85,'Brock',0,0,0,0,85,0,85,85,0),(86,'Quinlan',0,0,0,0,86,0,86,86,0),(87,'Jared',0,0,0,0,87,0,87,87,0),(88,'Sylvester',0,0,0,0,88,0,88,88,0),(89,'Quinn',0,0,0,0,89,0,89,89,0),(90,'Avye',0,0,0,0,90,0,90,90,0),(91,'Cassandra',0,0,0,0,91,0,91,91,0),(92,'Brody',0,0,0,0,92,0,92,92,0),(93,'Anne',0,0,0,0,93,0,93,93,0),(94,'Molly',0,0,0,0,94,0,94,94,0),(95,'Dahlia',0,0,0,0,95,0,95,95,0),(96,'Danielle',0,0,0,0,96,0,96,96,0),(97,'Baker',0,0,0,0,97,0,97,97,0),(98,'Rhiannon',0,0,0,0,98,0,98,98,0),(99,'Byron',0,0,0,0,99,0,99,99,0);
