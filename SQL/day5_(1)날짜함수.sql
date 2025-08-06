-- dual 테이블: 수식, 함수 연산 테스트 할 때 사용하는 임시 테이블

select 2+3 from dual;

-- 날짜 함수
SELECT sysdate from dual;       -- 출력형식은 to_char() 변경
SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual;     -- 24시 기준
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss am') from dual;    -- 12시 기준(오후에 확인하면 pm으로 출력)        
-- to_char() 함수 패턴은 위의 포맷에서 년도,월,일,시,분,초 각각을 출력하게도 가능.
-- extract(year from sysdate), extract(month from sysdate)는 년도, 월 추출

-- 소수점 3자리로 초(ms 단위까지)를 표시 . +09:00 는 표준시와의 차이
SELECT SYSTIMESTAMP from dual;

-- 날짜 타입의 연산: 날짜 사이의 차이 (반드시 날짜 타입으로 해야함)
-- 문자열을 날짜 타입으로 변환: to_date() 함수

-- 1) day(일 단위)
-- '2025-08-04'  과 '2025-12-25' 의 차이
SELECT to_date('2025-12-25', 'yyyy-mm-dd') - to_date('2025-08-04', 'yyyy-mm-dd')
from dual;      -- 0시 기준
SELECT trunc(to_date('2025-12-25', 'yyyy-mm-dd') - sysdate +1)
from dual;
SELECT trunc(to_date('2025-08-05', 'yyyy-mm-dd') - sysdate +1)
from dual;

-- 뺄셈 대신에 DATEDIFF 함수: 다른 DBMS 함수


-- 2) 날짜 사이의 차이를 구할때: 개월 수 단위(월 값만 가지고는 뺄셈 못함)
SELECT MONTHS_BETWEEN(sysdate, to_date('2026-02-01', 'yyyy-mm-dd'))
from dual;

-- 날짜 더하기 연산
SELECT sysdate + 3 from dual;
SELECT ADD_MONTHS(sysdate, 15)
from dual;
