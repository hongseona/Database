-- 문제1.
-- 고객 테이블
CREATE TABLE tbl_customer# (
    CUSTOMER_ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20),
    EMAIL VARCHAR2(30) NOT NULL,
    AGE NUMBER(3) default 0,
    REG_DATE DATE
);
-- 제품 테이블
CREATE TABLE tbl_product (
    PCODE VARCHAR2(20) PRIMARY KEY,
    CATEGORY CHAR(2) NOT NULL,
    PNAME VARCHAR2(50),
    PRICE NUMBER
);
-- 구매 테이블
CREATE TABLE tbl_buy (
    BUY_SEQ NUMBER PRIMARY KEY,
    CUSTOMER_ID VARCHAR2(20) NOT NULL,
    PCODE VARCHAR2(20) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    BUY_DATE TIMESTAMP NOT NULL
);


-- 외래키 추가
ALTER TABLE tbl_buy ADD 
CONSTRAINT fk_buy_customer
FOREIGN KEY (customer_id)				
			REFERENCES tbl_customer#(customer_id);	
		
ALTER TABLE tbl_buy ADD 	
CONSTRAINT fk_buy_pcode
	FOREIGN KEY (pcode)
			REFERENCES tbl_product(pcode);

-- 2.
CREATE SEQUENCE tbl_buy#_seq
START WITH 2001;

-- 4.
SELECT BY
(CATEGORY='B1') 
FROM TBL_PRODUCT;

--5.
SELECT BY 
    if(EMAIL='gmail'
        CUSTOMER_ID,
        EMAIL    )
FROM TBL_CUSTOMER#;

-- 6.
SELECT 






