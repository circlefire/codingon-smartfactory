-- < DCL >
-- Data Control Language
-- GRANT, REVOKE

use new_smartfactory;
select * from new_customer;

-- 현재 root 사용자만 존재
-- => 새로운 사용자(유저/계정) 추가(codee)
-- create user [계정명]@[접속경로] identified by [비밀번호];
create user 'codee'@'localhost' identified by '1234';

-- 새로 생성한 사용자 확인
show databases;
select user from mysql.user; -- mysql.user: mysql db의 user table

-- < GRANT >
-- : 권한 부여
-- grant [권한 유형] on [데이터베이스 이름].[테이블이름] to [계정명@접속경로] [with grant option];

-- ex. codee2 사용자에게 모든 데이터에 모든 테이블에 모든 권한 부여
-- 모든 권한 부여: GRANT all privileges
-- with grant option: 권한을 다른 사용자한테 부여 가능하게 하는 옵션
	-- root -> codee2
GRANT all privileges on *.* to 'codee'@'localhost' with grant option;

Create user 'lucky'@'localhost' identified by '1234';


-- GRANT [권한 유형] ON [데이터베이스이름].[테이블이름] 
-- GRANT ALL PRIVILEGES ON [데이터베이스이름].* 
-- => 특정 데이터베이스의 모든 테이블에 / 모든 권한 부여 
-- GRANT ALL PRIVILEGES ON [데이터베이스이름].[테이블이름] 
-- => 특정 데이터베이스의 특정 테이블에 / 모든 권한 부여 
-- GRANT SELECT ON [데이터베이스이름].[테이블이름] 
-- => 특정 데이터베이스의 특정 테이블에 / SELECT 권한 부여 
-- GRANT SELECT, INSERT ON [데이터베이스이름].[테이블이름] 
-- => 특정 데이터베이스의 특정 테이블에 / SELECT, INSERT 권한 부여
 
CREATE USER 'happy'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON new_smartfactory.* TO 'happy'@'localhost' WITH GRANT OPTION;

alter user 'codee'@'localhost' identified with mysql_native_password by '4321';
flush privileges;

-- < REVOKE >
-- : 권한 박탈alter
-- REVOKE [권한 유형] ON [데이터베이스이름].[테이블이름] FROM [계정명@접속경로];
REVOKE delete on *.* from 'codee'@'localhost'; -- select 권한 박탈
revoke all on *.* from 'codee'@'localhost'; -- 모든 권한 박탈
-- 계정 삭제
DROP USER 'codee'@'localhost';
flush privileges; -- 새로고침해야 반영!