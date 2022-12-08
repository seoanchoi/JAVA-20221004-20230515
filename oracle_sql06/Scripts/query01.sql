/*
 * PL/SQL
 *    - Procedural Language extension to SQL
 *    - SQL 문장에서 변수의 정의, 조건문, 반복문 등의 프로그래밍 언어에서
 *      지원하는 기능을 일부 지원하는 것
 * 
 * PL/SQL 구조
 * 
 * - DECLARE(생략 가능)
 *    변수 정의 영역 
 * 
 * - BEGIN
 *   END;
 *    실행 영역
 * 
 * - EXCEPTION(생략 가능)
 *   END; 
 *   / (DBeaver에서 작성하면 슬래쉬 안써도 됨)
 *    예외처리 영역
 */

BEGIN 
	DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');  /*PL/SQL 에서 지원하는 자바의 print.ln 같은 구문임*/
END; 
/*실행할 때 마다 출력이 쌓임, Output에서 우클릭 - 삭제 하면됨 
또는 설정 - 편집기 - SQL 편집기 - SQL실행 - Clear ouput log before execution 체크*/


/*DBeaver 에서는 적용 안됨 SQLplus 에서 출력기능을 사용하기 위해 필요함.*/
SET SERVEROUTPUT ON;



BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;



DECLARE
   x NUMBER := 10;
   y NUMBER := 20; /* :=  --> 변수에 값 할당 하는 기호*/
BEGIN
	DBMS_OUTPUT.PUT_LINE(x + y);
END;



DECLARE
   s1 VARCHAR2(10) := 'Hello';
   s2 CHAR(10) := 'PL/SQL';
BEGIN
	DBMS_OUTPUT.PUT_LINE(s1 || ' ' || s2);
END;


DECLARE
   n1 NUMBER;
   n2 NUMBER;
BEGIN
   n1 := 10;
   n1 := 20;			/*디클래어에서 선언만 해놓고 비긴에서 재할당*/
	DBMS_OUTPUT.PUT_LINE(n1 || ' ' || n2);
END;


DECLARE
   n1 NUMBER;
   n2 NUMBER;
BEGIN
   n1 := 10;
   n1 := 20;			/*디클래어에서 선언만 해놓고 비긴에서 재할당*/
	DBMS_OUTPUT.PUT_LINE(n1 + n2);
END;



/*
 * 조회 구문 사용하기
 */
DECLARE
    EMP_ID NUMBER;
    FNAME VARCHAR2(30);
    LNAME VARCHAR2(30);
BEGIN 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
	  INTO EMP_ID, FNAME, LNAME
	  FROM WEB_ADMIN.EMPLOYEES /*계정 안써주면 sqlplus에서 조회가 안됨*/
     WHERE EMPLOYEE_ID = :ID; /*:ID 실행하면 값 입력하는 창이 뜸 --> 100입력*//*SQLplus에서는 :대신 &입력*/
    DBMS_OUTPUT.PUT_LINE(EMP_ID || '|' || FNAME || '|' || LNAME);  /*+는 사용불가 ||으로 써야됨*/
END;




/*SQLplus에서 사용*/
DECLARE
    EMP_ID NUMBER;
    FNAME VARCHAR2(30);
    LNAME VARCHAR2(30);
BEGIN 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
	  INTO EMP_ID, FNAME, LNAME
	  FROM WEB_ADMIN.EMPLOYEES 
     WHERE EMPLOYEE_ID = &ID;   
    DBMS_OUTPUT.PUT_LINE(EMP_ID || '|' || FNAME || '|' || LNAME); 
END;




/*
 * IF 문 사용하기
 */
DECLARE
    NUM NUMBER;
BEGIN
	NUM := :NUM;
    IF(NUM > 10) THEN 
        DBMS_OUTP.PUT_LINE('변수 NUM 에 저장된 값은 10 보다 큽니다.');
    ELSIF(NUM = 10) THEN
        DBMS_OUTP.PUT_LINE('변수 NUM 에 저장된 값은 10 입니다.');
    ELSE
        DBMS_OUTP.PUT_LINE('변수 NUM 에 저장된 값은 10 보다 작습니다.');
    END IF;
END;




/* 반복문 사용하기
*/
BEGIN
	FOR N IN 1..5 LOOP   /*반복 범위를 설정*/
	    DBMS_OUTPUT.PUT_LINE(N);	
	END LOOP;
END;


BEGIN
	FOR N IN REVERSE 1..5 LOOP /*반복 범위 반대로 출력*/
	    DBMS_OUTPUT.PUT_LINE(N);	
	END LOOP;
END;


DECLARE
    NUM NUMBER := 0;
BEGIN
	LOOP
		NUM := NUM +1;
	    DBMS_OUTPUT.PUT_LINE(NUM);
		IF NUM > 5 THEN
		    EXIT;
		END IF;
	END LOOP;
END;



DECLARE
    NUM NUMBER := 0;
BEGIN
	WHILE NUM < 5 LOOP
	    NUM := NUM + 1;
		DBMS_OUTPUT.PUT_LINE(NUM);
	END LOOP;	
END;




/*
 * 테스트용 테이블을 생성 후 데이터 추가 / 수정 / 삭제 하기
 */
CREATE TABLE TEST1(
       ID NUMBER PRIMARY KEY
     , NAME VARCHAR2(30)
     , AGE NUMBER
);


DECLARE
    VID NUMBER;
    NAME VARCHAR2(30);
    AGE NUMBER;
    CNT NUMBER;
BEGIN
	VID := :ID;
    NAME := :NAME; /*디비버에서 작은 따옴표를 입력 창에 직접 입력할 것 PLSQL에서는 '&NAME'이 되기 때문에 필요 없음*/
    AGE :=  :AGE;
    SELECT COUNT(ID)
      INTO CNT
      FROM TEST1
      WHERE ID = VID;
    IF(CNT = 1) THEN
        DBMS_OUTPUT.PUT_LINE('동일한 ID 가 존재합니다.');
    ELSE
     	INSERT INTO TEST1 VALUES(VID, NAME, AGE);
        COMMIT;
     END IF;
END;

SELECT * FROM TEST1;



DECLARE
    VID NUMBER;
    NAME VARCHAR2(30);
    AGE NUMBER;
BEGIN
	VID := :ID;
    NAME := :NAME; 
    AGE := :AGE;
    INSERT INTO TEST1 VALUES(VID, NAME, AGE);
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX
        THEN DBMS_OUTPUT.PUT_LINE('중복값이 있습니다.');
    ROLLBACK;
END;



DECLARE
    VID NUMBER;
    NAME VARCHAR2(30);
    AGE NUMBER;
BEGIN
	VID := :ID;
    NAME := :NAME; 
    AGE := :AGE;
    INSERT INTO TEST1 VALUES(VID, NAME, AGE);
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX
        THEN 
            UPDATE TEST1
               SET NAME = VNAME
                 , AGE = VAGE
             WHERE ID = ID;
     COMMIT;
END;





SELECT * FROM TEST1;




	



