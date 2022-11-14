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
	cusId varchar(20) primary key,
	cusPw varchar(1000) not null,
	cusName	varchar(50) not null,
	address	varchar(100) not null,
	tel varchar(100),	
	regDate	datetime default now(),
	point int default 0,		
	level int default 0,
	visited int default 0
    );
    
    
INSERT INTO user(cusId, cusPw, cusName, address, tel) VALUES("admin", "12345", "관리자", "관리자", "010-0000-0000");
    
SELECT * FROM user;

COMMIT;