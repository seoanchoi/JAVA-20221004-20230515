/*
 * 집합 연산자
 *    - 2 개 이상의 Record Set 결과를 하나의 Record Set 결과로 만드는 연산자
 *    - UNION, UNION ALL, INTERSECT, MINUS 연산자가 있다.
 * 
 * UNION 
 *    - 모든 Record Set 의 결과를 합쳐 하나의 Record Set 으로 만든다.
 *      단, 중복된 결과는 하나만 반영한다.
 *    - 합집합(중봅불허)
 * 
 * UNION ALL
 *    - 모든 Record Set 의 결과를 합쳐 하나의 Record Set 으로 만든다.
 *    - 합집합(중복허용)
 *  
 * INTERSECT
 *    - 모든 Record Set 의 결과를 합칠 때 중복 Record 에 대해서만 하나의 Record Set으로 합친다.
 *    - 교집합
 * 
 * MINUS
 *    - A, B Record Set 의 결과를 합칠 때 A와 B 에  중복된 Record 와 B Record Set 을 제외한
 *      Record 들만 모아서 하나의 Record Set으로 합친다.
 *    - 차집합
 */
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 10
 INTERSECT
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID = 101;
 
SELECT DEPARTMENT_ID
     , MANAGER_ID
  FROM DEPARTMENTS
MINUS
SELECT DISTINCT DEPARTMENT_ID
     , MANAGER_ID
  FROM EMPLOYEES;
 
 /*
  * GROUPIN SET
  *    - GROPT BY 로 집계한 여러 Record Set 결과를 하나아의 Record Set 으로 합칠 때 사용
  */
SELECT DEPARTMENT_ID
     , JOB_ID
     , COUNT(*) AS 인원수
     , ROUND(AVG(SALARY), 2) AS 평균급여
  FROM EMPLOYEES 
  WHERE DEPARTMENT_ID IS NOT NULL 
  GROUP BY GROUPING  SETS(DE
  PARTMENT_ID, JOB_ID, (DEPARTMENT_ID, JOB_ID))
  

/* 
 SELECT 구문에서 사용하는 절
 1.SELECT 절
 2.FROM 절
 3.WHERE 절
 4.GROUP BY 절
 5.HAVING 절
 6.ORDER BY 절
 
 각 절이 사용되는 순서가 있음.(위에 명시한 순서)
 SELECT, FROM 을 제외한 모든 절은 생랼할 수 있다.

 실행 순서는 다음과 같다.
 FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
 