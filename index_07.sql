CREATE TABLE employees (
	employee_id int not null PRIMARY KEY,
    first_name VARCHAR(50), 
	last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date date,
    job_id int,
    salary decimal(8,2),
    commission_pct decimal(4,2),
    manager_id int,
    department_id int,
    FOREIGN KEY(job_id) REFERENCES jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(department_id) REFERENCES departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE
);
/*
-- Table 1: employees
Columns: employee_id (PK), first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
​
Table 2: jobs
Columns: job_id (PK), job_title, min_salary, max_salary
​
Table 3: departments
Columns: department_id (PK), department_name, manager_id, location_id
*/
CREATE DATABASE final CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE final;
CREATE TABLE jobs (
	job_id int not null PRIMARY KEY,
    job_title VARCHAR(50), 
	min_salary decimal(8,2),
    max_salary decimal(8,2)
);
CREATE TABLE departments (
	department_id int not null PRIMARY KEY,
    department_name VARCHAR(50), 
	manager_id int,
    location varchar(50)
);
drop table employees;
/*
참고) DECIMAL(M, D) 자료형
https://velog.io/@dlawogus/MySQL-DataTypes-DECIMAL
*/
DROP TABLE IF EXISTS employees;
-- create employees table
INSERT INTO employees VALUES
  (1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '2021-01-01', 1, 100000.00, 0.05, 3, 1),
  (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678', '2021-02-01', 2, 80000.00, NULL, 3, 1),
  (3, 'Bob', 'Johnson', 'bobjohnson@example.com', '555-9012', '2021-03-01', 1, 90000.00, 0.02, 5, 2),
  (4, 'Alice', 'Williams', 'alicewilliams@example.com', '555-3456', '2021-04-01', 3, 70000.00, NULL, 5, 2),
  (5, 'Mike', 'Brown', 'mikebrown@example.com', '555-7890', '2021-05-01', 4, 120000.00, 0.08, NULL, 3),
  (6, 'Sara', 'Lee', 'saralee@example.com', '555-2345', '2021-06-01', 4, 75000.00, NULL, 7, 4),
  (7, 'Tom', 'Jackson', 'tomjackson@example.com', '555-6789', '2021-07-01', 5, 110000.00, 0.03, NULL, 4),
  (8, 'Karen', 'Davis', 'karendavis@example.com', '555-1234', '2021-08-01', 5, 95000.00, NULL, 7, 4),
  (9, 'David', 'Miller', 'davidmiller@example.com', '555-5678', '2021-09-01', 2, 85000.00, NULL, 10, 5),
  (10, 'Lisa', 'Wilson', 'lisawilson@example.com', '555-9012', '2021-10-01', 1, 110000.00, 0.06, NULL, 5);

DROP TABLE IF EXISTS jobs;
-- create jobs table

INSERT INTO jobs VALUES
  (1, 'Manager', 80000.00, 120000.00),
  (2, 'Developer', 60000.00, 100000.00),
  (3, 'Designer', 50000.00, 90000.00),
  (4, 'Salesperson', 40000.00, 80000.00),
  (5, 'Accountant', 50000.00, 100000.00);

DROP TABLE IF EXISTS departments;
-- create departments table

INSERT INTO departments VALUES
(1, 'Engineering', 3, 'New York'),
(2, 'Sales', 5, 'Los Angeles'),
(3, 'Marketing', 7, 'Chicago'),
(4, 'Accounting', 8, 'Houston'),
(5, 'IT', 10, 'San Francisco');

select * from employees;
select * from jobs;
select * from departments;

-- < 실습 문제 >
-- 1. IT 부서에서 일하는 모든 직원을 반환하는 쿼리를 작성합니다.
select * from employees where department_id = (select department_id from departments where department_name = 'IT');


-- 2. 각 부서의 총 직원 수를 반환하는 쿼리를 작성합니다.
SELECT department_name, COUNT(*) AS 'num_department'
FROM employees, departments
WHERE employees.department_id = departments.department_id
GROUP BY employees.department_id;


-- 3. $80,000 이상의 급여를 받는 모든 직원의 이름을 반환하는 쿼리를 작성합니다.
select first_name, last_name from employees where salary>=80000;


-- 4. 영업부에서 근무하며 $50,000 이상의 급여를 받는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
select first_name, last_name, salary from employees where salary >= 50000 and department_id = (select department_id from departments where department_name='Sales');


-- 5. 직함과 직함별 평균 급여를 반환하는 조회를 작성합니다.
SELECT job_title, avg(salary) AS 'job_avg_salary'
FROM employees, jobs
WHERE employees.job_id = jobs.job_id
GROUP BY employees.job_id;

select job_title, avg(salary) AS 'job_avg_salary'
	from employees  join jobs
    on employees.job_id=jobs.job_id
    group by employees.job_id;

-- 6. 모든 직업에 대한 직책과 최대 급여를 반환하는 조회를 작성합니다.
select job_title, max_salary from jobs;


-- 7. 가장 높은 연봉을 받는 직원 상위 10명의 이름과 급여를 반환하는 쿼리를 작성합니다.
select first_name, last_name, salary from employees order by salary desc limit 10;

-- 8. 최저임금을 받는 하위 5명의 직원들의 이름과 급여를 반환하는 쿼리를 작성하세요.
select first_name, last_name, salary from employees order by salary limit 5;


-- 9. 관리자와 동일한 직함을 가진 모든 직원의 이름을 반환하는 쿼리를 작성합니다.
select a.first_name, a.last_name
	from employees as a join employees as b
    on a.job_id=b.job_id and a.manager_id = b.employee_id;



-- 10. 2021년에 채용된 모든 직원의 이름을 반환하는 쿼리를 작성합니다.
select first_name, last_name from employees where hire_date>='2021-01-01' and hire_date<='2021-12-31';


-- 11. 수수료를 받는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
select first_name, last_name, salary from employees where commission_pct>0;


-- 12. 수수료를 받지 않는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
select first_name, last_name, salary from employees where isnull(commission_pct);


-- 셀프 조인
create table users (
	id int primary key, -- 유저 번호
    name varchar(10), -- 유저명
    superior_id int -- 상사
);

insert into users values
	(1,'happy',null),
    (2,'banana',1),
    (3,'lucky',2),
    (4,'orange',2),
    (5,'apple',null);

select * from users;	
select * from users as u1 join users as u2 on u1.superior_id=u2.id;
select u1.id, u1.name as '멘티명', u2.name as '멘토명' from users as u1 join users as u2 on u1.superior_id=u2.id;