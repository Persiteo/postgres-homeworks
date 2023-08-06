-- SQL-команды для создания таблиц
CREATE TABLE employees 
(
	employee_id int PRIMARY KEY NOT NULL,
	first_name varchar(25) NOT NULL,
	last_name varchar(55) NOT NULL,
	title varchar(95) NOT NULL,
	birth_date date NOT NULL,
	notes text NOT NULL
);

CREATE TABLE customers 
(
	customer_id varchar(15) PRIMARY KEY,
	company_name varchar(75) NOT NULL,
	contact_name varchar(100) NOT NULL
);

CREATE TABLE orders 
(
	order_id serial PRIMARY KEY,
	customer_id varchar(15) REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date date NOT NULL,
	ship_city varchar(35) NOT NULL
)
