-- DML: SELECT, INSERT, UPDATE, DELETE
use smartfactory;
CREATE TABLE new_customer (
	custid CHAR(10) PRIMARY KEY,
    custname VARCHAR(10) NOT NULL, 
	addr CHAR(10) NOT NULL,
    phone CHAR(11),
    birth DATE
);
DESC new_customer;
use new_prac;
DROP TABLE IF EXISTS authors;
create table authors(
	author_id int not null primary key,
	first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);
DROP TABLE IF EXISTS books;
create table books(
	book_id int not null primary key,
    author_id int,
	title varchar(100),
    publication_date date,
    FOREIGN KEY(author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE
);
DROP TABLE IF EXISTS orders;
create table orders(
	order_id int not null primary key,
	customer_name varchar(50),
    book_id int,
    FOREIGN KEY(book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    order_date date
);
INSERT INTO authors VALUES 
(1,'J.K','Rowling','jkrowling@gmail.com'),
(2,'George R.R','Martin','grmartin@yahoo.com'),
(3,'Stephen','King','sking@hotmail.com');

DESC authors;
SELECT * FROM authors;

INSERT INTO books VALUES 
(1,1,'Harry Potter and the Philospher''s Stone','1997-06-26'),
(2,2,'A Game of Thrones','1996-08-06'),
(3,3,'The Shining','1977-01-28');

DESC books;
SELECT * FROM books;

INSERT INTO orders VALUES 
(1,'John Smith',1,'2022-02-15'),
(2,'Jane Doe',2,'2022-02-16'),
(3,'Bob Johnson',3,'2022-02-17');
DESC orders;
SELECT * FROM orders;
-- 1. author_id가 1인 작성자의 이메일을 jkrowling@yahoo.com으로 업데이트하는 SQL 문을 작성합니다.
update authors set email = 'jkrowling@yahoo.com' where author_id=1;

-- 2. books 테이블에서 book_id 2인 책을 삭제하는 SQL 문을 작성합니다.
delete from books where book_id=2;

-- 3. 다음 세부 정보가 포함된 새 책을 삽입하는 SQL 문을 작성합니다.
-- 책 ID: 4
-- 제목: 스탠드
-- 저자 ID: 3
-- 발행일자 : 1978-01-01
insert into books values (4,3,'스탠드','1978-01-01');

-- 4. book_id 1인 책의 출판 날짜를 1997-06-30으로 업데이트하는 SQL 문을 작성하십시오.
update books set publication_date = '1997-06-30' where book_id=1;

-- 5. 022-02-17 이전에 접수된 모든 주문을 삭제하는 SQL 문을 작성합니다.
SET sql_safe_updates=0;
delete from orders where order_date<'2022-02-17';

-- 6. 다음 세부 정보와 함께 새 주문을 삽입하는 SQL 문을 작성합니다.
-- 주문 ID: 4
-- 책 ID: 1
-- 고객 이름: 사라 존슨
-- 주문일자 : 2022-02-18
insert into orders values (4,'사라 존슨',1,'2022-02-18');


-- 7. order_id가 1인 주문의 고객 이름을 Jack Smith로 업데이트하는 SQL 문을 작성합니다.
update orders set customer_name = 'Jack Smith' where order_id=1;


-- 8. 다음 세부 정보와 함께 새 작성자를 삽입하는 SQL 문을 작성합니다.
-- 저자 ID: 4
-- 이름: 아가사
-- 성: 크리스티
-- 이메일: agatha.christie@example.com
insert into authors values (4,'아가사','크리스티','agatha.christie@example.com');


-- 9. author_id 2인 작성자의 성을 Martinez로 업데이트하는 SQL 문을 작성합니다.
update authors set  last_name = 'Martinez' where author_id=2;

-- 10. author_id 3인 저자가 쓴 모든 책을 삭제하는 SQL 문을 작성합니다.
delete from authors where author_id=3;


SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM orders;
-- < 추가 실습 >
-- 11. Stephen King이 쓴 모든 책의 제목과 발행일을 표시합니다.
select title, publication_date from books where author_id =  3; 

-- 12. 책을 쓴 저자의 이름을 표시합니다.
select first_name, last_name from authors where author_id in (select author_id from books);

-- 13. 각 저자가 쓴 책의 수를 표시합니다.
insert into books values(4,3,' haha','1985-05-12');
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS 'num_books'
FROM authors AS a, books AS b
WHERE a.author_id = b.author_id
GROUP BY a.author_id;
    
-- 14. 2022년 2월 16일 이후에 발생한 모든 주문에 대한 책 제목과 고객 이름을 표시합니다.
select title, customer_name
	from orders join books
    on books.book_id=orders.book_id and order_date>='2022-02-16';

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
    
-- < UPDATE >
update new_customer set addr = '대한민국 서울' where custid = 'apple';
update new_customer set addr = '대한민국 서울' where custid like '%y';

SELECT * FROM new_customer;
SELECT * FROM new_orders;

-- < DELETE > 
delete from new_customer where custid='happy';
-- 외래키 연결되어 있는 경우, 연쇄 삭제
delete from new_customer where custid='kiwi';

