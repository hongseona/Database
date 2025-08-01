-- 정수 또는 실수 수치 형식
-- 데이터 타입 number  
--      : 자바 정수와 실수 타입 형식 지정  
-- number(정밀도 n ,소수점이하 자리수 m) 
--      : n,m 지정 안하면 데이터에 따라 저장공간 할당. 최대 38자리(자바 BigDecimal)
--      : 정수와 실수 모두 가증

-- BigDecimal: java에서 아주 정밀한 숫자 계산을 하기 위해 사용하는 클래스
-- ㄴ 사용이유: 1) double,float은 부동소수점 방식으로 계산할때 오차가 생길 수 있음
--             2) 아주 큰 수나 소수점을 많이 가진 숫자도 정확하게 표현 가능
--             3) 연산자 사용 못함. 메소드로 계산해야함. (add,subtract,multiply,divide)

-- number 테스트 테이블
CREATE TABLE tbl_number(
	xcol NUMBER,	 
	ycol NUMBER(5),			-- 정수로 최대 5자리(소수점 이하 없음.-소수점 이하 반올림). m=0 입니다.
	zcol NUMBER(7,2),		-- 전체 자리수 최대 7자리, 소수점 이하 2자리(고정). NUMBER(n,m) n>m 인 경우
	zcol2 NUMBER(2,5)
-- NUMBER(n,m) n<m 인 경우 : 소수점이하 최대 5자리(0이 3개 고정) , 0아닌 유효 숫자 최대 2자리. 
);

show autocommit;
set AUTOCOMMIT ON;

-- 유효 숫자: 1000 (모든 0이 유효함)    00100 (1 앞에 있는 0 두개는 의미없음. 유효 숫자가 아님)
--           0.0001 (모든 0이 유효함)   0.000100 (1 뒤에 0 두개는 유효 숫자가 아님)
--                                          => 유효 숫자가 아닌 것은 없어도 데이터에 영향을 주지 않음
INSERT INTO tbl_number(xcol) values (12345);
INSERT INTO tbl_number(xcol) values (123456);
INSERT INTO tbl_number(xcol) values (12345.789);

INSERT INTO tbl_number(ycol) values (12345);
INSERT INTO tbl_number(ycol) values (123456); --오류
INSERT INTO tbl_number(ycol) values (12345.789);

INSERT INTO TBL_NUMBER(zcol) values (12345.67);
INSERT INTO TBL_NUMBER(zcol) values (1245.6);    -- 1245.60
INSERT INTO TBL_NUMBER(zcol) values (1245.454);  -- 1245.45
INSERT INTO TBL_NUMBER(zcol) values (1.45234564);   -- 1.45 (소수점 이하 2자리로 맞출 수 있음)
INSERT INTO TBL_NUMBER(zcol) values (123456.454);   -- 오류 (정수 포함 전체 자리수 초과)

-- zcol2 NUMBER(2,5)  : 소수점 이하 자리수 항상 5개,
-- 5-2 =3은 유효한 0의 갯수(고정값) 
INSERT INTO TBL_NUMBER (zcol2) values (0.00034);
INSERT INTO TBL_NUMBER (zcol2) values (0.00345);-- 오류
INSERT INTO TBL_NUMBER (zcol2) values (0.0003);

INSERT INTO TBL_NUMBER (zcol2) values (0.23); -- 오류
INSERT INTO TBL_NUMBER (zcol2) values (0.000378);

commit;