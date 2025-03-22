create database library_db;

use library_db;

create table branch (
branch_id varchar(10) primary key,
manager_id varchar(10),
branch_address varchar(30),
contact_no varchar(15)
);

create table employees(
emp_id varchar(10) primary key,
emp_name varchar(30),
postion varchar(30),
salary decimal(10,2),
branch_id varchar(10),
CONSTRAINT brchid_fk FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);


create table members(
member_id varchar(10) primary key,
member_name varchar(30),
member_address varchar(30),
reg_date date
);


create table books(
isbn varchar(50) primary key,
book_title varchar(80),
category varchar(30),
rental_price decimal(10,2),
status_book varchar(10),
author varchar(30),
publisher varchar(30)
);

create table issue_status(
issued_id varchar(10) primary key,
issued_book_name varchar(50),
issued_date date,
member_id varchar(10),
isbn varchar(50),
emp_id varchar(10)
CONSTRAINT memid_fk FOREIGN KEY(member_id) REFERENCES members(member_id),
CONSTRAINT book_fk FOREIGN KEY(isbn) REFERENCES books(isbn),
CONSTRAINT emp_fk FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);


create table return_status(
return_id varchar(10),
issued_id varchar(30),
return_book_name varchar(80),
return_date date,
isbn varchar(50),
CONSTRAINT b_fk FOREIGN KEY(isbn) REFERENCES books(isbn)
);


INSERT INTO members VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');

INSERT INTO branch VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');

INSERT INTO employees VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');


INSERT INTO books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books');

INSERT INTO issue_status(issued_id, member_id, issued_book_name, issued_date, isbn,emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107');

INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES ('RS101', 'IS101', '2023-06-06'),
('RS102', 'IS105', '2023-06-07'),
('RS103', 'IS103', '2023-08-07'),
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');

select * from books;
select * from members;
select * from employees;
select * from branch;
select * from issue_status;
select return_id, issued_id, return_date from return_status;



--1)
INSERT INTO books VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

--2)
delete from books where author like '%lee';

--3) Retrieve All Books Issued by a Specific Employee

SELECT * FROM employees
INNER JOIN issue_status ON employees.emp_id = issue_status.emp_id 
WHERE issue_status.emp_id = '106';

--4) List Members Who Have Issued More Than One Book

SELECT issue_status.member_id 
FROM issue_status
GROUP BY issue_status.member_id 
HAVING COUNT(*) > 1;

--5) Retrieve All Books in a Specific Category:

    select * from books
    where category like 'history';

--6) Find Total Rental Income by Category:

SELECT 
     a.category,SUM(a.rental_price) rent_income
FROM books a
group by a.category;

--7) List Employees with Their Branch Manager's Name and their branch details:

 select distinct a.branch_id,a.emp_name,a.postion,b.branch_address,b.contact_no
 from employees a inner join branch b
 on a.branch_id=b.branch_id;


 --8) Retrieve the List of Books Not Yet Returned


 select a.* from issue_status a left join return_status b
 on a.issued_id = b.issued_id
 where b.return_id = null;


 --9) Find Top 3 Employees with the Most Book Issues Processed

 Select top 3
      e.emp_name,COUNT(a.issued_id) as no_book_issued,b.*
from employees e inner JOIN issue_status a 
on e.emp_id = a.emp_id
inner JOIN
branch b on e.branch_id = b.branch_id
Group by e.emp_name, b.branch_address,b.branch_id,b.contact_no,b.manager_id
Order by no_book_issued DESC;
--OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY can add this instead of top 3

--10) List Members Who Registered in the Last 365 Days

Select * from members 
where reg_date >= DATEADD(day, -365, GETDATE());

--11) 

UPDATE members
Set member_address = '125 Oak St'
Where member_id = 'C103';

--12) Books with Rental Price Above a Certain Threshold

select * from books
where rental_price > 7.00;

--13) Top book categories based on the number of issues

SELECT --can add TOP 2 or TOP 1 here
     a.category,count(b.issued_id) as issue_count
FROM books a
inner join  issue_status b
on a.isbn = b.isbn
group by a.category
order by issue_count desc;
 
--14) Average Salary by Position and Branch
 
 SELECT postion,AVG(avgsalary) AS average_salary
FROM ( SELECT postion, branch_id, AVG(salary) AS avgsalary
       FROM employees
       GROUP BY postion, branch_id) AS subquery
GROUP BY postion
ORDER BY postion;






