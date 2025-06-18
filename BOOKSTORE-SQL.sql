--Library Management System
--creating a database BOOKSTORE 

create database BOOKSTORE

USE BOOKSTORE

CREATE TABLE BOOKS(SNo INT,BOOK_ID INT,TITLE VARCHAR(255), AUTHOR VARCHAR(255),GENRE VARCHAR(255),
PUBLISHED_YEAR INT, TOTAL_COPIES INT, AVAILABLE_COPIES INT, SHELF_NO INT,is_available bit)

SELECT * FROM BOOKS


CREATE TABLE MEMBERS(SNo INT, MEMBER_ID INT,NAME VARCHAR(25),MAIL_ID VARCHAR(25), PHONE_NO VARCHAR(15),JOIN_DATE DATE )

select * from members

INSERT into MEMBERS VALUES(1,5450,'Aarav Mehta','aarav.mehta@example.com','9876543210','2022-01-10'),
                          (2,5451,'Priya Sharma','priya.sharma@example.com','9823456789','2024-08-16'),
                          (3,5452,'Rohan Gupta','rohan.gupta@example.com','9845671234','2024-08-16'),
                          (4,5453,'Ananya Iyer','ananya.iyer@example.com','9911223344','2024-08-06'),
                          (5,5454,'Karan Patel','karan.patel@example.com','9765432109','2024-08-16'),
                          (6,5455,'Neha Reddy','neha.reddy@example.com ','9988776655','2024-09-26'),
                          (7,5456,'Arjun Verma','arjun.verma@example.com','9876512345','2024-09-26'),
                          (8,5457,'Sneha Nair','sneha.nair@example.com','9833445566','2024-09-26'),
                          (9,5458,'Vishal Kumar','vishal.kumar@example.com','9922334455','2024-09-26'),
                          (10,5459,'Isha Singh','isha.singh@example.com','9812345678','2024-09-26'),
                          (11,5460,'Rahul Joshi','rahul.joshi@example.com','9797979797','2024-12-26'),
                          (12,5461,'Meera Das','meera.das@example.com','9753124680','2024-12-26'),
                          (13,5462,'Devansh Chauhan','devansh.ch@example.com','9888888888','2025-01-17'),
                          (14,5463,'Tanya Bansal','tanya.bansal@example.com','9827623456','2025-01-08'),
                          (15,5464,'Aditya Mishra','aditya.mishra@example.com','9762812345','2025-01-17'),
                          (16,5465,'Riya Jain','riya.jain@example.com','9944112233','2025-02-15'),
                          (17,5466,'Nikhil Yadav','nikhil.yadav@example.com','9834567890','2025-02-15'),
                          (18,5467,'Shruti Kaur','shruti.kaur@example.com','9819898989','2025-03-10'),
                          (19,5468,'Manav Deshmukh','manav.deshmukh@example.com','9900112233','2025-03-10'),
                          (20,5469,'Aishwarya Pillai','aishwarya.p@example.com','9786123456','2025-03-10'

SELECT * FROM MEMBERS

create table librarians(SNo INT,NAME VARCHAR(50),MAIL_ID VARCHAR(50),PHONE_NO varchar(50),SHIFTS VARCHAR(20),SALARY INT)

select * from librarians

INSERT into LIBRARIANS VALUES(1,'RAKESH','rakesh@gmail.com',6305495789,'MORNING',30000),
                             (2,'ANAND','ANAND@gmail.com',8205495789,'MORNING',22000),
                             (3,'SARATH','SARATHh@gmail.com',9396595789,'AFTERNOON',13000),
                             (4,'TINESH','TINESH@gmail.com',6305495789,'EVENING',9000),
                             (5,'SAGAR','SAGAR@gmail.com',6305495789,'EVENING',8000)

select * from librarians

CREATE TABLE RECORDS (SNo INT,LOAN_ID INT,TOTAL_BOOKS INT,BOOK_ID VARCHAR(20),MEMBER_ID INT,BORROW_DATE DATE,RETURN_DATE DATE,BOOKS_RETURNED INT,LIBRARIAN VARCHAR(25),
                     PENDING_BOOKS INT,PENDING_BOOKID VARCHAR(25))

SELECT * FROM RECORDS

insert into records values(1,101,1,5450,'9066','2024-08-16','2024-08-25',1,'Rakesh',0,'NONE'),
                          (2,102,2,5451,'9067,9081','2024-08-18','2024-08-26',2,'Anand',0,'NONE'),
                          (3,103,1,5452,'9072','2024-08-21','2024-08-30',1,'Sarath',0,'NONE'),
		          (4,104,1,5453,'9068','2024-09-20','2024-09-30',1,'Sagar',0,'NONE'),
			  (5,105,1,5466,'9070','2025-02-15','2025-02-24',1,'Tinesh',0,'NONE'),
			  (6,106,2,5469,'9075,9076','2025-03-30','2025-04-08',1,'Rakesh',1,'9075'),
                          (7,107,1,5459,'9069','2024-09-26','2024-10-05',1,'Anand',0,'NONE'),
                          (8,108,1,5456,'9085','2024-09-26','2024-10-05',1,'Sarath',0,'NONE'),
                          (9,109,3,5463,'9075,9070','2025-01-17',null,0,'Tinesh','9075,9070'),
                          (10,110,4,5465,'9081,75,67,66','2025-02-15',null,0,'Rakesh',4,'9075,81,67,66')					  

SELECT * FROM RECORDS


--Query-1: Borrow a Book (Insert into Borrowing Table and Update Book Availability)
 
insert into records values(11,111,1,'9075',5450,'2024-09-10',null,0,'Anand',1,'9075')

update books set AVAILABLE_COPIES=AVAILABLE_COPIES-1 where BOOK_ID='9075'

--Query-2: Return a Book (Update Return Date and Book Availability)

update records set RETURN_DATE='2024-10-05' where LOAN_ID=108

and update books set AVAILABLE_COPIES=AVAILABLE_COPIES+1 where book_id = 9085

--Query-3: Check Available Books

select book_id,title from BOOKS where is_available=1 

--Query-4: View Member Loan History
create view LOAN_HISTORY as 
select  m.member_id,m.name, r.[LOAN_ID], r.TOTAL_BOOKS, r.[BOOK_ID], r.[BORROW_DATE], 
r.[RETURN_DATE], r.[BOOKS_RETURNED] , r.PENDING_BOOKS, r.PENDING_BOOKID from members m
full join records r on m.MEMBER_ID = r.MEMBER_ID

SELECT * FROM LOAN_HISTORY

--Query-5: List Overdue Books (Books Not Returned in 14 Days)

create view PENDING_BOOKS as SELECT * from records where PENDING_BOOKS>0

select * from pending_books

--Query-6: List All Books by a Specific Author

select title from books where AUTHOR ='john green'

select * from books

--Query-7: Find Books Published After a Certain Year

select * from books where published_year =1960

--Query-8: Count Total Books in the Library

select sum(available_copies) as [TOTAL BOOKS] from books 

--Query-9: View All Members Who Borrowed a Specific Book

select * from records where BOOK_ID like '%9075%'

--Query-10: Find Borrowing History of a Specific Member

select * from records where member_id=5450

--Query-11: List All Available Books of a Specific Genre

select * from books where GENRE='thriller' and is_available=1

--Query-12: Calculate the Total Number of Books Borrowed by Each Member

SELECT Member_ID, SUM(TOTAL_BOOKS) AS TotalBooksBorrowed FROM Records GROUP BY Member_ID;

select * from records

--Query-13: List All Overdue Books Not Yet Returned

SELECT * from records where PENDING_BOOKS>0

--Query-14: List the Librarians Who Processed the Most Borrowings

SELECT librarian, COUNT(*) AS count FROM records GROUP BY librarian ORDER BY count DESC

--Query-15: Find All Books Borrowed But Not Yet Returned

SELECT * from records where PENDING_BOOKS>0

select * from books

select * from librarians

select * from records

select * from members
