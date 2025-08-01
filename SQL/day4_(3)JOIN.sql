/*
    테이블 조인: 2개 이상의 테이블 컬럼을 합치기
                특정 컬럼의 값이 같은 것들을 조인하는 것이 의미가 있음.
                참조관계의 테이블을 조인하는 것이 일반적. (FK 필수는 아님)
                왜 조인을 하지? 알고 싶은 정보가 2개 이상의 테이블을 참고해야하는 경우
*/

-- // 1. 크로스 조인(데카르트 곱): 두 개 테이블의 컬럼을 합침
SELECT *
FROM tbl_student, tbl_score;
-- tbl_student: 5행, tbl_score: 9행 데이터 있음. 5*9=45 행이 만들어짐(모든 경우의 수)

-- 중복 컬럼 stuno: 위의 크로스 조인 결과 중에서 stuno 값이 같은 것만 조회
-- 예상되는 행의 갯수 ? 9개
SELECT *
FROM tbl_student stu, tbl_score sco       -- stu, sco 각 테이블의 별칭
WHERE stu.STUNO = sco.STUNO;         
-- tbl_student.STUNO = tbl_score.STUNO
-- : 2개의 테이블을 합쳤을 때 stuno 값이 같은 행만 추출.

SELECT stu.STUNO, stu.Name, sco.JUMSO
FROM TBL_STUDENT stu, TBL_SCORE sco
WHERE stu.STUNO =sco.STUNO
order by sco.SUBJECT;


SELECT stu.STUNO, stu.Name, sco.JUMSO
FROM TBL_STUDENT stu, TBL_SCORE sco
WHERE stu.STUNO =sco.STUNO and sco.SUBJECT='국어'
order by sco.SUBJECT;

-- 모든 과목 대상으로 점수가 90 이상인 학생 이름
SELECT stu.STUNO, stu.Name
FROM TBL_STUDENT stu, TBL_SCORE sco
WHERE stu.STUNO=sco.STUNO and sco.JUMSU >= 90
ORDER BY stu.NAME;

-- 확인: 위의 있는 조건문 검사해서 해당되는 조회
SELECT stuno
FROM TBL_SCORE
WHERE JUMSU >=90;       -- 2025003, 2025004, 2024004, 2025005
-- 서브 쿼리: SELECT 안의 SELECT (FROM 또는 WHERE 에서 서브쿼리 사용)
-- 데이터가 많을 때는 서브쿼리를 매번 수행하면서 값을 검사하므로 속도 문제 발생
SELECT STUNO, NAME
FROM TBL_STUDENT
WHERE STUNO in (
    SELECT stuno
    FROM TBL_SCORE
    WHERE JUMSU >= 90
);
-- 실행 될 떄에 서브쿼리 값 (블라바거나ㅣㄹ외ㅏㄹ어아너) 대체

-- 문제: 평균 점수가 90점 이상(GROUP BY)인 학생 이름


-- 2. JOIN 표준: SELECT ~ FROM 테이블1  JOIN 테이블2    ON 테이블1. 공통컬럼 = 테이블2.공통컬럼

SELECT stu.STUNO, stu.Name
FROM TBL_STUDENT stu
JOIN TBL_SCORE sco
ON stu.STUNO=sco.STUNO and sco.JUMSU >= 90
ORDER by stu.NAME;

-- 3. OUTER JOIN(외부조인): 지정된 테이블 하나는 공통컬럼 값을 모두 포함하도록 조인