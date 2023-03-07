-- 고객 테이블의 모든 정보를 조회
select * from customer;

-- 주문 테이블의 모든 정보를 조회
select * from orders;

-- 모든 고객의 고객아이디를 검색
select custid from customer;

-- 모든 고객의 고객아이디와 생년월일을 검색
select custid, birth from customer;

-- 모든 고객의 생년월일과 고객아이디를 검색 (순서 있음)
select birth, custid from customer;

-- 모든 고객의 아이디, 주소, 전화번호, 이름, 생년월일 검색
select custid, addr, phone, custname, birth from customer;

-- (와일드카드 사용) 모든 고객의 아이디, 이름, 주소, 전화번호, 생년월일 검색
select * from customer;
-- *: All, 모든 것을 의미

-- 고객 테이블에 있는 모든 주소를 검색(중복 포함된 결과)
select addr from customer;

-- 고객 테이블에 있는 모든 주소를 검색(중복 포함되지 않은 결과)
select distinct addr from customer;

-- <where 절 >

-- 비교: =, <, <=, >, >=
-- 고객 이름이 강해린인 고객을 검색
select custid from customer where custname = '강해린';
select * from customer where custname = '강해린';

-- 제품 가격이 4000원 이상인 주문 내역(모든 속성)을 검색
select * from orders where price >= 4000;

-- 범위: between a and b
-- 1995년 이상 2000년 이하 출생 고객 검색
select * from customer where birth between '1995-01-01' and '2000-12-31';
select * from customer where birth >= '1995-01-01' and birth <= '2000-12-31';


-- 집합(in, not in)
-- 주소가 서울 혹은 런던인 고객 검색
select * from customer where addr in('대한민국 서울', '영국 런던');
select * from customer where addr = '대한민국 서울' or addr = '영국 런던';
select * from customer where addr like '대한민국 서울' or addr like '영국 런던';

-- 주소가 서울 혹은 런던이 아닌 고객 검색
select * from customer where addr not in('대한민국 서울', '영국 런던');
select * from customer where addr != '대한민국 서울' and addr != '영국 런던';
select * from customer where addr not like '대한민국 서울' and addr not like '영국 런던';

-- 패턴(like): 특정 패턴을 포함하는 데이터를 검색
select * from customer where addr like '로스엔젤레스';


-- smartfactory 데이터베이스 사용
use smartfactory;

-- 문장 == 쿼리(query)

--  데이터베이스 이름 규칙 
--  1. 소문자, 언더바
 