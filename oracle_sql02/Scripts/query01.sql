/*
 * - DML : 데이터 조작어, INSERT(테이블에 데이터 추가), UPDATE(테이블의 데이터 수정), DELETE(테이블의 데이터 삭제) 
 *         SELECT(DQL 로 분류하는 경우도 있음)
 * - DDL : 데이터 정의어, CAREATE(객체 생성),  ALTER(객체 수정), DROP(객체 삭제)
 * - TCL : 트랜젝션 제어어, COMMIT(지금까지의 변경 내용 저장), ROLLBACK(이전 내역으로 되돌림)
 */


/*
 * DDL
 *    - 데이터 정의어로 데이터를 저장하고 다루기 위한 객체를 
 *      생성하고(CREATE) 수정하고(ALTER) 삭제(DROP)하는 구문을 말한다.
 *    - ORACLE 에서 사용하는 객체들로는 TABLE, VIEW, SEQUENCE, USER, 
 *      PROCEDUAL, FUNCTION 등이 있다.
 */

/*
 * CREATE TABLE
 *    - 테이블 객체를 생성하기 위한 구문
 * 
 * CREATE TABLE <테이블명> ( 
 *        <컬럼명> <데이터타입> [제약조건]
 *      , <컬럼명> <데이터타입> [제약조건]  --> [] <- 생략가능/<> <- 필수
 *      ....
 * );
 * 
 * 데이터 타입
 *    CHAR(크기)         : 고정 크기(바이트) 문자 데이터
 *    CHAR(크기 CHAR)    : 문자를 기준으로 크기를 설정
 *    VARCHAR2(크기)     : 가변 크기(바이트) 문자 데이터, 최대 4000 바이트 저장가능, 한글은 3 바이트 
 *    VARCAHR2(크기 CHAR): 문자를 기준으로 크기를 설정
 *    NUMBER            : 숫자 데이터(최대 40자리)
 *    NUMBER(길이)       : 숫자 데이터, 길이 지정 가능
 *    NUMBER(길이, 자릿수) : 숫자 데이터, 소수점 자릿수 까지 지정
 *    DATE              : 날짜 데이터
 *    TIMESTAMP         : 타임스탬프 데이터
 *    LOP               : 가변길이 바이너리 데이터, 최대 2GB 까지 저장 가능
 *    LONG              : 가변길이 문자 데이터, 최대 2GB 까지 저장 가능
 *    BLOB              : 대용랑 데이터 저장용 객체, 4GB 까지 저장 가능 (바이너리 데이터)
 *    CLOB              : 대용량 데이터 저장용 객체, 4GB까지 저장 가능 (문자 데이터)
 * 
 * 제약 조건
 *    NOT NULL    : NULL 데이터 저장을 허용하지 않음
 *    UNIQUE      : 중복값 저장을 허용하지 않음, NULL은 허용
 *    PRIMARY KEY : NULL, 중복값 저장을 모두 허용하지 않음(Record의 고유 식별값으로 사용하기 위해)
 *    FOREIGN KEY : 참조하는 테이블의 컬럼의 값이 존재하면 허용(외래키 : 다른 테이블의 값을 참조하여 관계를 형성)
 *    CHECK       : 지정한 값만 저장할 수 있음
 *    DEFAULT     : 기본값을 설정하여 데이터 추가 작업에 누락이 되어 있어도 기본값이 저장되게 한다.
 *                  (제약 조건은 아니지만 제약조건이 작성되는 부분에 사용되어 여기에 작성함)
 * 
 * 위의 제약 조건을 위반하는 데이터 추가/수정/삭제 작업이 이루어 지는 경우 "제약조건 위반" 이라는 에러가 발생하게 된다.
 * 이로 인해 데이터에 대한 무결성 보장을 수행할 수 있게 된다.
 * 
 * 제약 조건 작성 방법
 *    - 컬럼 레벨  : 컬럼명, 데이터 타입 옆에 작성하는 방법
 *                 기본키, 유일키, 외래키, NOT NULL, CHECK, DEFAULT 작성가능
 *    - 테이블 레벨 : 컬럼명, 데이터 타입을 작성 후 동일 위치상에 작성하는 방법
 *                 기본키, 유일키, 외래키, CHECK 작성 가능
 */

CREATE TABLE TEST1_T (
       COL_NAME1 NUMBER            CONSTRAINT TEST1_T_COL_NAME1_PK PRIMARY KEY
     , COL_NAME2 CHAR(10 CHAR)     CONSTRAINT TEST1_T_COL_NAME2_CK CHECK(COL_NAME2 IN ('A', 'B', 'C'))
     , COL_NAME3 VARCHAR2(10 CHAR) CONSTRAINT TEST1_T_COL_NAME3_FK REFERENCES REF_T(REF_COL1) ON DELETE CASCADE
     , COL_NAME4 DATE              DEFAULT(SYSDATE)
     , COL_NAME5 VARCHAR(10 CHAR)  CONSTRAINT TEST1_T_COL_NAME5_UK UNIQUE
     , COL_NAME6 VARCHAR(10 CHAR)  NOT NULL
);

