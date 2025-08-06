-- 지금까지 했던 join
select tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
from TBL_CUSTOMER# tc       -- 4개 행
join TBL_BUY tb             -- 8개 행
on tc.CUSTOMER_ID = tb.CUSTOMER_ID;

-- 예시로 고객 'wonder'는 구매가 없으므로 tbl_buy 에 없어요.
-- 이럴 때 tbl_buy 는 null 상태로 합치는 것이 외부 조인
select *                         -- tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
from TBL_CUSTOMER# tc      
join TBL_BUY tb             -- left 에 있는 테이블(대체로 부모 테이블)의 모든 행을 포함
on tc.CUSTOMER_ID = tb.CUSTOMER_ID;

select *                         -- tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
from TBL_CUSTOMER# tc      
join TBL_BUY tb             -- rignt 에 있는 테이블의 모든 행을 포함. 부모 테이블이 아니므로 동등조인 결과
on tc.CUSTOMER_ID = tb.CUSTOMER_ID;

select *                         -- tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
from TBL_CUSTOMER# tc      
join TBL_BUY tb 
on tc.CUSTOMER_ID = tb.CUSTOMER_ID 
where tb.BUY_SEQ is NULL;