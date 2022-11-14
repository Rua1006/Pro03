CREATE TABLE test(NAME VARCHAR(50), POINT INT);

INSERT INTO test VALUES("강병수",100);
INSERT INTO test VALUES("장다인",90);

SELECT * FROM test;

CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),
	content VARCHAR(1000),
	regdate DATETIME DEFAULT NOW(),
	visited INT DEFAULT 0
	);
	
DESC notice;

INSERT INTO notice(title, content) VALUES("테스트","테스트내용");
SELECT * FROM notice;

create table user(

	id varchar(20) primary key, 

	pw varchar(100) not null,

	name varchar(50) not null,

	address varchar(100) not null,

	birth varchar(100),

	tel varchar(100),

	regdate datetime default now(),

	point int default 0,

	level int default 0,

	visited int default 0

);
    
    
    
DROP TABLE user;    
INSERT INTO user(cusId, cusPw, cusName, address, tel) VALUES("admin", "12345", "관리자", "관리자", "010-0000-0000");
    
SELECT * FROM user;

COMMIT;