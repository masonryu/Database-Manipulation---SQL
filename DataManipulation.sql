CREATE DATABASE Students1;
USE Students1;
CREATE TABLE StudentsInfo
(
StudentID int,
StudentName varchar(8000),
ParentName varchar(8000),
PhoneNumber varchar(8000),
AddressofStudent varchar(8000),
City varchar(8000),
Country varchar(8000)
);

DROP TABLE StudentsInfo;

DROP DATABASE Students;

ALTER TABLE StudentsInfo ADD BloodGroup varchar(8000);

ALTER TABLE StudentsInfo DROP column BloodGroup;

ALTER TABLE StudentsInfo ADD DOB DATE;

ALTER TABLE StudentsInfo ALTER COLUMN DOB datetime;
ALTER TABLE StudentsInfo DROP COLUMN DOB;

INSERT INTO StudentsInfo VALUES ('07','Mason','Joel','7025409999','Long Road 12','Las Vegas','USA');

TRUNCATE TABLE studentsinfo;

sp_rename 'StudentsInfo', 'Infostudents';
-------------------------------

CREATE TABLE StudentsInfo
(
StudentID int,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber varchar(8000),
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000)
);
DROP TABLE StudentsInfo;

INSERT INTO StudentsInfo VALUES ('07','Mason','Joel','7025409999', NULL,'Las Vegas','USA');

ALTER TABLE StudentsInfo ALTER COLUMN PhoneNumber int NOT NULL;

CREATE TABLE StudentsInfo
(
StudentID int UNIQUE NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber varchar(8000),
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000)
PRIMARY KEY (StudentID)
);
DROP TABLE StudentsInfo;

CREATE TABLE StudentsInfo
(
StudentID int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber varchar(8000),
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000)
CONSTRAINT UC_StudentsInfo UNIQUE(StudentID, PhoneNumber)
);

ALTER TABLE StudentsInfo 
DROP CONSTRAINT UC_StudentInfo;

DROP TABLE StudentsInfo;

CREATE TABLE StudentsInfo
(
StudentID int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber bigint,
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000) CHECK (country = 'USA')
);

INSERT INTO StudentsInfo VALUES ('07','Mason','Joel','7025409999', 'Long Road','Las Vegas','Germany');

ALTER TABLE StudentsInfo 
ADD CHECK (Country = 'India');

ALTER TABLE StudentsInfo 
DROP CONSTRAINT CHECKCONSTRAINTNAME;

DROP TABLE StudentsInfo;

CREATE TABLE StudentsInfo
(
StudentID int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber bigint,
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000) DEFAULT 'USA'
);

INSERT INTO StudentsInfo VALUES ('07','Mason','Joel','7025409999', 'Long Road','Las Vegas', NULL);

CREATE INDEX idex_studentname
ON StudentsInfo (StudentName);

DROP INDEX StudentsInfo.idex_studentname;

DROP TABLE StudentsInfo;
CREATE TABLE StudentsInfo
(
StudentID int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000),
PhoneNumber bigint,
AddressofStudent varchar(8000) NOT NULL,
City varchar(8000),
Country varchar(8000) DEFAULT 'USA'
);

INSERT INTO StudentsInfo VALUES ('07','Mason','Joel','8088888888', 'Long Road','Los angeles','USA');
INSERT INTO StudentsInfo VALUES ('09','Myname','Hello','7025409999', 'Medium Road','Las Vegas','USA');
INSERT INTO StudentsInfo VALUES ('08','Zoe','Toshie','1112221121', 'Small Road','Phoenix','USA');

SELECT * FROM StudentsInfo

UPDATE StudentsInfo SET StudentName = 'Jackson', City = 'TOkyo'
WHERE StudentID = 09;

SELECT * FROM StudentsInfo

DELETE FROM StudentsInfo WHERE StudentName = 'Mason';
SELECT * FROM StudentsInfo

CREATE TABLE SampleSourceTable (StudentID int, StudentName varchar(8000), Marks int);
CREATE TABLE SampleTargetTable (StudentID int, StudentName varchar(8000), Marks int);

DROP TABLE SampleSourceTable;
DROP TABLE SampleTargetTable;

INSERT INTO SampleSourceTable VALUES ('1', 'Jello', '72');
INSERT INTO SampleSourceTable VALUES ('2', 'Kailey', '33');
INSERT INTO SampleSourceTable VALUES ('3', 'Harrison', '55');

INSERT INTO SampleTargetTable VALUES ('1', 'Jello', '72');
INSERT INTO SampleTargetTable VALUES ('2', 'Kailey', '88');
INSERT INTO SampleTargetTable VALUES ('3', 'NotHarrison', '11');

MERGE SampleTargetTable TARGET USING SampleSourceTable SOURCE ON (TARGET.StudentID = SOURCE.StudentID)
WHEN MATCHED AND TARGET.StudentName<> Source.StudentName OR TARGET.Marks <> Source.Marks
THEN 
UPDATE SET TARGET.StudentName = SOURCE.StudentName, Target.Marks = SOURCE.Marks
WHEN NOT MATCHED BY TARGET THEN
INSERT (StudentID, StudentName, Marks) VALUES (SOURCE.StudentID, SOURCE.StudentName, SOURCE.Marks)
WHEN NOT MATCHED BY SOURCE THEN
DELETE;

SELECT * FROM SampleSourceTable;
SELECT * FROM SampleTargetTable;

SELECT StudentID, StudentName FROM StudentsInfo;

SELECT TOP 2 * FROM StudentsInfo;

SELECT DISTINCT City FROM StudentsInfo;

SELECT * FROM StudentsInfo ORDER BY StudentName ASC, ParentName DESC;

SELECT * FROM StudentsInfo ;

