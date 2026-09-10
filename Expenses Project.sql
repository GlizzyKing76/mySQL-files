create database expense_tracker;
use expense_tracker;

create table categories(
	category_id int auto_increment primary key,
    category_name varchar(50) not null
);

show tables;
describe categories;

insert into categories (category_name)
values
	("Food"),
    ("Rent"),
    ("Transportation"),
    ("Entertainment"),
    ("Utilities");
    
select * from categories;

create table expenses(
	expense_id int auto_increment primary key,
    description varchar(100) not null,
    amount decimal(10,2) not null,
    expense_date date not null,
    category_id int not null,
    foreign key (category_id) references categories(category_id)
);

describe expenses;

insert into expenses
	(description, amount, expense_date, category_id)
values
("Grocery shopping", 64.25, "2026-09-08", 1),
("Monthly rent", 1800.00, "2026-09-01", 2),
("Gas", 45.00, "2026-09-07", 3),
("Netflix", 15.99, "2026-09-05", 4),
("Electric bill", 82.40, "2026-09-03", 5);

select * from expenses;

/*
to join things you gotta do
	thingA.1
    thingA.2
    thingA.3
    thingB.1
from thingA
join thingB
	on [whatever in Thing A = whatever in thing B]
*/

select
	expenses.description,
    expenses.amount,
    expenses.expense_date,
    categories.category_name
from expenses
join categories
	on expenses.category_id = categories.category_id;
    
select sum(amount) as total_spent
from expenses;

select
	categories.category_name,
    sum(expenses.amount) as total_spent
from expenses
join categories
	on expenses.category_id = categories.category_id
group by categories.category_name;

insert into expenses
	(description, amount, expense_date, category_id)
values
	("Grub Hub", 250.99, "2026-10-01", 1);
    
select * from expenses;

select *
from expenses
where amount >= 100;

select
	expenses.description,
    expenses.amount,
    expenses.expense_date,
    categories.category_name
from expenses
join categories
	on expenses.category_id = categories.category_id
where expenses.amount <= 100;

select *
from expenses
where expenses.amount <= 100
order by amount desc;

select 
	expenses.description,
    expenses.amount,
    expenses.expense_date,
    categories.category_name
from expenses
join categories
	on expenses.category_id = categories.category_id
order by expenses.amount desc;

select 
	expenses.description,
    expenses.amount,
    expenses.expense_date,
    categories.category_name
from expenses
join categories
	on expenses.category_id = categories.category_id
where categories.category_name in ('Food', 'Entertainment')
order by expenses.amount desc;



