-- Library Management Sytem

-- Creating Branch Table

drop table if exists branch;
create table branch(
	branch_id varchar(10) primary key,
	manager_id varchar(10),
	branch_address varchar(30),
	contact_no varchar(15)
)

-- creatung employees table
drop table if exists employees;
create table employees(
		emp_id varchar(10) primary key,
		emp_name varchar(25),
		position varchar(25),
		salary int ,
		branch_id varchar(10) -- Foreign Key for table Branch
)

-- creating book table

drop table if exists books;
create table books(
		isbn varchar(30) primary key,
		book_title varchar(60),
		category varchar(20),
		rental_price float,
		status varchar(5),
		author varchar(25),
		publisher varchar(30)
)

-- creating issue_status table

drop table if exists issue_status;
create table issue_status(
		issued_id varchar(10) primary key,
		issued_member_id varchar(10),  --fk for member table
		issued_book_name varchar(50),
		issued_date date,
		issued_book_isbn varchar(20), -- foreign key for books table
		issued_emp_id varchar(10) --fk for employee table
)


drop table if exists members;
create table members(
	member_id varchar(10) primary key,
	member_name varchar(25),
	member_address varchar(30),
	reg_date date
)

drop table if exists return_status;
create table return_status(
		return_id varchar(20) primary key,
		issued_id varchar(20),
		return_book_name varchar(40),
		return_date date,
		return_book_isbn varchar(20)
)

-- Adding Foreign Keys 
alter table issue_status
add constraint fk_members
foreign key (issued_member_id)
references members (member_id);

alter table issue_status
add constraint fk_books
foreign key (issued_book_isbn)
references books (isbn);

alter table issue_status
add constraint fk_employee
foreign key (issued_emp_id)
references employees(emp_id);


alter table return_status
add constraint fk_issue_id
foreign key (issued_id)
references issue_status(issued_id);

alter table 

alter table employees
add constraint fk_branch_id
foreign key (branch_id)
references branch (branch_id);