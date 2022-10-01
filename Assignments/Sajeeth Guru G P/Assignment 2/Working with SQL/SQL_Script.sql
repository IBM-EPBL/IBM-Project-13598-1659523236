--Creating 10 TABLES
CREATE TABLE "PCJ17018"."Table 1"( Name CHAR(10));
CREATE TABLE "PCJ17018"."Table 2"( Age CHAR(5));
CREATE TABLE "PCJ17018"."Table 3"( Interest CHAR(10));
CREATE TABLE "PCJ17018"."Table 4"( Skills CHAR(10));
CREATE TABLE "PCJ17018"."Table 5"( College CHAR(20));
CREATE TABLE "PCJ17018"."Table 6"( Cloud CHAR(10));
CREATE TABLE "PCJ17018"."Table 7"( Project CHAR(20));
CREATE TABLE "PCJ17018"."Table 8"( Dept CHAR(10));
CREATE TABLE "PCJ17018"."Table 9"( Class CHAR(10));
CREATE TABLE "PCJ17018"."Table 10"( Year CHAR(10));

--Inserting values to each TABLES

INSERT INTO "PCJ17018"."Table 1"
	VALUES('Sajeeth');
INSERT INTO "PCJ17018"."Table 1"
	VALUES('Madhavan');
INSERT INTO "PCJ17018"."Table 1"
	VALUES('Rohith');
INSERT INTO "PCJ17018"."Table 1"
	VALUES('Samsul');

INSERT INTO "PCJ17018"."Table 2"
	VALUES('20');

INSERT INTO "PCJ17018"."Table 3"
	VALUES('App Dev');
	
INSERT INTO "PCJ17018"."Table 4"
	VALUES('Flask,SQL');

INSERT INTO "PCJ17018"."Table 5"
	VALUES('UCE BIT TR');
	
INSERT INTO "PCJ17018"."Table 6"
	VALUES('IBM');
	
INSERT INTO "PCJ17018"."Table 7"
	VALUES('Fashion Recommender');

INSERT INTO "PCJ17018"."Table 7"
	VALUES('Application');
	
INSERT INTO "PCJ17018"."Table 8"
	VALUES('ECE');
	
INSERT INTO "PCJ17018"."Table 9"
	VALUES('B Section');
	
INSERT INTO "PCJ17018"."Table 10"
	VALUES('4th Year');

--Updating value in table 9	

UPDATE "PCJ17018"."Table 9"
	SET Class = ' ECE - B '
	WHERE Class = 'B Section';
	
--Deleting Value from table 7

DELETE FROM "PCJ17018"."Table 7" WHERE Project = 'Application';

--Adding new column to table 1

ALTER Table "PCJ17018"."Table 1"
	ADD Reg_No CHAR(4);
	
--Updating the values to the new column

UPDATE "PCJ17018"."Table 1"
	SET Reg_No = '68'
	WHERE Name = 'Sajeeth';

UPDATE "PCJ17018"."Table 1"
	SET Reg_No = '48'
	WHERE Name = 'Madhavan';

UPDATE "PCJ17018"."Table 1"
	SET Reg_No = '65'
	WHERE Name = 'Rohith';
	
UPDATE "PCJ17018"."Table 1"
	SET Reg_No = '69'
	WHERE Name = 'Samsul';
	
--Selecting table 1 rows and columns

SELECT Name,Reg_No FROM "PCJ17018"."Table 1"