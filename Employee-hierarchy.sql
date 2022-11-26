CREATE  DATABASE organization;
USE organization;
drop table Employees;
CREATE TABLE Employees (
    PersonID int NOT NULL,
    Name varchar(255),
    ReportingTo int,
    PRIMARY KEY(`PersonID`)
);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (1,"RAGHAV",3);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (2,"SHAGUN",1);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (3,"ARVIND",5);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (4,"RIYA",1);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (5,"ESHA",7);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (6,"GAURI",7);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (7,"DIKSHA",10);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (8,"VARUN",7);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (9,"PRAGYA",7);
INSERT INTO Employees (PersonID,Name,ReportingTo) VALUES (10,"GANESH",10);

SELECT * from Employees;
SELECT PersonID,Name from Employees where (ReportingTo=1);

Select PersonID,Name from Employees where ReportingTo=1;

WITH Recursive Employee_CTE(PersonID,Name,ReportingTo) AS  
(  
   SELECT PersonID,Name,ReportingTo from Employees where PersonID=5  
   UNION ALL  
   SELECT e.PersonID,e.Name,e.ReportingTo  
   from Employee_CTE as parent_emp join Employees as e  
    ON parent_emp.PersonID = e.ReportingTo  
)  
-- SELECT * FROM Employee_CTE order by PersonID

-- SELECT * FROM Employees WHERE ReportingTo = 7 OR 
-- ReportingTo IN (SELECT PersonID FROM Employees WHERE ReportingTo = 7) 

-- SELECT E.PersonID,E.Name,E.ReportingTo
-- FROM Employees E
-- INNER JOIN Employees E1 ON
-- E.ReportingTo=E1.PersonID;

select * from Employee_CTE;