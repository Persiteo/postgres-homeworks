-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial, 
	first_name varchar, 
	last_name varchar, 
	birthday date, 
	phone varchar
)

-- 2. Добавить в таблицу student колонку middle_name varchar
Alter table student ADD column middle_name varchar;

-- 3. Удалить колонку middle_name
Alter table student DROP column middle_name;

-- 4. Переименовать колонку birthday в birth_date
Alter table student RENAME birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
Alter table student ALTER column phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone) values ('Imya', 'Familiya', '2013-12-11', '999-99-99'), 
('Imya1', 'Familiya1', '2014-11-10', '999-99-98'), ('Imya2', 'Familiya2', '2015-10-09', '999-99-97')

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student restart identity;
