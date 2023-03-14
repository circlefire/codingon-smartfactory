use smartfactory;
select * from orders;
select * from customer;
select * from customer, orders;

select count(*) from customer; -- 9명
select count(*) from orders; -- 19건
select count(*) from customer, orders; -- 19*9건
-- a 고객이 orders의 19개 행과 결합, b 고객이 orsers의 19개 행과 결합, ...-> 논리에 안 맞음!

-- where 절을 이용해 조건을 추가
-- 참고) [테이블이름.테이블명] 표기: 특정 테이블의 열을 가리킴
select * 
	from customer, orders 
	where customer.custid=orders.custid; 
select * 
	from customer inner join orders 
	on customer.custid=orders.custid;
select * from customer join orders on customer.custid=orders.custid;