/*
 * SEQUENCE 객체
 *    - 번호 발생기 객체
 *    - 정수값을 순차적으로 생성하는 객체
 *    - PRIMARY KEY 로 사용하는 번호(ID)등에 사용하여 정수값을 생성하기 위한 용도로 많이 사용
 */
CREATE SEQUENCE SEQ1
	 START WITH 10 /*10부터 증가*/
   INCREMENT BY 10/*10단위로 증가*/
       MAXVALUE 100
       MINVALUE -100   
          CACHE 10
          CYCLE; /*미리 생성할 정수값 수량*/

ALTER SEQUENCE SEQ1
  INCREMENT BY 5
      MAXVALUE 250
      MINVALUE -100 
       NOCYCLE
       NOCACHE;
          
DROP SEQUENCE SEQ1;

CREATE SEQUENCE SEQ_TEMP; 
CREATE TABLE TEMP(
       ID NUMBER PRIMARY KEY
);

INSERT INTO TEMP VALUES(SEQ_TEMP.NEXTVAL);
UPDATE TEMP
   SET ID = SEQ_TEMP.NEXTVAL
WHERE ID = 5;
 
SELECT * FROM TEMP;

/*
 * NEXTVAL, CURRVAL 을 사용할 수 있는 명령어
 *    1. SELECT문(서브쿼리 아님)
 *    1. INSERT문의 VALUES 절
 *    3. INSERT문의 SELECT 절
 *    4. UPDATE문의 SET 절
 * 
 * NEXTVAL, CURRVAL 을 사용할 수 없는 명령어
 *    1. VIEW를 사용하는 SELECT
 *    2. DISTINCT 키워드가 있는 SELECT
 *    3. GROUP BY, HAVING , OREDER BY 가 있는 SELECT
 *    4. SELECT, DELETE, UPDATE의 서브쿼리
 *    5. CREATE TABLE, ALTER TABLE 에서 사용하는 DEFAULT 값
 */


 
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.CURRVAL FROM DUAL; /*현재 정수값 가져와라*/
-- CREATE 하자마자 커런트 하면 안됨, 넥스트밸류 하고나서 커런트 밸류 해야됨