CREATE TABLE TEST2_T (
       COL_NAME1 NUMBER
     , COL_NAME2 CHAR(10 CHAR)
     , COL_NAME3 VARCHAR(10 CHAR)
     , COL_NAME4 DATE             DEFAULT(SYSDATE)
     , COL_NAME5 VARCHAR(10 CHAR)
     , COL_NAME6 VARCHAR(10 CHAR) NOT NULL
     , CONSTRAINT TEST2_T_COL_NAME1_PK PRIMARY KEY(COL_NAME1)
     , CONSTRAINT TEST2_T_COL_NAME2_CK CHECK(COL_NAME2 IN('A', 'B', 'C'))
     , CONSTRAINT TEST2_T_COL_NAME3_FK FOREIGN KEY(COL_NAME3) REFERENCES REF_T(REF_COL1)
     , CONSTRAINT TEST2_T_COL_NAME5_UK UNIQUE(COL_NAME5)
);

CREATE TABLE REF_T(
       REF_COL1 VARCHAR2(10 CHAR) PRIMARY KEY
     , COL2 NUMBER
);

SELECT * FROM TEST1_T;
SELECT * FROM REF_T;

SELECT * FROM USER_ALL_TABLES WHERE TABLE_NAME = 'TEST1_T';
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TEST1_T';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEST1_T';

INSERT INTO TEST1_T VALUES(1, 'C', 'A', TO_DATE(20221114));
INSERT INTO TEST1_T(COL_NAME1, COL_NAME2, COL_NAME3) VALUES(1, '1', '1');
INSERT INTO TEST1_T VALUES(1, NULL, NULL, DEFAULT);
-- INSERT INTO TEST1_T VALUES(2, '한글데이터', '한글데이터를입력해봅니다', NULL);

INSERT INTO REF_T VALUES('A', 10);

DROP TABLE TEST1_T;
DROP TABLE REF_T;

DELETE FROM TEST1_T WHERE COL_NAME3 = 'A';
DELETE FROM REF_T WHERE REF_COL1 = 'A';

/*
 * ALTER TABLE : 생성한 테이블의 이름을 변경하거나 컬럼명, 데이터 타입, 제약조건을 수정할 때 사용
 *               테이블에 데이터가 저장되어 있는 경우 수정 작업이 안될 수 있다.(데이터 타입)
 */
CREATE TABLE TEST3(
       COL1 NUMBER
     , COL2 CHAR(10)
     , COL3 VARCHAR2(10)
     , COL4 DATE
     , COL5 VARCHAR2(10)
     , COL6 VARCHAR2(10)
);

ALTER TABLE TEST3 RENAME TO TEST4;
SELECT * FROM USER_TABLES WHERE TABLE_NAME LIKE 'TEST%';

ALTER TABLE TEST4 RENAME COLUMN COL1 TO ID;
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TEST4';

ALTER TABLE TEST4 ADD COL7 VARCHAR(20);
ALTER TABLE TEST4 MODIFY COL7 VARCHAR(30);
ALTER TABLE TEST4 DROP COLUMN COL7;
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TEST4';

ALTER TABLE TEST4 ADD CONSTRAINT TEST4_PK PRIMARY KEY(ID);
ALTER TABLE TEST4 ADD CONSTRAINT TEST4_COL2_UK UNIQUE(COL2);
ALTER TABLE TEST4 ADD CONSTRAINT TEST4_COL3_FK FOREIGN KEY(COL3) REFERENCES REF_T(REF_COL1);
ALTER TABLE TEST4 MODIFY COL4 DEFAULT(SYSDATE);
ALTER TABLE TEST4 MODIFY COL5 CONSTRAINT TEST4_COL5_NN NOT NULL;
ALTER TABLE TEST4 MODIFY COL6 CONSTRAINT TEST4_COL6_CK CHECK(COL6 IN ('A', 'B'));
ALTER TABLE TEST4 RENAME CONSTRAINT TEST4_PK TO TEST4_ID_PK;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEST4';

ALTER TABLE TEST4 DROP CONSTRAINT TEST4_ID_PK;
ALTER TABLE TEST4 DROP CONSTRAINT TEST4_COL2_UK DROP CONSTRAINT TEST4_COL3_FK;
ALTER TABLE TEST4 DROP CONSTRAINT TEST4_COL5_NN DROP CONSTRAINT TEST4_COL6_CK;
ALTER TABLE TEST4 MODIFY COL4 DATE DEFAULT NULL;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TEST4';
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TEST4';

/*ALTER TABLE 테이블명 DROP COLUMN 컬럼명 --> 컬럼 삭제 */


/*
 * 테이블 컬럼에 주석(Comment) 적용하기.
 */
CREATE TABLE TEST5(
       COL1 NUMBER
     , COL2 VARCHAR2(10)
);

COMMENT ON COLUMN TEST5.COL1 IS '컬럼에 주석을 설정 합니다.';
COMMENT ON COLUMN TEST5.COL2 IS '이 컬럼은 문자 10 Byte를 저장할 수 있습니다.';

SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'TEST5';