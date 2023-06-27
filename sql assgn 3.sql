/*
Exp. 3: Aggregate and Built in Functions
Aim: To demonstrate the working of aggregate and built in functions in database.
Description: In database management an aggregate function is a function where the values of multiple rows are
grouped together as input on certain criteria to form a single value of more significant meaning or measurement.
Questions:
1.
a. Create a table deposit with the following specifications

b. Create a table branch with the following specifications

c. Create a table customer with the following specifications

d. Create a table borrow with the following specifications

2. Insert the following tuples in the given tables

a. Deposit table:
<106, Sandip, Andheri, 2000, 31-MAR-96>
<107, Shivani, Virar, 1000, 5-SEP-95>
<108, Kranti, Nehru place, 5000, 2-JUL-95>
<109, Naren, powai, 7000, 10-AUG-95>
b. Branch table:
<Dharampeth, Nagpur>
<M.G.Road, Bangalore>
<Nehru place, Delhi>
<powai, Bombay>
<Newtown, Kolkata>
c. Customer Table:
<Pramod, Nagpur>
<Sandip, Surat>
<Shivani,Bombay>
<Kranti, Bombay>
<Naren, Bombay>

d. Borrow table:
<375, Pramod, Virar, 8000>
<481, Kranti, Nehru place, 3000>

3.
a. List the total loan amount taken by borrowers.
b. Find the total deposit done by depositors.
c. List the total loan taken from Andheri branch.
d. Write a query to find the total deposit of customer having account date later than 1-jan-96.
e. Find the total deposit of customers living in city Nagpur.
f. List the max deposit of customers living in Bombay.
g. Find the total number of branch cities.
h. Find the total number of customer cities.
i. Write a query to display the branch name and branch wise deposit.
j. Give the branch wise deposit of the customer after account date 1-JAN-96.
k. Find the total count of the customers.
l. Find the total count of the depositors branch wise.
m. Write a query to find the maximum loan from branch Newtown.
n. List the branches having sum of deposit more than 4000.
o. Calculate the length of the string ‘dbms’ from dual table.
p. Display the names of the customer in uppercase.
q. Display the substring “ani” From “Shivani” from deposit table.
r. Prefix actno column with two 00’s in deposit table.
s. Sort the deposit table based on actno.
t. Use add_months function to add three months from the current system date.
u. Use round and trunc functions to round off and truncate the value 15.6789 from dual table.
*/
CREATE TABLE DEPOSIT
(
	actno varchar(25),
	cname varchar(18),
	bname varchar(18),
	amount Numeric(8),
	adate date33
);
CREATE TABLE BRANCH
(
	Bname varchar(25),
	City varchar(18)
);
CREATE TABLE CUSTOMER
(
	Cname varchar(25),
	City varchar(18)
);
CREATE TABLE BORROW
(
	Loanno varchar(25),
	Cname varchar(18),
	Bname varchar(18),
	Amount numeric(8)
);
INSERT INTO DEPOSIT values (106,'Sandip', 'Andheri', 2000, '1996-03-31');
INSERT INTO DEPOSIT values (107,'Shivani', 'Virar', 1000, '1995-09-05');
INSERT INTO DEPOSIT values (108,'Kranti', 'Nehru place', 5000, '1995-07-02');
INSERT INTO DEPOSIT values (109,'Naren', 'powai', 7000, '1995-08-10');

select * from DEPOSIT;
truncate table DEPOSIT;

INSERT INTO BRANCH values ('Dharampeth','Nagpur');
INSERT INTO BRANCH values ('M.G.Road','Banglore');
INSERT INTO BRANCH values ('Nehru place','Delhi');
INSERT INTO BRANCH values ('powai','Bombay');
INSERT INTO BRANCH values ('Newtown','Kolkata');

select * from BRANCH;

INSERT INTO CUSTOMER values ('Pramod','Nagpur');
INSERT INTO CUSTOMER values ('Sandip','Surat');
INSERT INTO CUSTOMER values ('Shivani','Bombay');
INSERT INTO CUSTOMER values ('Kranti','Bombay');
INSERT INTO CUSTOMER values ('Naren','Bombay');

select * from CUSTOMER;

INSERT INTO BORROW values (375,'Pramod','Virar',8000);
INSERT INTO BORROW values (481,'Kranti','Nehru place',3000);

select * from BORROW;

SELECT SUM(Amount) as "Total Loan Amount" FROM BORROW;

SELECT SUM(amount) as "Total Deposit done by depositors" FROM DEPOSIT;

SELECT SUM(amount) as "Total loan from andheri branch" FROM DEPOSIT WHERE bname='Andheri';

SELECT SUM(amount) as "Total deposit later than 1-Jan-96" FROM DEPOSIT WHERE adate > '1996-01-01' ;

SELECT * FROM CUSTOMER;
SELECT * FROM DEPOSIT;
SELECT * FROM BRANCH;
SELECT * FROM BORROW;


SELECT sum(amount) as "total deposit by customer from nagpur"
from DEPOSIT as D
join CUSTOMER as C on D.cname = C.Cname
where City='Nagpur';

SELECT max(amount) as "Maximum deposit by customer from BOMBAY"
from DEPOSIT as D
join CUSTOMER as C on D.cname = C.Cname
where City='Bombay';

select count(DISTINCT(City)) as "Total number of branch city" from BRANCH;

select count(distinct(City)) as "Total number of customer city" from CUSTOMER;

SELECT bname,amount from DEPOSIT;

SELECT bname, amount FROM DEPOSIT WHERE adate>'1996-01-01';

select count(Cname) as "Total count of Customers" from CUSTOMER;

select count(bname) as "Total count of Depositors branch wise" from DEPOSIT;

SELECT max(amount) as "Maximum loan amount from branch Newtown"
from BRANCH as B
join BORROW as BO on B.Bname = BO.Bname
where B.Bname='Newtown';

SELECT bname,amount from DEPOSIT WHERE amount>4000;

--o


--p
SELECT UPPER(Cname) as "Customer name" from CUSTOMER;

--q
SELECT SUBSTRING('Shivani',5,7) as "Substring of shivani" FROM DEPOSIT WHERE cname='Shivani';

SELECT * FROM DEPOSIT AS D
ORDER BY D.actno ASC;--r

UPDATE DEPOSIT
 SET actno = CONCAT('00', actno)  where actno >= '106';

 SELECT DATEADD(month, 3, '2022-11-15') AS DateAdd;

