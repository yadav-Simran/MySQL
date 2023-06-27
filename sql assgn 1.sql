/*
Assignment-1

1. Connect to the SQL Server Instance.
2. Create a database named University.
3. Create a table named Student in the database with the following columns:
● StudentId INT
● Name VARCHAR(100)
● Address VARCHAR(200)
● Phone NUMERIC(10,0)
● Email VARCHAR(50)
● DateOfBirth Date
● DateOfAdmission Date
● DateOfPassing Date
● DeptName VARCHAR(50)
● CourseName VARCHAR(50)
● BatchName VARCHAR(10)
● StudentStatus VARCHAR(10) [N.B. StudentStatus possible values are:
active, left, completed.]
4. Insert 10 records in the student table
5. Update all the records set StudentStatus as completed where BatchName = 'CSBS'
6. Delete the records from Student table where DeptName = ' '
7. Select all the records from the Student Table
8. Select the records from the student table where StudentStatus is not completed
9. Truncate the table and select all the records from the table.
10. Drop the Student table.

*/
create table Students
(
	StudentId int,
	Name varchar(100),
	Address varchar(200),
	Phone numeric(10,0),
	Email varchar(50),
	DateOfBirth date,
	DateOfAdmission date,
	DateOfPassing date,
	DeptName varchar(50),
	CourseName varchar(50),
	BatchName varchar(10),
	StudentStatus varchar(10)
);
EXEC sp_help 'dbo.Students';
drop table Students;
truncate table Students;
select * from Students;
insert into Students values(3001,'Simmi','15 deodar street kolkata 700019',9051241790,'sy63@gmail.com','2000-1-8','2020-04-24','2024-08-08','B.tech','Computer Science','CSE-AI','Active');
insert into Students values(3002,'Ria','72/1 topsia road street kolkata 700089',8044441790,'ria29@gmail.com','2000-1-8','2020-04-24','2024-08-08','B.tech','Computer Science','CSE-AI','Active');
insert into Students values(3003,'Shadab','12/5 karunamoyee complex kolkata 700048',8951341790,'shadab17@gmail.com','2001-1-17','2020-04-24','2024-08-08','B.tech','Computer Science','CSE-AI','Active');
insert into Students values(3004,'Nancy','2 deodar street kolkata 700019',7851241770,'nancy67@gmail.com','2002-1-19','2020-04-24','2024-08-08','B.tech','Computer Science','CSBS','Left');
insert into Students values(3005,'Neha','4C tagore park kolkata 700084',9836692349,'neha19@gmail.com','1999-1-28','2019-05-24','2021-08-08','BCA','Computer Application','BCA-2d','Completed');

insert into Students values(3006,'Tripti','19/a deodar street kolkata 700029',9051241790,'tripti3@gmail.com','2000-1-8','2020-04-24','2024-08-08','Nursing','Nursing-junior','NURS-1','Active');
insert into Students values(3007,'Sweety','72 hazra road street kolkata 700079',8044441790,'sweety09@gmail.com','2002-5-18','2020-04-24','2024-08-08','B.tech','Computer Science','CSE-AI','Left');
insert into Students values(3008,'Saloni','5 karunamoyee complex kolkata 700078',8951341790,'saloni22@gmail.com','2001-1-17','2020-04-24','2024-08-08','BCA','Computer Application','BCA-2d','Active');
insert into Students values(3009,'Shruti','2/B deodar street kolkata 700039',7851241770,'shruti02@gmail.com','2002-1-19','2020-04-24','2024-08-08','B.tech','Computer Science','CSBS','Active');
insert into Students values(3010,'Fatima','8C tagoria park kolkata 700014',9836692349,'fatima556@gmail.com','1999-1-8','2019-05-24','2021-08-08','MCA','MCA application','MCA-1-F','Completed');

SELECT * FROM Students  WHERE StudentStatus = 'Active';
select * from Students;
update Students set StudentStatus= 'completed' where BatchName= 'CSBS';
SELECT * FROM Students where BatchName= 'CSBS';

DELETE FROM Students WHERE DeptName='';
 DROP TABLE Students;




