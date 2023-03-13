-- <실습: DDL 이용해 테이블 생성하기>
use smartfactory;
drop table member;
create table member(
	id varchar(20) not null primary key,
    name varchar(5) not null,
    age int,
    gender varchar(2) not null,
    email varchar(50),
    promotion varchar(2) default 'x' 
);
desc member;

-- < 실습 DDL 이용해 테이블 구조 수정하기 >
-- alter; 잘 안쓰이지만 지금은 값이 안들어가있기 때문에 사용해도 무방
-- id 컬럼 값 형식 변경
alter table member modify id varchar(10);
alter table member change id id varchar(10);

desc member;
-- age 컬럼 삭제
alter table member drop age;

-- interest 컬럼 추가
alter table member add interest varchar(100);