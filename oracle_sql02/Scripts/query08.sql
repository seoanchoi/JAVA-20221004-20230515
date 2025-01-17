
 /* 가계부 작성을 위한 테이블을 생성하고 데이터를 추가 하세요.
 * 
 * 가계부 테이블에는 ID, 입금/출금구분, 금액, 날짜, 지출구분, 비고 정보가 저장될 수 있도록 합니다.
 *    - ID는 레코드를 식별하기 위한 식별 값으로 사용합니다.
 *    - 입금/출금구분은 입금의 경우 'I', 출금의 경우 'O'로 사용합니다.
 *    - 지출구분은 식비, 교통비, 통신비, 물품구입비 등 정해진 항목안에서 사용할 수 있게 합니다.
 *      정해진 항목안에서 사용할 수 있도록 지출구분 테이블을 별도로 만들어 참조할 수 있게 합니다.
 *    - 비고에는 지출구분으로 작성할 수 없는 좀 더 상세한 내용을 작성하기 위해 사용합니다.
 */ 

CREATE TABLE 가계부(
       ID      NUMBER	CONSTRAINT 가계부_ID_PK    PRIMARY KEY
     , 입출구분  CHAR(1)	CONSTRAINT 가계부_입출구분_CK CHECK(입출구분 IN ('I', 'O'))
     , 금액     NUMBER	DEFAULT(0)
     , 날짜     DATE	    DEFAULT(SYSDATE)
     , 지출     CHAR(5)  CONSTRAINT 가계부_지출구분_FK REFERENCES 지출구분(CODE)
     , 비고     VARCHAR2(100 CHAR)
);

SELECT * FROM 가계부;

 /* 지출구분 테이블에는 CODE, 항목 정보가 저장될 수 있도록 합니다.
 *    - CODE 는 지출항목에 대응할 수 있는 5자리 영문자값으로 사용합니다.
 *    - 항목에는 식비, 교통비, 통신비 등 정해진 값을 작성합니다.
 */
CREATE TABLE 지출구분(
       CODE CHAR(5)CONSTRAINT 지출구분_입출구분_CK PRIMARY KEY
     , 항목 VARCHAR(50 CHAR) CONSTRAINT 지출구분_항목_NN NOT NULL
);
INSERT INTO 지출구분 VALUES('000A', '급여');
INSERT INTO 지출구분 VALUES('000B', '교통비');
INSERT INTO 지출구분 VALUES('000C', '통신비');
INSERT INTO 지출구분 VALUES('000D', '식비');
INSERT INTO 지출구분 VALUES('000E', '물품구입비');

SELECT * FROM 지출구분;



/*  최근 1년간의(월마다 최소 5개 데이터를 뽑아서) 지출 내역을 참고하여 데이터를 추가해 봅니다.
 */
INSERT INTO 가계부 VALUES(1, 'O', 12000, TO_DATE('20220101'), '000D', NULL);
INSERT INTO 가계부 VALUES(2, 'I', 2500000, TO_DATE('20220115'), '000A', NULL);
INSERT INTO 가계부 VALUES(3, 'O', 75000, TO_DATE('20220120'), '000B', NULL);
INSERT INTO 가계부 VALUES(4, 'O', 55000, TO_DATE('20220120'), '000C', NULL);
INSERT INTO 가계부 VALUES(5, 'O', 5500, TO_DATE('20220121'), '000E', '종이컵(소) 30개');

SELECT * FROM 가계부;

 *  모든 데이터를 추가 후에는 다음의 작업을 추가로 진행 합니다.
 *    1. 월별 지출액 합계 구하기.
 *    2. 월별로 가장 많이 지출하는 항목이 무엇인지 구하기. (월별 지출 항목별 전체 합계를 구하세요.)
 *    3. 고정지출비 테이블을 별도로 생성하여 식비, 교통비, 통신비에 해당하는 항목들만 따로 저장하기.
 *    4. 통신비로 추가한 항목을 세분화하여 통신비(기기값) 항목을 새로 추가하고 모든 통신비에서 통신비(기기값)에 
 *       해당하는 비용을 따로 추가하도록 합니다.(기존 통신비에는 통신비(기기값)에 해당하는 금액을 제합니다. )
 *       정해진 기기값이 없으면 통신비의 40%가 기기값인 것으로 하세요.
 */
CREATE TABLE 가계부(
       ID NUMBER		CONSTRAINT 가계부_ID_PK PRIMARY KEY(ID) 
     , 입출구분 CHAR(1)	CONSTRAINT 가계부_입출구분_CK CHECK(입출구분 IN ('I', 'O'))
     , 금액 NUMBER		DEFAULT(0)
     , 날짜 DATE		    DEFAULT(SYSDATE)
     , 지출 CHAR(5)	    CONSTRAINT 가계부_지출구분_FK REFERENCES 지출구분(CODE)
     , 비고 VARCHAR(100 CHAR)
);

INSERT INTO 가계부 VALUES(1, '출', 5000, TO_DATE('20221116'), '식비',  '비고');
INSERT INTO 가계부 VALUES(2, '출', 1250, TO_DATE('20221116'), '교통비', '비고');
INSERT INTO 가계부 VALUES(3, '출', 100000, TO_DATE('20221117'), ' 통신비', '비고');

SELECT * FROM 가계부;
UPDAT 가계부 SET 금액 = 

DROP TABLE 가계부;
DROP TABLE 지출구분;





























DROP TABLE 가계부;
