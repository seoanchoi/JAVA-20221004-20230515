DROP TABLE VISIT_T;

CREATE TABLE VISIT_T(
	  USERID    VARCHAR2(20) REFERENCES USER_T(USERID)
    , CONTEXT   VARCHAR2(1000) NOT NULL
	, CREATEDATE  DATE DEFAULT(SYSDATE)
);






UPDATE VISIT_T 
   SET nickname = 'nickname'
     , context = 'contesxt'
 WHERE on = 1;






CREATE TABLE BOOKMARK_T(
	  id NUMBER PRIMARY KEY
	, USERID VARCHAR(20) REFERENCES USER_T(USERID)
	, url VARCHAR2(100)
	, name VARCHAR2(100)
);



INSERT INTO BOOKMARK_T VALUES(1, 'asdf', 'https://naver.com', '네이버');
INSERT INTO BOOKMARK_T VALUES(2, 'asdf', 'https://google.com', '구글');

INSERT  INTO BOOKMARK_T VALUES(3, 'jkl', 'https://nate.com', '네이트');
INSERT  INTO BOOKMARK_T VALUES(4, 'jkl', 'https://daum.net', '다음');

UPDATE BOOKMARK_T 
   SET url = 'url'
     , name = 'name'
 WHERE ID = 1;

DROP TABLE BOOKMARK_T;


SELECT	id, userid, url, name FROM BOOKMARK_T;

SELECT max(id) + 1 FROM BOOKMARK_T;







CREATE TABLE USER_T(
	USERID VARCHAR2(20) PRIMARY KEY
	, PASSWORD VARCHAR2(20) NOT NULL
	, EMAIL VARCHAR2(100)
);


SELECT * FROM USER_T;



-- Top N 조회 쿼리 (ex. to5, top10 등)

SELECT * FROM ( 
	SELECT ROWNUM AS N
		 , USERID
		 , CONTEXT
		 , CREATEDATE
	FROM (SELECT * FROM VISIT_T ORDER BY CREATEDATE DESC)
	)
WHERE N BETWEEN 16 AND 20;

SELECT COUNT(*) FROM VISIT_T;



/*SELECT ROWNUM AS 순위   --행 번호, 동순위여도 123으로 정해짐
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM (SELECT EMPLOYEE_ID
             , FIRST_NAME
             , LAST_NAME
             , SALARY
          FROM EMPLOYEES
         ORDER BY SALARY DESC)
 WHERE ROWNUM <= 10;*/






/*
 * 공지사항이 있는 게시판
 * btype의 값이 N인경우 공지사항, B인 경우 일반 게시물로 합니다.
 */
CREATE TABLE BOARD_T(
	  id NUMBER PRIMARY KEY
	, btype VARCHAR(1) CHECK(btype IN ('N', 'B')) NOT NULL
	, title VARCHAR(500) NOT NULL
	, context VARCHAR2(4000) NOT NULL
	, writer VARCHAR2(20) REFERENCES USER_T(USERID)
	, createDate DATE DEFAULT(SYSDATE)
	, updateDate DATE DEFAULT(SYSDATE)
	, viewCnt NUMBER DEFAULT(0)
);
DROP TABLE BOARD_T;

CREATE SEQUENCE BOARD_S NOCACHE;
DROP SEQUENCE BOARD_S;



INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트1', '게시판 글 작성 테스트 입니다.1'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트2', '게시판 글 작성 테스트 입니다.2'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트3', '게시판 글 작성 테스트 입니다.3'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트4', '게시판 글 작성 테스트 입니다.4'
					, 'other', DEFAULT, DEFAULT, DEFAULT);				
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트5', '게시판 글 작성 테스트 입니다.5'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'B', '게시글 테스트6', '게시판 글 작성 테스트 입니다.6'
					, 'other', DEFAULT, DEFAULT, DEFAULT);				
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트7', '공지글 글 작성 테스트 입니다.7'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트8', '공지글 글 작성 테스트 입니다.8'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트9', '공지글 글 작성 테스트 입니다.9'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트10', '공지글 글 작성 테스트 입니다.10'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트11', '공지글 글 작성 테스트 입니다.11'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트12', '공지글 글 작성 테스트 입니다.12'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트13', '공지글 글 작성 테스트 입니다.13'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트14', '공지글 글 작성 테스트 입니다.14'
					, 'other', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD_T VALUES(BOARD_S.NEXTVAL, 'N', '공지글 테스트15', '공지글 글 작성 테스트 입니다.15'
					, 'other', DEFAULT, DEFAULT, DEFAULT);				

				
				
DELETE FROM BOARD_T;
SELECT * FROM USER_T;
SELECT * FROM BOARD_T;

SELECT id, title, writer, createDate, viewCnt
  FROM ( 
	SELECT ROWNUM AS N
		 , id, btype, title, writer, createDate, viewCnt
	FROM (SELECT id, btype, title, writer, createDate, viewCnt FROM BOARD_T ORDER BY BTYPE DESC, ID)
	)
WHERE N BETWEEN 18 AND 32;

SELECT 

