use smartfactory;

select * from user order by birthday;
select * from user where gender like 'M' order by name desc;
select id, name from user where birthday >= '1990-01-01' and birthday <= '1999-12-31';
select * from user where birthday like '%-06-%';
select * from user where gender like 'M' and birthday >='1970-01-01' and birthday <= '1979-12-31';
select * from user order by age desc limit 3;
select * from user where age >= 25 and age <= 50;


