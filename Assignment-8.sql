/*
Assignment-8

1. Create a table named StudentBkup having the same structure as Student. One
identity primary key column to be added as studentBkupId. No other constraint needs
to be created.
2. Create a table named ExamMarksNew having the same structure as ExamMarks. One
identity primary key column to be added as examMarksNewId. No other constraint
needs to be created.
3. Create a DML after trigger to insert the deleted/modified data from Student table to
StudentBkup table every time a delete or update happens on the table.
4. Create a DML instead of trigger to insert the data to be modified/added in ExamMarks
table to ExamMarksNew table every time an update/insert happens on the table.
There will be no change to the original table data.
*/
Create Table StudentBkup(
StudentBkupId INT Primary Key,
StudentName Varchar(50),
DeptName Varchar(50),
Exam_Marks INT,
Details varchar(100)     

);
Create Table ExamMarksNew(
ExamMarksNewId INT Primary Key,
Exam_Marks INT,
Details varchar(100)
);


Create Trigger tr_Student_ForDelete
ON Student
For Delete
As
Begin
Declare @Id int, @Name varchar(50), @DName varchar(50), @Marks INT
Select @Id=StudentId from deleted
Select @Name=StudentName from deleted
Select @DName=DeptName from deleted
Select @Marks=Exam_Marks from deleted
insert into StudentBkup values(@Id, @Name, @DName, @Marks, 'Deleted this Student Records at
Time:- ' + cast(Getdate() as nvarchar(20)))
End


Delete from Student where StudentId = 5;
Select * from StudentBkup;
Create Trigger tr_Student_ForModify
ON Student
For Update
As
Begin
Declare @Id int, @Name varchar(50), @DName varchar(50), @Marks INT
Select @Id=StudentId from deleted
Select @Name=StudentName from deleted
Select @DName=DeptName from deleted
Select @Marks=Exam_Marks from deleted
insert into StudentBkup values(@Id, @Name, @DName, @Marks, 'Updated this Student Records at
Time:- ' + cast(Getdate() as nvarchar(20)))
End
Update Student Set Exam_Marks = 99 where StudentId=1;
Create View ExamMarks
As
Select * from Student
Select * from ExamMarks




Create Trigger tr_Exam_Marks_Insteadof_Insert
on ExamMarks
Instead of Insert
as
Begin
--Select * from inserted
Declare @Id int, @Marks Int
Select @Id=StudentId from inserted
Select @Marks=Exam_Marks from inserted
insert into ExamMarksNew values(@Id, @Marks, 'Inserted this details at Time:- ' +
cast(GetDate() as nvarchar(20)))
End


insert into ExamMarks values(5,'Koyena', 'Bio Tech', 98)



Create Trigger tr_Exam_Marks_Insteadof_Update
on ExamMarks
Instead of Update
as
Begin
--Select * from inserted
Declare @Id int, @Marks Int
Select @Id=StudentId from inserted
Select @Marks=Exam_Marks from inserted
insert into ExamMarksNew values(@Id, @Marks, 'Updated this details at Time:- ' +
cast(GetDate() as nvarchar(20)))
End



Update ExamMarks set Exam_Marks = 80 where StudentId = 2
select * from ExamMarksNew