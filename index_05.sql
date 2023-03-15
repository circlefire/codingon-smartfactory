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
    
select * from customer join orders on customer.custid=orders.custid; -- inner join

-- custid 순으로 정렬
select *
	from customer, orders
    where customer.custid=orders.custid
    order by customer.custid;
select *
	from customer inner join orders
    on customer.custid=orders.custid
    order by customer.custid;
    
-- 고객별로 주문한 제품 총 구매액을 고객별로 정렬
-- 실행 결과(고객이름, 총 구매액)
select custname, SUM(price*amount) as 'total_price' 
	from customer inner join orders
    on customer.custid=orders.custid
    group by custname;
    
-- < 서브 쿼리(부속 질의) >
-- : SQL문 내에 또 다른 SQL 문 작성
-- : select 문의 where 절에 또 다른 테이블 경과를 이용해서 다시 select 문을 괄호로 묶는다!
-- SELECT ~ FROM ~ WHERE ( SELECT ~ FROM ~~);
select * from orders;
-- STEP 1. 주문 금액이 가장 큰 주문 가격은 얼마인가?
select MAX(price*amount) from orders;
-- STEP 2. 주문금액이 가장 큰 주문에 대한 주문아이디, 고객아이디, 상품명 조회
select orderid, custid, prodname from orders where price*amount =10000;
-- STEP 3. 서브 쿼리를 이용해 두 SQL 문을 하나로 합치기
select orderid, custid, prodname from orders where price * amount =(select max(price*amount) from orders);

-- 주문 이력이 있는 고객 조회
select custname from customer where custid in (select custid from orders);

-- <left outer join, left join>
-- : 첫 번째 테이블을 기준으로 두번째 테이블을 조합하는 join
-- 테이블A LEFT JOIN 테이블B ON 조인조건
-- LEFT(왼쪽) 테이블의 것은 모두 출력이 됨!!
-- 조인 순서가 중요!!
-- ON 조건을 불만족시; 테이블 A 속성 값은 그대로 가져오고, 테이블 B 속성 값은 NULL;
use smartfactory;

SELECT * from authors; -- 3 명
select * from books; -- 4권


-- books 테이블에 데이터 추가
-- 책아이디: 5
-- 제목: Lucky Day
-- 작가아이디: NULL
-- 출판일자: 2023-03-01


insert into books values (6,NULL,'Lucky Day','2024-03-01');
delete from books where book_id = 6;

-- inner join (books, authors)
select * from books inner join authors on books.author_id = authors.author_id;
-- books 테이블에 author_id가 NULL이었던 행은 제외되고 출력

-- left join (books, authors)
select * from books left join authors on books.author_id = authors.author_id;
select * from authors left join books on books.author_id = authors.author_id;


insert into authors values (4,'Anthony','Lee',NULL);




