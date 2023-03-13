-- DML: SELECT, INSERT, UPDATE, DELETE
use new_smartfactory;
CREATE TABLE new_customer (
	custid CHAR(10) PRIMARY KEY,
    custname VARCHAR(10) NOT NULL, 
	addr CHAR(10) NOT NULL,
    phone CHAR(11),
    birth DATE
);
DESC new_customer;

CREATE TABLE new_orders (
	orderid INT PRIMARY KEY AUTO_INCREMENT,
    custid CHAR(10) NOT NULL,
    prodname CHAR(6) NOT NULL,
    price INT NOT NULL,
    amount smallint NOT NULL,
    FOREIGN KEY(custid) REFERENCES new_customer(custid) ON UPDATE CASCADE ON DELETE CASCADE
);
DESC new_orders;
SELECT * FROM new_orders;
SELECT * FROM new_customer;

-- ctrl + shfit + enter : 드래그한 여러 행 동시 실행
INSERT INTO new_customer VALUES ('kiwi', '김키위', '대한민국 서울', '01012341234', '1990-03-17');
INSERT INTO new_customer VALUES ('apple', '이사과', '대한민국 포항', '01012344321', '1992-06-17');
INSERT INTO new_orders VALUES (NULL, 'kiwi', '프링글스', '3000', 5);
INSERT INTO new_orders VALUES (NULL, 'apple', '프링글스', '3000', 1);
INSERT INTO new_orders VALUES (NULL, 'kiwi', '홈런볼', '2000', 3);

-- < INSERT >
-- 1) 첫번째 방법: 긴 명령어 버전
INSERT INTO new_customer (custid, custname, addr, phone, birth) 
			values ('lucky', '강혜원', '미국 뉴욕', '01022223333', '2002-03-05');

-- 속성 순서를 바꿔서 추가하고 싶다면요?
-- 순서 바꿀 수 있음! 단, 속성명과 속성값 순서가 대응되어야 함
INSERT INTO new_customer (birth, custname, addr, phone, custid) 
			values ('2007-04-08', '이지은', '대한민국 부산', '01041231161', 'wow');
            
-- 2) 두번째 방법: 짧은 명령어 버전
INSERT INTO new_customer values ('happy', '최시은', '일본 오키나와', '01033331234', '1970-10-31');

-- 여러 고객 정보를 동시에 추가하고 싶으면 INSERT 문을 여러번 작성하면 되겠네요? -> yes 하지만 아래처럼하는것이 더 간편하다.
INSERT INTO new_customer values 
	('asdf', '강세희', '대한민국 부산', '01033331235', '2004-11-11'),
	('sdfg', '윤지성', '일본 도쿄', '01033331236', '1995-02-15'),
    ('dfgh', '이재은', '미국 뉴욕', '01033331237', '2004-06-07');