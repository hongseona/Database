create table TBL_CAR (
  car VARCHAR2(20),
    model VARCHAR2(20),
    english varchar2(50), 
    volume number(8),       
    weight number(8),
    co2 number(8)
);

INSERT INTO TBL_CAR(CAR,MODEL,VOLUME,WEIGHT,CO2)
    VALUES('Suzuki','Swift',1300,990,101);
INSERT INTO TBL_CAR(CAR,MODEL,VOLUME,WEIGHT,CO2)
    VALUES('Ford','Fiesta',1000,1112,99);
INSERT INTO TBL_CAR(CAR,MODEL,VOLUME,WEIGHT,CO2)
    VALUES('Honda','Civic',1600,1252,94);
INSERT INTO TBL_CAR(CAR,MODEL,VOLUME,WEIGHT,CO2)
    VALUES('Hyundai','I30',1600,1326,97);
INSERT INTO TBL_CAR(CAR,MODEL,VOLUME,WEIGHT,CO2)
    VALUES('Ford','Focus',2000,1328,105);


-- 문1. 중복되는 브랜드명을 찾으세요.
-- SELECT * FROM TBL_CARCO2 WHERE


-- 문2. 'H' 로 시작하는 브랜드명을 찾으세요.
SELECT * FROM TBL_CAR
    WHERE ENGLISH LIKE 'h%';


-- 문3. 볼륨이 '1500' 이상인 모델을 찾으세요.


-- 문4. 모델의 자릿수가 5자리 이하인 모델을 찾으세요.


-- 문5. 



-- 예시5: english 값이 알파벳 d로 시작하는 행을 조회
-- SELECT * FROM TBL_JAVAWORD
                -- WHERE ENGLISH LIKE 'd%';









-- 볼륨이 1500 이상인 모든 컬럼 조회
-- 셀렉트 * 프롬 tbl_sarco2 웨어 볼륨 >= 1500;