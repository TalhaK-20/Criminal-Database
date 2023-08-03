create database Criminal_Database_System;


CREATE TABLE Officer(
    Badge_Number INT PRIMARY KEY,
    Officer_Name VARCHAR(50) NOT NULL,
    Officer_Rank VARCHAR(20)
);

INSERT INTO Officer 
VALUES
(1, 'John Smith', 'Captain'),
(2, 'David Wilson', 'Major'),
(3, 'Emily Johnson', 'Lieutenant'),
(4, 'Samantha Davis', 'Colonel'),
(5, 'Michael Thompson', 'Lieutenant Colonel');



 
CREATE TABLE Arrest(
    Arrest_Id INT PRIMARY KEY,
    Arrest_Time TIME NOT NULL,
    Arrest_Date DATE NOT NULL,
    Arrest_Location VARCHAR(100) NOT NULL,
    Arrest_Reason VARCHAR(100) NOT NULL,
    Officer_Badge_Number INT,
    FOREIGN KEY (Officer_Badge_Number) REFERENCES Officer(Badge_Number)
);

INSERT INTO Arrest 
VALUES
( 5678, '2023-05-10', '09:45', 'Main Street, City Center', 'Theft',1),
( 2345, '2023-05-12', '02:30', 'Elm Street, East District', 'Assault',2),
( 7890, '2023-05-02', ' 08:20 ', ' Oak Lane, South District', 'Drugs',1),
( 1234, '2023-05-05', '11:10 ', 'Maple Avenue, North District', 'Robbery',4),
( 4567, '2023-05-11', '02:14', 'Park Avenue, West District', 'Assault',2);




CREATE TABLE Criminal(
    Criminal_Id INT PRIMARY KEY,
    Criminal_Name VARCHAR(50) NOT NULL,
    Criminal_DOB DATE NOT NULL,
    Criminal_Gender CHAR(1) NOT NULL,
    Criminal_Height DECIMAL(4,2) NOT NULL,
    Criminal_Weight DECIMAL(5,2) NOT NULL
);

INSERT INTO Criminal 
VALUES
(1,'John Smith', '2003-05-01', 'M', 1.83, 75.56),
(2,'Emily Johnson', '2002-05-02', 'F', 0.9, 60.87),
(3,'David Wilson', '2001-05-03', 'M', 1.12, 80.76),
(4,'Samantha Davis', '2003-05-04', 'F', 2.00, 55.22),
(5,'Michael Thompson', '2003-05-05', 'M', 1.31, 90.12);




CREATE TABLE Crime(
    Crime_Id INT PRIMARY KEY,
    Crime_Type VARCHAR(50) NOT NULL,
    Crime_Location VARCHAR(100) NOT NULL,
    Crime_Date DATE NOT NULL,
    Crime_Time TIME NOT NULL,
    Criminal_Id INT,
    FOREIGN KEY (Criminal_Id) REFERENCES Criminal(Criminal_Id)
);

INSERT INTO Crime 
VALUES
(1,'Theft','Lahore','2023-05-02','05:34',1),
(2,'Assault','Islamabad','2023-05-11','05:11',2),
(3,'Robbery','Karachi','2023-06-21','02:33',3),
(4,'Theft','Lahore','2023-04-09','07:21',4),
(5,'Harrasment','Karachi','2023-05-04','05:44',5);




CREATE TABLE Criminal_Alias(
    Criminal_Alias_Id INT PRIMARY KEY,
    Criminal_Alias_Name VARCHAR(50) NOT NULL,
    Criminal_Id INT,
    FOREIGN KEY (Criminal_Id) REFERENCES Criminal(Criminal_Id)
);

INSERT INTO Criminal_Alias 
VALUES
(1,'Emily',1),
(2,'John',2),
(3,'Michael',3),
(4,'Charlotte',4),
(5,'Bruce',5);




CREATE TABLE Jail(
    Jail_Id INT PRIMARY KEY,
    Jail_Name VARCHAR(50) NOT NULL,
    Jail_Location VARCHAR(100) NOT NULL
);

INSERT INTO Jail 
VALUES
(1,'Maplewood Correctional Facility',' City Center, Maplewood'),
(2,'Riverside County Detention Center','Riverside, California'),
(3,'Oakridge Penitentiary','Oakridge, New York'),
(4,'Evergreen Correctional Institution','Evergreen, Texas'),
(5,'Pinehurst Correctional Center','Pinehurst, Illinois');




CREATE TABLE Sentence(
    Sentence_Id INT PRIMARY KEY,
    Sentence_Length INT NOT NULL,
    Crime_Id INT,
    Jail_Id INT,
    FOREIGN KEY (Crime_Id) REFERENCES Crime(Crime_Id),
    FOREIGN KEY (Jail_Id) REFERENCES Jail(Jail_Id)
);

