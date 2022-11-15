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
    point int default 0,
	grade varchar(40),
    visited int default 0,
    tel varchar(100),
	address varchar(100) not null,
	email varchar(300),
	birth varchar(100),
	regdate datetime default now()
);
    
    
    
DROP TABLE user;    
    
SELECT * FROM user;

CREATE TABLE pic(
NO INT PRIMARY KEY AUTO_INCREMENT,
tourno VARCHAR(20) NOT NULL,
picname VARCHAR(100) NOT NULL,
pos VARCHAR(300)
);

CREATE TABLE tour(
no INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(20) NOT NULL,
content VARCHAR(1000) NOT NULL,
file1 VARCHAR(100),
filename VARCHAR(100)
);

DROP TABLE tour;

COMMIT;