/*
 * 지출 내역서(가계부)를 위한 테이블을 만들어 본다.
 *    - 테이블 이름은 '지출내역서' 로 한다.
 *    - 컬럼은 ID, 날짜, 출입구분, 금액, 비고 로 만들어 사용한다.
 *    - 비고의 경우 한글 100자 까지 저장 가능하게 한다.
 *    - 출입구분은 '출', '입' 만 사용가능하게 한다.
 *    - ID 는 해당 Record 를 식별하기 위한 식별자로 사용할 것이다. 
 */
CREATE TABLE 지출내역서 (
       ID NUMBER				/* CONSTRAINT 지출내역서_ID_PK PRIMARY KEY(ID) */
     , 날짜 DATE					
     , 출입구분 CHAR(3)			/* CONSTRAINT 지출내역서_출입구분_CK CHECK (출입구분 IN ('출', '입')) */
     , 금액 NUMBER
     , 비고 VARCHAR(100 CHAR)
     /* , CONSTRAINT 지출내역서_ID_PK PRIMARY KEY(ID) */
     /* , CONSTRAINT 지출내역서_출입구분_CK CHECK(출입구분 IN ('출', '입')) */
); 

SELECT * FROM 지출내역서;

ALTER TABLE 지출내역서 ADD ID CONSTRAINT 지출내역서_ID_PK PRIMARY KEY(ID);
ALTER TABLE 지출내역서 MODIFY 출입구분 CONSTRAINT 지출내역서_출입구분_CK CHECK(출입구분 IN ('출', '입'));


DROP TABLE 지출내역서;
