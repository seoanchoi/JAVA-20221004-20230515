/*
 * DEPARTMENTS 테이블과 LOCATIONS 테이블을 사용하여 각 부서가 어느 지역에 위치하는지 알아보세요.
 */

SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT D.DEPARTMENT_NAME
     , L.CITY
  FROM DEPARTMENTS D
  JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID
 ORDER BY 1;

/*
 * 지역별로 몇개의 부서가 배치되었는지 알아보세요.
 */
SELECT COUNT(*) AS "부서 수" 
     , L.CITY
     , D.DEPARTMENT_NAME     
  FROM DEPARTMENTS D
  JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID
 GROUP BY L.CITY
     , D.DEPARTMENT_NAME ;
    
/*
 * 지역별 사원수가 얼마나 되는지 알아보세요.
 */
SELECT COUNT(*) "인원 수"
     , L.LOCATION_ID
     , L.CITY
  FROM EMPLOYEES E
  JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
  JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID
 GROUP BY L.LOCATION_ID 
     , L.CITY;   