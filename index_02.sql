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
-- %: 0개 이상의 문자
-- _: 1개의 단일 문자
-- 주소가 '미국 로스앤젤레스'인 고객 검색
select * from customer where addr like '미국 로스앤젤레스';

-- 주소에 '미국'잉 포함되어 있는 고객 검색
-- 검출 가능한 케이스: '미국', '미국 ', '미국 워싱턴', '미국 로스앤젤레스', ...
select * from customer where addr like '미국%';
select * from customer where addr like '미국_'; -- 검출 가능한 케이스: '미국 ', '미국인', ... 등등 3글자만

select * from customer where custname like '_지%'; -- 두번째 글자가 '지'인 사람
select * from customer where custname like '%지%'; -- 글자에 '지'가 포함된 사람
select * from customer where custname like '%지_'; -- 뒤에서 두 번째 글자가 '지'인 사람
select * from customer where custname like '_지'; -- 이름이 2자이며, 마지막 글자가 '지'인 사람

-- 고객 이름 세번째 글자가 '수'인 고객 검색
select * from customer where custname like '__수%';

-- 복합 조건(and, or, not)
-- 주소지가 대한민국이고, 2000년 이후 출생 고객 검색
select * from customer where addr like '대한민국%' and birth >= '2000-01-01';
select * from customer where addr like '미국%' or addr like '영국%';
select * from customer where phone not like '%4';

-- < order by >
-- order by 절을 사용하지 않는 경우, pk 기준으로 정렬
select * from customer;

-- custname 속성을 기준으로 "오름차순" 정렬
select * from customer order by custname ;
-- custname 속성을 기준으로 "내림차순" 정렬
select * from customer order by custname desc;

-- order by & where 함께 사용
-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 검색
select * from customer order by addr desc where birth>= '2000-01-01';
select * from customer  where birth>= '2000-01-01' order by addr desc;
-- 아래 두 쿼리문의 결과는 상이함
select * from orders order by price, amount;
select * from orders order by amount, price;

-- < limit >
-- limit 형식: limit 시작, 개수 == limit 개수 offset 시작
-- 주의) limit에서 시작은 0임을 잊지말자!!
-- ex. limit 2 == limit 0,2 == limit 2 offset 0
-- 고객테이블 전체 정보를 조회하는데, 앞에 2건만 조회하고 싶은 경우
select * 
from customer 
limit 2;

-- 고객 테이블 전체 정보를 조회하는데, 두번째부터 여섯번째 행만 조회하고 싶은 경우
select * from customer limit 1,5;
select * from customer limit 5 offset 1;

-- 2000년 이후 출생 고객중에서 앞에 2건만 조회하고 싶은 경우
select * from customer where birth >= '2000-01-01' limit 2;

-- 2000년 이후 출생 고객중에서 뒤에 2건만 조회하고 싶은 경우
select * from customer where birth >= '2000-01-01' order by custid desc limit 2;

-- smartfactory 데이터베이스 사용
use smartfactory;

-- 문장 == 쿼리(query)

--  데이터베이스 이름 규칙 
--  1. 소문자, 언더바
 