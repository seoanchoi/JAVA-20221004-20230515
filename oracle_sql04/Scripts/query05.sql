/*
 * SELECT, INSERT, UPDATE, DELETE...
 * CREATE, ALTER, DROP,
 * JOIN, SUBQUERY,
 */
SELECT * FROM EMPLOYEES;

/*
 * EMPLOYEES 의 HIRE_DATE 열의 값을 +10년 하여 수정한다.
 */
/*SELECT HIRE_DATE + INTERVAL '10' YEAR AS "HIRE_DATE"
FROM EMPLOYEES;
*/

UPDATE EMPLOYEES
   SET HIRE_DATE = ADD_MONTHS(HIRE_DATE, 120);

/*
 * JOBS 테이블과 동일한 구조의 KJOBS 테이블을 만들고 JOB_TITLE 열의 값을 한글로 번역하여 수정한다.
 * 단, MIN_SALARY, MAX_SALARY 컬럼은 만들 필요 없음. 
 */
SELECT * FROM JOBS;

SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'JOBS'; /*왼쪽 구문으로 크기 확인해서 크기 지정하면 됨*/


CREATE TABLE KJOBS (
       JOB_ID VARCHAR(10) 
     , JOB_TITLE VARCHAR(35) 
);

INSERT INTO KJOBS(
SELECT JOB_ID
     , JOB_TITLE
  FROM JOBS
);

DROP TABLE KJOBS;

UPDATE KJOBS SET JOB_TITLE = '회장' WHERE JOB_ID = 'AD_PRES';
UPDATE KJOBS SET JOB_TITLE = '관리부서장' WHERE JOB_ID = 'AD_VP';
UPDATE KJOBS SET JOB_TITLE = '관리보조' WHERE JOB_ID = 'AD_ASST';
UPDATE KJOBS SET JOB_TITLE = '재무관리자' WHERE JOB_ID = 'FI_MGR';
UPDATE KJOBS SET JOB_TITLE = '회계사' WHERE JOB_ID = 'FI_ACCOUNT';
UPDATE KJOBS SET JOB_TITLE = '회계관리자' WHERE JOB_ID = 'AC_MGR';
UPDATE KJOBS SET JOB_TITLE = '공인회계사' WHERE JOB_ID = 'AC_ACCOUNT';
UPDATE KJOBS SET JOB_TITLE = '영업관리자' WHERE JOB_ID = 'SA_MAN';
UPDATE KJOBS SET JOB_TITLE = '영업담당자' WHERE JOB_ID = 'SA_REP';
UPDATE KJOBS SET JOB_TITLE = '구매담당자' WHERE JOB_ID = 'PU_MAN';
UPDATE KJOBS SET JOB_TITLE = '구매사무원' WHERE JOB_ID = 'PU_CLERK';
UPDATE KJOBS SET JOB_TITLE = '재고관리자' WHERE JOB_ID = 'ST_MAN';
UPDATE KJOBS SET JOB_TITLE = '재고담당자' WHERE JOB_ID = 'ST_CLERK';
UPDATE KJOBS SET JOB_TITLE = '배송담당자' WHERE JOB_ID = 'SH_CLERK';
UPDATE KJOBS SET JOB_TITLE = '개발자' WHERE JOB_ID = 'IT_PROG';
UPDATE KJOBS SET JOB_TITLE = '마케팅매니저' WHERE JOB_ID = 'MK_MAN';
UPDATE KJOBS SET JOB_TITLE = '마케팅담당자' WHERE JOB_ID = 'MK_REP';
UPDATE KJOBS SET JOB_TITLE = '인적자원담당자' WHERE JOB_ID = 'HR_REP';
UPDATE KJOBS SET JOB_TITLE = '홍보담당자' WHERE JOB_ID = 'PR_REP';

SELECT * FROM KJOBS;
DROP TABLE KJOBS;




/* DEPARTMENTS 테이블에 DEPARTMENT_NAME_KR 컬럼을 추가 후 DEPARTMENT_NAME을
 * 한글로 번역한 데이터로 수정되게 한다.
 */
SELECT * FROM DEPARTMENTS;

ALTER TABLE DEPARTMENTS ADD DEPARTMENT_NAME_KR VARCHAR(50);

UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '행정' WHERE DEPARTMENT_ID = 10;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '마케팅' WHERE DEPARTMENT_ID = 20;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '구매' WHERE DEPARTMENT_ID = 30;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '인사' WHERE DEPARTMENT_ID = 40;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '운송' WHERE DEPARTMENT_ID = 50;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT' WHERE DEPARTMENT_ID = 60;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '홍보' WHERE DEPARTMENT_ID = 70;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '영업' WHERE DEPARTMENT_ID = 80;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '경영' WHERE DEPARTMENT_ID = 90;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '재정' WHERE DEPARTMENT_ID = 100;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '회계' WHERE DEPARTMENT_ID = 110;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '재무' WHERE DEPARTMENT_ID = 120;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '법인세' WHERE DEPARTMENT_ID = 130;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '신용' WHERE DEPARTMENT_ID = 140;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '주주관리' WHERE DEPARTMENT_ID = 150;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '배당' WHERE DEPARTMENT_ID = 160;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '제조' WHERE DEPARTMENT_ID = 170;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '구조' WHERE DEPARTMENT_ID = 180;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '계약' WHERE DEPARTMENT_ID = 190;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '부서' WHERE DEPARTMENT_ID = 200;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT 보조' WHERE DEPARTMENT_ID = 210;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = 'NOC' WHERE DEPARTMENT_ID = 220;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT Helpdesk' WHERE DEPARTMENT_ID = 230;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '공정홍보' WHERE DEPARTMENT_ID = 240;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '소매홍보' WHERE DEPARTMENT_ID = 250;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '채용' WHERE DEPARTMENT_ID = 260;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME_KR = '급여' WHERE DEPARTMENT_ID = 270;




/*
 * KJOBS 테이블에 한글로 번역한 직무 타이틀을 JOBS 테이블에 JOB_TILE_KR 컬럼을 
 * 추가 후 수정이 되도록 한다.(DEPARTMENTS 테이블 처럼 하나의 테이블에 영문/한글이 
 * 모두 들어가게 한다.) 모든 작업을 완료 후 KJOBS 테이블은 제거한다.
 */

ALTER TABLE JOBS ADD JOB_TITLE_KR VARCHAR(30);
ALTER TABLE JOBS DROP JOB_TITLE_KR VARCHAR(30);

UPDATE JOBS 
   SET JOB_TITLE_KR = (SELECT JOB_TITLE
                         FROM KJOBS 
                        WHERE JOB_ID = JOBS.JOB_ID);
                       
SELECT * FROM JOBS;
SELECT * FROM KJOBS;
 
DROP TABLE KJOBS;


SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME || ' / ' || DEPARTMENT_NAME_KR AS DEPARTMENT_NAME
     , MANAGER_ID
     , LOCATION_ID
 FROM DEPARTMENTS;

SELECT * FROM DEPARTMENTS;


/*
 * JOB 테이블에 다음의 데이터를 추가한다. (JOB_TITLE_KR 도 추가되어 있어야 함)
 *    JOB_ID   JOB_TITLE           MIN_SALARY  MAX_SALARY
 *    IT_ITRN  Intern Programmer   3200        380
 *    SV_MGR   Server Manager      4000        10000
 *    SV_ENG   Server Engineer     6000        12000
 *    NT_NGR   Network Manager     5000        11000
 *    NT_ENG   Network Engineer    7000        13000
 */
SELECT * FROM JOBS;

INSERT INTO JOBS VALUES ('IT_ITRN', 'Intern Programmer', 3200, 380, '인턴관리자');
INSERT INTO JOBS VALUES ('SV_MGR', 'Server Manager', 400, 10000, '서버관리자');
INSERT INTO JOBS VALUES ('SV_ENG', 'Server Engineer', 3200, 380, '서버엔지니어');
INSERT INTO JOBS VALUES ('NT_NGR', 'Network Manager', 3200, 380, '네트워크관리자');
INSERT INTO JOBS VALUES ('NT_ENG', 'Network Emgineer', 3200, 380, '네트워크엔지니어');


I


/*
 * DEPARTMENTS 테이블에 다음의 데이터를 추가한다. (DEPARTMENT_NAME_KR 도 추가되어 있어야 함)
 *     DEPARTMENT_ID   DEPARTMENT_NAME   MANAGER_ID   LOCATION_ID
 *     280             Sever             NULL         3000
 *     290             Network           NULL         3000
 */
SELECT * FROM DEPARTMENTS;

INSERT INTO DEPARTMENTS VALUES(
(SELECT (MAX(DEPARTMENT_ID) + 10) FROM DEPARTMENTS)
, 'Sever'
, NULL
, 3000
, '서버'
);

INSERT INTO DEPARTMENTS VALUES(
(SELECT (MAX(DEPARTMENT_ID) + 10) FROM DEPARTMENTS)
, 'Network'
, NULL
, 3000
, '네트워크'
);




/*
 * 새로 신설된 Sever, Network 부서를 위한 인력을 충원하고 있는 것으로 가정하여 각 부서마다
 * 3명의 인원을 EMPLOYEES 에 추가한다.
 *    - 초기에 모든 인원은 JOBS 테이블의 MIN_SALARY 의 급여를 받는 것으로 한다.
 *    - Server, Network 부서에 인원을 추가 할 때 반드시 1명의 부서장이 필요하기 때문에 인원 중 1명을 
 *      부서장으로 만든다.(DEPARTMENTS 테이블의 MANAGER_ID를 설정한다.)
 *    - 부서장으로 선택된 인원은 JOBS 테이블의 MIN_SALARY 급여에서 +2000 상승된 급여로 받을 수 있게 
 *      데이터를 수정한다.
 */
INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '철수', '김', 'KCEOL', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_MGR')
, 'SV_MGR', 280);

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '영수', '박', 'PYEONG', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_MGR')
, 'SV_MGR', 280);

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '강석', '이', 'LKANG', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_MGR')
, 'SV_MGR', 280);

SELECT * FROM EMPLOYEES;


INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '주식', '강', 'KJU', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'NT_MGR')
, 'NT_MGR', 290);

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '장원', '서', 'SJANG', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'NT_MGR')
, 'NT_MGR', 290);

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
VALUES((SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES)
, '지원', '임', 'LJI', SYSDATE
, (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'NT_MGR')
, 'NT_MGR', 290);

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID >= 207;




/*
 * 물가상승분을 반영하여 모든 급여 정보를 수정하려고 한다.
 * JOBS 테이블과 EMPLOYEES 테이블의 모든 급여 정보를 기존보다 5% ~ 10% 상승 시키도록 한다.
 *     - 급여가 4000 미만인 경우 10% 상승
 *     - 급여가 4000 이상 8000 미만인 경우 8% 상승
 *     - 급여가 8000 이상 12000 미만인 경우 6% 상승
 *     - 급여가 12000 이상인 경우 5% 상승
 *     - 정수 1번째 자리에서 절삭할 것. 예) 4333.333 은 4330 으로 절삭.
 */
UPDATE JOBS  
SET (MIN_SALARY , MAX_SALARY ) = (SELECT CASE WHEN MIN_SALARY < 4000 THEN TRUNC (MIN_SALARY * 1.1, -1)
                                             WHEN MIN_SALARY < 8000 THEN TRUNC (MIN_SALARY * 1.08, -1)
                                             WHEN MIN_SALARY < 12000 THEN TRUNC (MIN_SALARY * 1.06, -1)
                                             ELSE TRUNC(MIN_SALARY * 1.05, -1)
                                             END AS MIN_SALARY
                                      , CASE WHEN MAX_SALARY < 4000 THEN TRUNC (MAX_SALARY * 1.1, -1)       
                                             WHEN MAX_SALARY < 8000 THEN TRUNC (MAX_SALARY * 1.08, -1)
                                             WHEN MAX_SALARY < 12000 THEN TRUNC (MAX_SALARY * 1.06, -1)
                                             ELSE TRUNC(MAX_SALARY * 1.05, -1)
                                             END AS MAX_SALARY
                                             FROM JOBS J
                                             WHERE J.JOB_ID = JOBS.JOB_ID);           

UPDATE EMPLOYEES  
SET SALARY = (SELECT CASE WHEN SALARY < 4000 THEN TRUNC (SALARY * 1.1, -1)
                          WHEN SALARY < 8000 THEN TRUNC (SALARY * 1.08, -1)
                          WHEN SALARY < 12000 THEN TRUNC (SALARY * 1.06, -1)
                          ELSE TRUNC(SALARY * 1.05, -1)
                          END AS SALARY   
                          FROM EMPLOYEES E
                          WHERE E.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID;
                         
                                            
                                            
SELECT * FROM JOBS;

                                             



/*
 * 사내 공지를 위한 게시판 기능을 추가하려 한다. 다음의 요구사항에 맞추어 테이블을 생성하고
 * 첫번째 공지를 작성하도록 한다.(첫번째 공지는 모든 부서가 열람할 수 있게 한다.)
 *     - 공지 게시판은 부서별 공지와 전체 공지로 나누어져 운영돼야 한다.
 *     - 전체 공지는 모든 부서가 확인할 수 있는 공지이며 부서별 공지는 지정한 부서에 소속된
 *       사원만 볼수 있는 공지이다.
 *     - 공지를 작성할 때 다음의 정보가 저장되어야 한다.
 *         번호, 제목, 내용, 작성일자, 부서ID
 */




/*
 * 사내 공지 게시판 테이블을 생성 후에 다음의 공지를 추가로 작성한다.
 *     - 모든 부서마다 'xxx 부서만 확인할 수 있는 공지 입니다.' 라는 메시지를 추가한다.
 */




/*
 * 100 번 사원이 공지를 열람한다는 가정하에 100 번 사원이 소속된 부서의 공지와 전체 공지가
 * 보일수 있는 SELECT 쿼리문을 작성하세요.
 */




/*
 * 공지 게시판에 중요도 기능을 추가하여 가장 중요한 공지가 가장 먼저 조회될 수 있도록 테이블을
 * 수정하도록 한다.
 *     - 중요도는 1 ~ 5 까지 사용할 수 있게 한다.
 *     - 중요도를 설정하지 않으면 기본 3으로 저장되게 한다.
 *     - 전체 공지용으로 중요도 1 ~ 5 까지 총 5개의 공지 데이터를 추가한다.
 *     - 추가한 공지 데이터를 조회할 때 중요도 순으로 조회가 될 수 있도록
 *       SELECT 구문을 작성한다.
 */