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
    
SELECT * FROM user;
