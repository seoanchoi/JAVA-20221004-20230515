/*
 * Sub Query
 *     - SQL 구문에 SELECT 구문이 포함되어 실행되는 형태
 *     - 서브쿼리는 반드시 소괄호로 묶여야 함
 *     - 서브쿼리와 비교하는 항목은 반드시 서브쿼리의 SELSECT 절의 항목 개수와 
 *       자료형을 일치시켜야 한다.
 */
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , (SELECT JOB_TITLE FROM JOBS WHERE JOB_ID = E.JOB_ID) AS JOB_TITLE
     , (SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AS DEPT_NAME
     , MANAGER_ID
  FROM EMPLOYEES E;
 
 SELECT *
   FROM (SELECT EMPLOYEES_ID)
              , FIRST_NAME
              , LAST_NAME
           FROM EMPLOYEES);
           
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
     , COMMISSION_PCT
     , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
                           FROM EMPLOYEES 
                          WHERE COMMISSION_PCT IS NOT NULL
                            AND COMMISSION_PCT > 0);
                            

                           
/*
 * INSERT, UPDATE, DELETE 구문에서도 서브쿼리 사용됨
 */                          
INSERT INTO 테이블명(
    SELECT * FROM 테이블명
);

UPDATE 테이블명
   SET 컬럼명 = (SELECT 컬럼명 FROM 테이블명);
   
DELETE FROM 테이블명
 WHERE 컬럼명 = (SELECT 컬럼명 FROM 테이블명);

/*
 * 서브 쿼리의 Result Set 의 Record 수와 Column 수에 따라 에러가 발생할 수 있다. 
 */
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , (SELECT JOB_TITLE FROM JOBS WHERE JOB_ID = E.JOB_ID) AS JOB_TITLE
     , (SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AS DEPT_NAME
     , MANAGER_ID
  FROM EMPLOYEES E;
  
 
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID /*이 경우 IN은 다중행 비교가 가능해서 가능*/
                                 FROM EMPLOYEES 
                                WHERE MANAGER_ID IS NOT NULL); 
                               
                               
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
  FROM EMPLOYEES
 WHERE (JOB_ID, DEPARTMENT_ID) IN (SELECT DISTINCT JOB_ID, DEPARTMENT_ID
                                 FROM EMPLOYEES); 
                                                       
/* 
 * 단일행
 *    서브쿼리의 결과값이 1개인 것
 * 다중행
 *    서브쿼리의 결과값이 N개인 것
 * 다중열
 *    서브쿼리의 결과 열이 N개인 것 
 * 다중행/다중열
 *    서브쿼리의 결과 결과값과 열이 N개 인 것
 */                  
                                
/*
 * SELECT 절에 사용하는 서브쿼리는 반드시 단일행/단일열 의 결과가 나와야 한다.
 * WHERE 절에 사용하는 서브쿼리는 왼쪽 컬럼 수에 따라 단일열 또는 다중열이 사용될 수 있다.
 * WHERE 절에 사용하는 서브쿼리는 연산자 종류에 따라 단일행 또는 다중열이 사용될 수 있다.
 * (1개 값을 비교하는 형태면 단일행, 여러 값을 비교하는 형태면 다중열)
 * FROM 절에 사용하는 서브쿼리는 어떠한 형태이든 사용 가능하다. 
 * FROM 절에 사용하는 서브쿼리는 INLINE VIEW 라고 한다.
 * INLINE VIEW 를 사용할 때 WITH 구문을 사용해서 서브쿼리에 대한 별칭을 부여할 수 있다.
 */
WITH TEMP
  AS (SELECT EMPLOYEE_ID
           , FIRST_NAME
           , LAST_NAME
        FROM EMPLOYEES)
SELECT * FROM TEMP;


/*
 * TOP-N 분석 : 상위/하위 N개 행에 대해 조회. 
 */
SELECT ROWNUM AS 순위   --행 번호, 동순위여도 123으로 정해짐
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
 WHERE ROWNUM <= 10;


SELECT 순위			-- 동순위면 같은 순위로 매겨짐, 동순위 다음은 다다음 숫자로 표기
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM (SELECT EMPLOYEE_ID
             , FIRST_NAME
             , LAST_NAME
             , SALARY
             , RANK() OVER(ORDER BY SALARY DESC) AS 순위
          FROM EMPLOYEES);

         
SELECT 순위			-- 동순위면 같은 순위로 매겨짐, 동순위 다음은 다음 숫자로 표기
     , EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
  FROM (SELECT EMPLOYEE_ID
             , FIRST_NAME
             , LAST_NAME
             , SALARY
             , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS 순위
          FROM EMPLOYEES);         
         
         

                               