/*
    집계(통계) 함수: count, sum, avg, max, min, 표준편차(STDDEV), 분산(VARIANCE)
                    테이블의 컬럼을 대상으로 실행되는 함수
                    tbl_car_co2 테이블에서는 합계, 평균, 최대, 최소값은 number 컬럼인
                    volume, weight, co2 를 대상으로 테스트 할 수 있습니다
    집계 함수를 사용할 때, 다른 컬럼을 조회 할 수 없습니다.  -> 그룹화가 필요함
*/
-- 1. count 함수
-- 1) 데이터의 전체 개수: COUNT 함수는 컬럼 지정 대신 *
SELECT COUNT(*) as "전체갯수"
FROM TBL_CAR_CO2;

-- 2) count(weight) 로 컬럼을 지정하면 null 이 아닌 값만 카운트 합니다.
update TBL_CAR_CO2
SET WEIGHT = NULL
WHERE model = 'Up!';    -- 테스트를 위해 null 값으로 변경

SELECT COUNT(WEIGHT) as "NULL 제외 개수"
FROM TBL_CAR_CO2;

-- 3) count(distinct car): 컬럼 값 중복 제거 후 카운트
SELECT distict car
FROM TBL_CAR_CO2;

SELECT COUNT(DISTINCT car) as "중복 제거 개수"
FROM TBL_CAR_CO2;


-- WHERE 조건으로 갯수 구하기
SELECT COUNT(*) as "Volvo 갯수"
FROM TBL_CAR_CO2
WHERE WEIGHT < 1000;

-- 오류
SELECT car, COUNT(*) as "브랜드 갯수"
FROM TBL_CAR_CO2
WHERE car = 'Ford';

-- avg 함수(평균 구하기)
-- 1) CO2 평균(Null 제외 평균 구함)
SELECT AVG(co2)
FROM TBL_CAR_CO2;
-- 널 값이 있는 weight 컬럼: 나누기 8 => sum()/count(weight)
SELECT avg(WEIGHT)
FROM TBL_CAR_CO2;   -- 1116.428571428571428571428571428571428571

-- 2) 평균을 null 값은 0으로 바꾸기: 나누기 9 => sum()/count(*)
SELECT weight
from TBL_CAR_CO2;

SELECT NVL(weight, 0)
from TBL_CAR_CO2;

SELECT avg(NVL(weight, 0))
FROM TBL_CAR_CO2;

SELECT ROUND(avg(NVL(weight,0)), 0)
FROM TBL_CAR_CO2;       -- 977

SELECT avg(co2), avg(weight)
FROM TBL_CAR_CO2;

-- 참고: 함수에 조건식 적용하기

SELECT COUNT(*) 
FROM TBL_CAR_CO2
WHERE WEIGHT < 1000;

SELECT COUNT(*)
FROM TBL_CAR_CO2
WHERE WEIGHT >= 1000;

-- 위의 2개의 select 를 대체하는 방식
SELECT
    avg(CASE WHEN weight >= 1000 THEN WEIGHT END),
    avg(CASE WHEN weight < 1000 THEN WEIGHT END)
FROM TBL_CAR_CO2;

SELECT
    sum(CASE WHEN weight >= 1000 THEN 1 END),
    sum(CASE WHEN weight < 1000 THEN 1 END)
FROM TBL_CAR_CO2;

-- 3. sum, min, max 테스트


