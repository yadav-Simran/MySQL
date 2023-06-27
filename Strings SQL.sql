-- AMOUNT of bytes needed to store each character for the ASCII range is just one byte.
-- A byte is a number between 0-255
/* 
char - ASCII - 1 BYTE
varchar - ASCII - 1 BYTE
nchar - UNICODE - 2 BYTE
nvarchar - UNICODE - 2 BYTE
*/



declare @character as char(10)
set @character = 'hello'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

GO

declare @character as char(10)
set @character = 'helloTHERE'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

-- RESULT:  10 bytes as datalength
GO


declare @character as char(10)
set @character = 'hellothereee'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
 -- RESULT: still takes 10 bytes as mentioned and truncated the extra ee
GO

declare @character as char(10)
set @character = ''
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
 -- RESULT: still takes 10 bytes as mentioned to store
GO
declare @character as varchar(10)
set @character = 'hello' 
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

go
declare @character as varchar(10)
set @character = ''
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
 /* RESULT: 0 characters and 0 bytes to store but actually its lying bcz
    THE DISADVANTAGE WITH THE VARIABLE CHARACTER (VARCHAR) IS:
	--> it takes an additional 2 bytes to store 
	so here an empty string will take 2 bytes to store
*/
 go

declare @character as nchar(10)
set @character = 'hello' 
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

go
declare @character as nchar(10)
set @character = ''
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

-- works same as char
-- here the datalength is 20 bcz every single unicode character takes 2 bytes to store
 go

declare @character as nvarchar(10)
set @character = 'hello' 
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
-- takes 12 bytes to store :
-- 5*2 + extra 2 bytes = 12 bytes to store this hello string
--- it is an NVARCHAR. It is 1 byte for each letter of hello, then multiply by 2 for the "N", plus 2 bytes because it is a "VAR". This makes (5*2)+2 = 12.
go
declare @character as nvarchar(10)
set @character = ''
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength

-- works same as varchar
 go
 
/* the major advantage of using nvarchar instead of using varchar is it can store 
special symbols which are  unicode symbols ح comes from arabic
*/
declare @character as varchar(10)
set @character = 'helloح'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
-- results: in ? doesnt show the character
go

declare @character as nvarchar(10)
set @character = 'helloح'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
/*here instead of using nvarchar we are getting ? 
since  it the quotation marl denotes a char string it is not denoting a nchar string and to do that 
we need to prefix the string using N before 'helloح' as shown below
*/
go

declare @character as nvarchar(10)
set @character = N'helloح'
SELECT @character as mystring , len(@character) as myLength, DATALENGTH(@character) as myDataLength
go
-------------------------------------------------------------------------------------------------------------------
--String Functions

declare @name as varchar(20)
set @name= ' simran '
select @name as MyName, LEFT(@name,2), right(@name,3)
select SUBSTRING(@name,2,3)
select LTRIM(rtrim (@name)) -- ltrim trims from left and rtrim trims from right
select upper(@name) as myUPPER
select lower(@name) as myLOWER
select replace(@name,'s','S') as myReplace
select trim(@name) -- trims from both ends
go
------------------------------------------------------------------------------------------------------
-- NULL – an introduction
declare @myvar as int
select 1+1+1+1+1+@myvar+1+1 as myCol
declare @mystring as nvarchar(20)

select datalength(@mystring) as mystring
declare @mydecimal decimal(5,2)
select convert(decimal(5,2),1000) -- shows error msg as Arithmetic overflow error converting int to data type numeric.
-- so to get rid of this error try_convert was introduced and it shows null value
select try_convert(decimal(5,2),1000)
select try_cast(1000 as decimal(5,2))
go
---------------------------------------------------------------------------------------------------------
-- ** JOINING TWO STRINGS TOGETHER ** 
DECLARE @FirstName as varchar(50), @MiddleName as varchar(50),@LastName as varchar(50);
set @FirstName = 'Syed'
--set @MiddleName = 'Shadab'
set @LastName = 'Hussain'

select @firstname + iif(@middlename is null, '', ' ' + @middlename) + ' ' + @lastname as FullName
select @firstname + CASE WHEN @middlename IS NULL THEN '' ELSE ' ' + @middlename END + ' ' + @lastname as FullName
select @firstname + coalesce(' ' + @middlename,'') + ' ' + @lastname as FullName
SELECT CONCAT(@firstname,' ' + @middlename, ' ' , @lastname) as FullName -- better way to add to strings avoiding null values
/*
THIS IS THE BEST WAY TO ADD TWO STRINGS as here if middle name is null
it will add this ' ' + @middlename i.e, ' ' + null(as middle name is null) 
value so it will give null as anything adding to null will give null value and
this concat function will ignore this and will show result as 
FirstName and Last name without adding any extra space and giving error message
*/
GO
--------------------------------------------------------------------------------------------

-- Joining a string to a number

SELECT 'My number is: ' + convert(varchar(20),4567)
SELECT 'My number is: ' + cast(4567 as varchar(20))

SELECT 'My salary is: $' + convert(varchar(20),2345.6) -- works , but not well
SELECT 'My salary is: ' + format(2345.6,'C','en-US')
SELECT 'My salary is: ' + format(2345.6,'C','fr-FR')
/* FORMAT  is the best way to do this as it formats to string any integer or date or time 
2345.6,'C','fr-FR' results to french symbol of currency
2345.6,'C','en-US' as US currency
*/
go
-----------------------------------------------------------------------------------
/*Create the following T-SQL query:

select [name]
from sys.all_columns
Please try the following questions. If you need a hint, then there is a hint document attached to these questions.

1)Add the letter A to the end of each name.

2)Add the letter Ⱥ to the end of each name. (You may want to copy and paste this letter, 
as it is an A with a stroke through it). If you are getting question marks, then give it another try.

3)Remove the first character from name.

4)Remove the last original character from name.

*/

select [name] + 'A'
from sys.all_columns

select [name] + N'Ⱥ'
from sys.all_columns

select substring([name],2,len([name])-1) as [name]
from sys.all_columns

select substring([name],1,len([name])-1) as [name]
from sys.all_columns

 