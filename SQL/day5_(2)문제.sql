CREATE TABLE tbl_customer# (
    CUSTOMER_ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20),
    EMAIL VARCHAR2(30) NOT NULL,
    AGE NUMBER(3) default 0,
    REG_DATE DATE NOT NULL
);
CREATE TABLE tbl_product (
    PCODE VARCHAR2(20) PRIMARY KEY,
    CATEGORY CHAR(2) NOT NULL,
    PNAME VARCHAR2(50),
    PRICE NUMBER
);
CREATE TABLE tbl_buy (
    BUY_SEQ NUMBER PRIMARY KEY,
    CUSTOMER_ID VARCHAR2(20) NOT NULL,
    PCODE VARCHAR2(20) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    BUY_DATE TIMESTAMP NOT NULL
);

SELECT * FROM TBL_CUSTOMER#;

INSERT INTO TBL_CUSTOMER# VALUES ('mina012',  '김미나',  'kimm@gmail.com',  20,  TO_DATE('2025-03-10 14:23:25','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_CUSTOMER# VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, TO_DATE('2023-10-21 11:12:23','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_CUSTOMER# VALUES ('twice', '박모모', 'momo@daum.net', 29, TO_DATE('2024-12-25 19:23:45','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_CUSTOMER# VALUES ('wonder', '이나나', 'lee@naver.com', NULL,TO_DATE('2024-12-31 23:58:59','yyyy-mm-dd hh24:mi:ss'));         -- age 값 x

SELECT * FROM TBL_PRODUCT;

INSERT INTO TBL_PRODUCT VALUES ('DOWON123a', 'B2', '동원참치선물세트', 54000);
INSERT INTO TBL_PRODUCT VALUES ('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO TBL_PRODUCT VALUES ('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO TBL_PRODUCT VALUES ('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO TBL_PRODUCT VALUES ('MANGOTK4r', 'A2', '애플망고 1kg', 32000);

CREATE SEQUENCE seq_buy
START WITH 1
INCREMENT BY 1;

SELECT * FROM TBL_BUY;

INSERT INTO TBL_BUY(BUY_SEQ,CUSTOMER_ID,PCODE,QUANTITY,BUY_DATE) 
VALUES (seq_buy.NEXTVAL,'mina012' , 'CJBAb12g' , 5, TO_DATE('2024-07-15 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('mina012' , 'APLE5kg' , 2, TO_DATE('2024-11-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('mina012' , 'JINRMn5' , 2,TO_DATE('2025-02-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('twice' , 'JINRMn5' , 3 , TO_DATE('2023-12-21 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('twice' , 'MANGOTK4r' , 2 , TO_DATE('2025-01-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('hongGD' , 'DOWON123a' , 1 , TO_DATE('2025-01-13 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ( 'hongGD' , 'APLE5kg' , 1 , TO_DATE('2024-09-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO TBL_BUY VALUES ('hongGD' , 'DOWON123a' , 1 , TO_DATE('2025-01-13 09:33:15','yyyy-mm-dd hh24:mi:ss'));



-- 구매 행(건수) 중에서 구매 금액이 가장 높은 것을 찾아보자,\. 10번에 문제에  CUSTOMER_ID 컬럼 추가 조회
-- 오라클 FETCH 명령이 있습니다. (12c 버전 이상)