INSERT INTO Sentence 
VALUES
(1,3,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,2,5,5);
 



CREATE TABLE Cases(
    Case_Id INT PRIMARY KEY,
    Case_Name VARCHAR(100) NOT NULL,
    Case_Registered_Location VARCHAR(100) NOT NULL,
    Case_Date DATE NOT NULL
);

INSERT INTO Cases 
VALUES
(1,'John Smith', 'New York', '2023-05-01'),
(2,'Emily Johnson', 'Los Angeles', '2023-05-02'),
(3,'David Wilson', 'Chicago', '2023-05-03'),
(4,'Samantha Davis', 'Houston', '2023-05-04'),
(5,'Michael Thompson', 'Miami', '2023-05-05');




CREATE TABLE Victim(
    Victim_Id INT PRIMARY KEY,
    Victim_Name VARCHAR(50) NOT NULL,
    Victim_Gender CHAR(1) NOT NULL,
    Victim_Age INT NOT NULL,
    Case_Id INT,
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

INSERT INTO Victim 
VALUES
(1,'John Smith', 'M', 30,1),
(2,'Emily Johnson', 'F', 25,2),
(3,'David Wilson', 'M', 35,3),
(4,'Samantha Davis', 'F', 28,4),
(5,'Michael Thompson', 'M', 32,5);




CREATE TABLE Witness(
    Witness_Id INT PRIMARY KEY,
    Witness_Name VARCHAR(50) NOT NULL,
    Witness_Gender CHAR(1) NOT NULL,
    Witness_Age INT NOT NULL,
    Case_Id INT,
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

INSERT INTO Witness 
VALUES
(1,'Saad','M',20,1),
(2,'Talha','M',20,2),
(3,'Laiba','F',19,3),
(4,'Noman','M',26,4),
(5,'Shoaib','M',22,5);




CREATE TABLE Suspect(
    Suspect_Id INT PRIMARY KEY,
    Suspect_Name VARCHAR(50) NOT NULL,
    Suspect_Gender CHAR(1) NOT NULL,
    Suspect_Age INT NOT NULL,
    Case_Id INT,
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

INSERT INTO Suspect 
VALUES
(1,'Clark','M',26,1),
(2,'Hector','M',44,2),
(3,'Victoria','F',27,3),
(4,'Fudge','M',22,4),
(5,'Robertson','M',17,5);




CREATE TABLE Evidence(
    Evidence_Id INT PRIMARY KEY,
    Evidence_Type VARCHAR(50) NOT NULL,
    Evidence_Location VARCHAR(100) NOT NULL,
    Case_Id INT,
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

INSERT INTO Evidence 
VALUES
(1,'Fingerprint', 'Forensic Lab',1),
(2,'DNA Sample', 'Crime Scene A',2),
(3,'Weapon', 'Evidence Locker B',3),
(4,'Surveillance Footage', 'Security Room',4),
(5,'Documents', 'Investigation Office',5);




CREATE TABLE Investigation(
    Investigation_Id INT PRIMARY KEY,
    Investigation_Start_Date DATE NOT NULL,
    Investigation_End_Date DATE NOT NULL,
    Officer_Badge_Number INT,
    Case_Id INT,
    FOREIGN KEY (Officer_Badge_Number) REFERENCES Officer(Badge_Number),
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

INSERT INTO Investigation 
VALUES
(1,'2023-01-01', '2023-01-05',1,1),
(2,'2023-02-10', '2023-02-15',2,2),
(3,'2023-03-20', '2023-03-25',3,3),
(4,'2023-04-05', '2023-04-10',4,4),
(5,'2023-05-15', '2023-05-20',5,5);










/* Queries Starts from here */


/* DML Commands */


select * from Criminal_Alias;
select * from Arrest;
select * from Suspect;
select * from Criminal;

update Criminal set Criminal_Name = 'John Smith' where Criminal_Id = 1;

delete from Criminal_Alias where Criminal_Alias_Id = 1;

insert into Criminal
values
(10, 'Woods Kaka', '1998-02-17', 'M', 1.56, 66.10),
(12, 'Mori Chen', '2000-07-21', 'F', 1.2, 46.10),
(14, 'Laura Baye', '1988-06-24', 'F', 1.3, 54.21);






/* JOINS */


SELECT Criminal.Criminal_Id, Criminal.Criminal_name, Criminal_Alias.Criminal_Alias_name, Crime.Crime_Type
FROM ((Criminal
INNER JOIN Crime ON Criminal.Criminal_Id = Crime.Criminal_Id)
INNER JOIN Criminal_Alias ON Criminal.Criminal_Id = Criminal_Alias.Criminal_Id);


SELECT Criminal.Criminal_Id, Criminal.Criminal_name, Criminal_Alias.Criminal_Alias_name, Crime.Crime_Type
FROM ((Criminal
left JOIN Crime ON Criminal.Criminal_Id = Crime.Criminal_Id)
left JOIN Criminal_Alias ON Criminal.Criminal_Id = Criminal_Alias.Criminal_Id);


SELECT Criminal.Criminal_Id, Criminal.Criminal_name, Criminal_Alias.Criminal_Alias_name, Crime.Crime_Type
FROM ((Criminal
right JOIN Crime ON Criminal.Criminal_Id = Crime.Criminal_Id)
right JOIN Criminal_Alias ON Criminal.Criminal_Id = Criminal_Alias.Criminal_Id);


SELECT Criminal.Criminal_Id, Criminal.Criminal_name, Criminal_Alias.Criminal_Alias_name, Crime.Crime_Type
FROM ((Criminal
full JOIN Crime ON Criminal.Criminal_Id = Crime.Criminal_Id)
full JOIN Criminal_Alias ON Criminal.Criminal_Id = Criminal_Alias.Criminal_Id);


SELECT * from Crime Cross Join Criminal;


SELECT * from Crime Natural Join Criminal;


SELECT c1.*, c2.Crime_Id, c2.Crime_Type
from Crime c1
join Crime c2 On
c1.Crime_Type = c2.Crime_Type
where c1.Crime_Id <> c2.Crime_Id;






/* VIEWS */


/* Creating first time my first view in SQL Databases */

GO
CREATE VIEW my_first_view 
AS
SELECT Criminal.Criminal_Id, Criminal.Criminal_name, Criminal_Alias.Criminal_Alias_name, Crime.Crime_Type
FROM ((Criminal
INNER JOIN Crime ON Criminal.Criminal_Id = Crime.Criminal_Id)
INNER JOIN Criminal_Alias ON Criminal.Criminal_Id = Criminal_Alias.Criminal_Id);

GO
Select * from my_first_view;






GO
CREATE VIEW Public_User
AS
select Criminal.Criminal_name, Crime.Crime_Type
from Criminal
Inner Join Crime on Criminal.Criminal_Id = Crime.Criminal_Id;

GO
Select * from Public_User;






GO
CREATE VIEW Court_Records
AS
Select Officer.Badge_Number, Officer.Officer_Name, Cases.Case_Id, Cases.Case_Name, Cases.Case_Date, Investigation.Investigation_Start_Date, Investigation.Investigation_End_Date, Suspect.Suspect_Name, Witness.Witness_Name, Evidence.Evidence_Type
from (((((Investigation 

Inner Join Officer on Investigation.Officer_Badge_Number = Officer.Badge_Number) 
Inner Join Cases on Investigation.Case_Id = Cases.Case_Id) 
Inner Join Witness on Witness.Case_Id = Cases.Case_Id)
Inner Join Suspect on Suspect.Case_Id = Cases.Case_Id)
Inner Join Evidence on Evidence.Case_Id = Cases.Case_Id);
 
GO
Select * from Court_Records;






/* STORED PROCEDURES */


GO
CREATE PROCEDURE GetCourtRecords
AS
BEGIN
    SELECT Officer.Badge_Number, Officer.Officer_Name, Cases.Case_Id, Cases.Case_Name, Cases.Case_Date, Investigation.Investigation_Start_Date, Investigation.Investigation_End_Date, Suspect.Suspect_Name, Witness.Witness_Name
    FROM ((((Investigation 
    INNER JOIN Officer ON Investigation.Officer_Badge_Number = Officer.Badge_Number)
    INNER JOIN Cases ON Investigation.Case_Id = Cases.Case_Id)
    INNER JOIN Suspect ON Cases.Case_Id = Suspect.Case_Id)
    INNER JOIN Witness ON Cases.Case_Id = Witness.Case_Id)
END;

EXEC GetCourtRecords;




GO
CREATE PROCEDURE totalCrimes
    @total INT OUTPUT
AS
BEGIN
    SELECT @total = COUNT(*) FROM Crime;
END;

DECLARE @total_C INT;
EXEC totalCrimes @total_C OUTPUT;
SELECT @total_C AS Total_Crimes;





/* DDL Commands*/


/* Changing the data type of a column */
ALTER TABLE Suspect
ALTER COLUMN Suspect_Gender varchar(12);


/* Renaming a column */
Alter table Officer
rename COLUMN Badge_Number to Badge_No;


/* Adding a new cloumn in a table */
Alter table Officer
add COLUMN Officer_CNIC varchar(255);


/* Dropping a column */
Alter table Officer
drop COLUMN Officer_Rank;


/* Rename the table*/
RENAME TABLE Officer TO Off;


/* Remove data from the table but it will not delete the table */
truncate Criminal_Alias;



