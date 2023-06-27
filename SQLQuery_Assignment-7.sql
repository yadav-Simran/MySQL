/*
Assignment-7

1. Open two new scripts and connect. Then, set the isolation level as Read Committed in
both the sessions.
2. In the first session write a transaction (within a try...catch block) to select the name of
the student with studentid = 5, then update marks value in ExamMarks table for all the
records and then again, the select statement to retrieve the name of the student with
studentid = 5.
3. In the second session, write a transaction (within a try...catch block) to update the
name of the student with studentid = 5.
4. Execute the first script and immediately execute the second script. Record the output.

*/
SELECT * from Student;
Drop Table Student;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
Create Table Student(
StudentId INT,
StudentName Varchar(100),
DeptName Varchar(100),
Exam_Marks INT
);
insert into Student values (1, 'Simran', 'CSBS', 85), (2, 'Shadab', 'CSBS', 90), (3, 'Soumik',
'CSE', 80), (4, 'Aamir', 'ECE', 100), (5, 'Koyena', 'Bio Tech', 95);

Begin Try
Begin Transaction
Update Student set Exam_Marks = 98 where StudentId = 5
Commit Transaction
End Try
Begin Catch
Rollback Transaction
End Catch

-- Second Query
Begin Try
Begin Transaction
Update Student set StudentName = 'Kashfa' where StudentId = 5
Commit Transaction
End Try
Begin Catch
Rollback Transaction
End Catch