SELECT COUNT(StudentID), City FROM StudentsInfo GROUP BY City;

SELECT StudentID, StudentName, COUNT(City) FROM StudentsInfo GROUP BY 
GROUPING SETS ((StudentID, StudentName, City), (StudentID), (StudentName), (City));

SELECT COUNT(StudentID), City FROM StudentsInfo GROUP BY City HAVING COUNT(StudentID) = 1
ORDER BY COUNT(StudentID) DESC;

SELECT * INTO StudentsBackup FROM StudentsInfo;

SELECT * INTO PuneStudents FROM StudentsInfo WHERE City = 'Las Vegas';

SELECT * FROM PuneStudents;

SELECT StudentID, Count(City) FROM StudentsInfo GROUP BY CUBE(StudentID) ORDER BY StudentID;

SELECT StudentID, Count(City) FROM StudentsInfo GROUP BY ROLLUP(StudentID);

CREATE TABLE OffsetMarks (Marks int);

INSERT INTO OffsetMarks VALUES ('65');
INSERT INTO OffsetMarks VALUES ('15');
INSERT INTO OffsetMarks VALUES ('25');
INSERT INTO OffsetMarks VALUES ('54');
INSERT INTO OffsetMarks VALUES ('99');

SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 1 ROWS;

SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 3 ROWS FETCH NEXT 2 ROWS ONLY;

CREATE TABLE SupplierTable(
SupplierID int NOT NULL,
DaysofManufacture int,
Cost int,
CustomerID int,
PurchaseID varchar(4000)
);
DROP TABLE SupplierTable;

INSERT INTO SupplierTable VALUES ('1', '12', '1234', '11', 'P1');
INSERT INTO SupplierTable VALUES ('2', '22', '2234', '22', 'P2');
INSERT INTO SupplierTable VALUES ('3', '32', '3234', '33', 'P13');
INSERT INTO SupplierTable VALUES ('4', '42', '4234', '44', 'P14');
INSERT INTO SupplierTable VALUES ('5', '52', '5234', '55', 'P5');
INSERT INTO SupplierTable VALUES ('6', '62', '6234', '66', 'P6');
INSERT INTO SupplierTable VALUES ('7', '72', '7234', '77', 'P7');
INSERT INTO SupplierTable VALUES ('8', '82', '8234', '8', 'P8');
INSERT INTO SupplierTable VALUES ('9', '92', '9234', '91', 'P9');

SELECT CustomerID, AVG(Cost) as AverageCostOfCustomer FROM SupplierTable GROUP BY CustomerID;

SELECT 'AverageCostOfCustomer' as Cost_According_To_Customers, [11], [22], [33]
FROM(
SELECT CustomerID, Cost FROM SupplierTable) AS SourceTable
PIVOT
(
AVG(Cost) FOR CustomerID IN ([11], [22], [33])) AS PivotTable;

CREATE TABLE SampleTable (SupplierID int, AAA int, BBB int, CCC int)
GO 
INSERT INTO SampleTable VALUES(1,3,5,6);
INSERT INTO SampleTable VALUES(2,3,2,6);
INSERT INTO SampleTable VALUES(4,3,5,9);
go

SELECT * FROM SampleTable;

SELECT SupplierID, Customers, Products
FROM
(SELECT SupplierID, AAA, BBB, CCC FROM SampleTable) p
UNPIVOT
(Products FOR Customers IN (AAA,BBB,CCC)) AS Example;
GO

SELECT 40 + 60

SELECT * FROM OffsetMarks WHERE Marks >= '62';

DECLARE @var1 int = 30;
SET @var1/= 16;
SELECT @var1 AS Example;

SELECT * FROM OffsetMarks WHERE Marks > '62' OR Marks = '67';

SELECT * FROM StudentsInfo WHERE StudentName LIKE 'm%n';

DECLARE @exid hierarchyid;
SELECT @exid = hierarchyid::GetRoot();
PRINT @exid.ToString();

SELECT (StudentName+', '+Parentname) AS Name FROM StudentsInfo;

SELECT AVG(Marks) FROM OffsetMarks;


DROP TABLE StudentsInfo;
CREATE TABLE StudentsDetails
(
StudentID int NOT NULL,
StudentName varchar(8000),
ParentName varchar(8000),
PhoneNumber bigint,
AddressofStudent varchar(8000),
City varchar(8000),
Country varchar(8000),
);

INSERT INTO StudentsDetails VALUES ('07','Mason','Joel','8088888888', 'Long Road','Los angeles','USA');
INSERT INTO StudentsDetails VALUES ('09','Myname','Hello','7025409999', 'Medium Road','Las Vegas','USA');
INSERT INTO StudentsDetails VALUES ('08','Zoe','Toshie','1112221121', 'Small Road','Phoenix','USA');

SELECT * FROM StudentsInfo
intersect 
SELECT * FROM StudentsDetails;

SELECT StudentName, ParentName
FROM StudentsInfo
WHERE AddressofStudent IN (SELECT AddressofStudent FROM StudentsBackup WHERE Country= 'USA');

/* SECTION FOR inner, right, left, full JOINS.*/

/* almost like a func decl.*/
CREATE PROCEDURE Students_City @SCity varchar(8000)
AS 
SELECT * FROM StudentsInfo
WHERE City = @SCity
GO
SELECT * FROM StudentsInfo

/* fucntion call.*/
EXEC Students_City @SCity ='Las Vegas';

CREATE LOGIN SAMPLE1 WITH PASSWORD = 'password1'

CREATE USER MASERYU FOR LOGIN SAMPLE1;

GRANT SELECT ON StudentsInfo TO MASERYU;
REVOKE SELECT ON StudentsInfo TO MASERYU;

/* TCL commands try and catch blocks. PRINT == cout */






