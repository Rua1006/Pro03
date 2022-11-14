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