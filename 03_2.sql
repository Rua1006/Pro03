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
    
      
    
SELECT * FROM user;

CREATE TABLE pic(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20) NOT NULL,
	picname VARCHAR(100) NOT NULL,
	pos int
);

DROP TABLE pic;


SELECT * FROM pic;



CREATE TABLE tour(
	no INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20),
	cate VARCHAR(20),
	place VARCHAR(100),
	COMMENT1 VARCHAR(1000),
	COMMENT2 VARCHAR(1000)
);

CREATE TABLE qna(
	no int primary key auto_increment,
   title varchar(100) not null,
   content varchar(1000) not null,
   author varchar(20) not null,
   resdate datetime default now(),
   lev int default 0,            
   parno int not null,          
   sec char(1)      
);

INSERT INTO qna(title, content, author,parno,sec) VALUES ('테스트','테스트내용','admin','1','1');

alter table qna add column visited int default 0; 

SELECT * FROM qna;

CREATE TABLE impress(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	cate VARCHAR(20),
	tourno VARCHAR(20),
	id VARCHAR(30),
	content VARCHAR(1000),
	star DOUBLE,
	imgSrc VARCHAR(150),
	regdate DATETIME DEFAULT NOW()
);

INSERT INTO impress(cate, tourno, id, content, star, imgSrc) VALUES('A','1','bskang','테스트내용','1.5','image1.jpg');

SELECT * FROM impress;

SELECT 
	a.no, 
	a.tourno, 
	a.cate, 
	a.place, 
	a.comment1, 
	a.comment2, 
	b.picname, 
	b.pos 
FROM 
	tour a 
	inner join pic b on a.tourno=b.tourno 
WHERE 
	a.cate="A" 
	and b.pos=1;

SELECT 
	a.no, 
  	a.tourno, 
  	a.cate, 
  	a.place, 
  	a.comment1, 
  	a.comment2, 
  	b.picname, 
  	b.pos 
FROM 
  	(select * from tour limit 1) a 
  	inner join pic b on a.tourno = b.tourno 
WHERE 
  	a.cate = "A" 
  	and b.pos = 1;
  
  
SELECT 
  	a.no, 
  	a.tourno, 
  	a.cate, 
  	a.place, 
  	a.comment1, 
  	a.comment2, 
  	b.picname, 
  	b.pos 
FROM 
  tour a 
  inner join (select * from pic limit 1) b on a.tourno = b.tourno 
WHERE 
  a.cate = "A" 
  and b.pos = 1;

SELECT * FROM tour;

DROP TABLE tour;

COMMIT;