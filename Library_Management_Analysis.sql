select * from books


--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 
--'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn, book_title, category, rental_price, status, author, publisher) values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 
'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

-- Task 2: Update an Existing Member's Address
select * from members

update members
set member_address = '124 Main St'
where member_id = 'C101'

--Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

select * from issue_status
delete from issue_status
where issued_id = 'IS121'

--Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select issued_id, issued_book_name from issue_status
where issued_emp_id = 'E101'

-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

select m.member_id,m.member_name, count(i.issued_emp_id)
from members m
join issue_status i
on i.issued_member_id = m.member_id
group by 1
having count(i.issued_emp_id) > 1


select issued_emp_id,
count(*)
from issue_status
group by 1
having count(*)>1



select * from issue_status

--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results 
-- each book and total book_issued_cnt**

-- here abdullah you have to check that how many times a book has been issued, so for that you need 
-- book id, book_title from books table and the number of times that book has been issued from the issued_table

select * from books
select * from issue_status

create table issued_book_counts as 
(select b.isbn, b.book_title, count(i.issued_book_isbn)
from books b
left join issue_status i
on b.isbn = i.issued_book_isbn
group by b.isbn, b.book_title)

select * from issued_book_counts


-- Task 7. Retrieve All Books in a Specific Category

select * from books

select isbn, book_title, category from books
where category = 'Classic'

-- Task 8: Find Total Rental Income by Category:

select b.category, sum(b.rental_price) as total_price, count(*) as issued_counts
from issue_status i
join books b
on i.issued_book_isbn = b.isbn 
group by 1
order by 2 desc


-- List Members Who Registered in the Last 180 Days:

select * from members

insert into members(member_id, member_name, member_address, reg_date) 
values ('C117', 'David','671 Pine St', '2026-05-25' ),
('C120', 'John','671 Oak St', '2026-06-15' )

select * from members 
where reg_date >= current_date - interval '180 days'


select b.category, sum(b.rental_price) as total_price from books b
group by category
order by total_price desc

-- List Employees with Their Branch Manager's Name and their branch details:

select * from branch
select * from employees

select e1.*, b.manager_id, e2.emp_name
from employees e1
join branch b
on e1.branch_id = b.branch_id
join employees as e2
on e2.emp_id = b.manager_id

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold of 7 usd:

drop table if exists expensive_books;
create table expensive_books as 
select b.isbn, b.book_title, b.rental_price as total_price
from books b
where b.rental_price > 7

select * from expensive_books

-- Task 12: Retrieve the List of Books Not Yet Returned

select * from return_status

select * from issue_status

select * from issue_status as ist
join return_status as rs
on rs.issued_id = ist.issued_id
where rs.return_date is null













