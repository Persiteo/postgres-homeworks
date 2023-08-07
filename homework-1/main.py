"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
import os

connection = psycopg2.connect(host="localhost", database="north", user="postgres", password="password")

dir_customers = os.path.join('north_data', 'customers_data.csv')
dir_employees = os.path.join('north_data', 'employees_data.csv')
dir_orders = os.path.join('north_data', 'orders_data.csv')

with open(dir_customers, newline='') as customers_file, open(dir_employees, newline='') as employees_file, open(dir_orders, newline='') as order_file:
    cus_reader = csv.DictReader(customers_file)
    emp_reader = csv.DictReader(employees_file)
    ord_reader = csv.DictReader(order_file)

# try:
    with connection:
        with connection.cursor() as cur:
            for row in cus_reader:
                cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", (row['customer_id'], row['company_name'], row['contact_name']))

            for row in emp_reader:
                cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", (row['employee_id'], row['first_name'], row['last_name'], row['title'], row['birth_date'], row['notes']))

            for row in ord_reader:
                cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", (row['order_id'], row['customer_id'], row['employee_id'], row['order_date'], row['ship_city']))


# finally:
connection.close()
