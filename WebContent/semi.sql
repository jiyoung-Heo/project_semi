
/* Drop Tables */

DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE COUPON CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE GRADE CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE HEAD_ADMIN CASCADE CONSTRAINTS;
DROP TABLE INBOUND CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE USERQNA CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE STOCK CASCADE CONSTRAINTS;

DROP SEQUENCE COUPON_seq;
DROP SEQUENCE seq;
DROP SEQUENCE GRADE_seq;
DROP SEQUENCE INBOUND_seq;
DROP SEQUENCE NOTICE_seq;
DROP SEQUENCE ORDERS_seq;
DROP SEQUENCE ORDER_DETAIL_seq;
DROP SEQUENCE PRODUCT_seq;
DROP SEQUENCE REVIEW_seq;
DROP SEQUENCE STOCK_seq;
DROP SEQUENCE USERQNA_seq;
DROP SEQUENCE CART_seq;



/* Create Tables */

-- 장바구니
CREATE TABLE CART
(
	-- 장바구니
	CID NUMBER(4) NOT NULL,
	-- 색상
	CCOLOR VARCHAR2(20) NOT NULL,
	-- 사이즈
	CSIZE VARCHAR2(20) NOT NULL,
	-- 수량
	CAMOUNT NUMBER(4) NOT NULL,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 상품아이디
	PID NUMBER(3) NOT NULL,
	PRIMARY KEY (CID)
);


-- 쿠폰
CREATE TABLE COUPON
(
	-- 쿠폰아이디
	CID NUMBER(4) NOT NULL,
	-- 쿠폰명
	CNAME VARCHAR2(100),
	-- 할인율
	CDISCOUNT NUMBER(3),
	-- 할인금액
	CPRICE NUMBER(10),
	-- 쿠폰생성일 : DATE DEFAULT SYSDATE
	CRDATE DATE,
	-- 쿠폰적용시작일
	CSTARTDATE DATE,
	-- 쿠폰적용마감일
	CENDDATE DATE,
	-- mID
	MID VARCHAR2(100) NOT NULL,
	-- 상품아이디
	PID NUMBER(3) NOT NULL,
	PRIMARY KEY (CID)
);


-- 자주묻는질문
CREATE TABLE FAQ
(
	-- 자주묻는질문아이디
	FID NUMBER(4) NOT NULL,
	-- 제목
	FTITLE VARCHAR2(100),
	-- 내용
	FCONTENT VARCHAR2(4000),
	-- 등록일 : DATE DEFAULT SYSDATE
	FRDATE DATE,
	-- 조회수 : DEFAULT 0
	FHIT NUMBER(4),
	-- 공개/비공개 : 0. 공개
	-- 1. 비공개
	FPUBLIC_PRIVATE NUMBER(3),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (FID)
);


-- 등급
CREATE TABLE GRADE
(
	-- gID
	GID NUMBER(4) NOT NULL,
	-- 고객등급 : 0.실버 등등
	GLEVEL VARCHAR2(10),
	-- 누적구매금액
	GBUY NUMBER(10),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (GID)
);


-- 관리자
CREATE TABLE HEAD_ADMIN
(
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	-- 비밀번호
	APW VARCHAR2(100),
	-- 이름
	ANAME VARCHAR2(100),
	-- 권한
	ALEVEL NUMBER(1),
	-- 등록일
	ARDATE DATE,
	PRIMARY KEY (AID)
);


-- 입고
CREATE TABLE INBOUND
(
	-- 상품아이디
	INID NUMBER(4) NOT NULL,
	-- 입고날짜
	INDATE DATE,
	-- 상품명
	INNAME VARCHAR2(100),
	-- 가격
	INPRICE NUMBER(10),
	-- 입고량
	INAMOUNT NUMBER(4),
	-- 색상
	INCOLOR VARCHAR2(20),
	-- 사이즈
	INSIZE VARCHAR2(20),
	-- 분류
	INCATEGORY VARCHAR2(50),
	PRIMARY KEY (INID)
);


-- 회원
CREATE TABLE MEMBERS
(
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 비밀번호
	MPW VARCHAR2(15),
	-- 이름
	MNAME VARCHAR2(100),
	-- 주소
	MADDRESS VARCHAR2(500),
	-- 우편번호
	MPOST VARCHAR2(10),
	-- 전화번호
	MPHONE VARCHAR2(300),
	-- 가입일 : DATE DEFAULT SYSDATE
	MRDATE DATE,
	-- 생일
	MBIRTH DATE,
	-- 탈퇴여부 : DEFAULT 0
	MDROP NUMBER(1),
	-- 마일리지
	MMILEAGE NUMBER(10),
	-- 이메일
	MEMAIL VARCHAR2(25),
	-- addtitle
	ADDTITLE VARCHAR2(15),
	-- addname
	ADDNAME VARCHAR2(15),
	-- addphone
	ADDPHONE VARCHAR2(15),
	PRIMARY KEY (MID)
);


-- 공지글
CREATE TABLE NOTICE
(
	-- 자주묻는질문아이디
	FID NUMBER(4) NOT NULL,
	-- 제목
	FTITLE VARCHAR2(100),
	-- 내용
	FCONTENT VARCHAR2(4000),
	-- 첨부파일
	FFILE VARCHAR2(4000),
	-- 등록일 : DATE DEFAULT SYSDATE
	FRDATE DATE,
	-- 조회수 : DEFAULT 0
	FHIT NUMBER(4),
	-- 공개/비공개 : 0. 공개
	-- 1. 비공개
	FPUBLIC_PRIVATE NUMBER(3),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (FID)
);


-- 주문
CREATE TABLE ORDERS
(
	-- 오더아이디
	ORID NUMBER(10) NOT NULL,
	-- 주문일 : SYSDATE
	ORDATE DATE,
	-- 수령자
	ORNAME VARCHAR2(100),
	-- 수령자연락처
	ORPHONE VARCHAR2(300),
	-- 수령자주소
	ORADDRESS VARCHAR2(500),
	-- 수령자우편번호
	ORPOST VARCHAR2(10),
	-- 결제수단 : 1.현금입금 2.카드 3.카카오페이 등
	ORPAYMENT VARCHAR2(20),
	-- 송장번호
	ORINVOICE NUMBER(10),
	-- 배송비 : 0.무료 1.일반 2.특수
	ORDELPAY NUMBER(10),
	-- 배송완료
	ORDELIVERY VARCHAR2(2),
	-- 구매확정
	ORCOMPLETE VARCHAR2(2),
	-- 취소/환불
	ORCANCLE VARCHAR2(2),
	-- 총가격
	ORTOTAL NUMBER(10),
	-- 결제금액
	ORPAYMONEY VARCHAR2(10),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (ORID)
);


-- 구매상세
CREATE TABLE ORDER_DETAIL
(
	-- 상세아이디
	ODID NUMBER(4) NOT NULL,
	-- 색상
	ODCOLOR VARCHAR2(20),
	-- 사이즈
	ODSIZE VARCHAR2(20),
	-- 수량
	ODCOUNT NUMBER(2),
	-- 쿠폰 : 전체가격쿠폰
	ODCOUPON VARCHAR2(10),
	-- 마일리지
	ODMILEAGE NUMBER(10),
	-- 오더아이디
	ORID NUMBER(10) NOT NULL,
	-- 상품아이디
	PID NUMBER(3) NOT NULL,
	PRIMARY KEY (ODID)
);


-- 상품
CREATE TABLE PRODUCT
(
	-- 상품아이디
	PID NUMBER(3) NOT NULL,
	-- 가격
	PPRICE NUMBER(10),
	-- 할인율
	PDISCOUNT NUMBER(4),
	-- 대표이미지
	PIMAGE1 VARCHAR2(4000),
	-- 섬네일
	PIMAGE2 VARCHAR2(4000),
	-- 등록일 : DATE DEFAULT SYSDATE
	PRDATE DATE,
	-- 상품팔린수 : DEFAULT 0
	PSELL NUMBER(3),
	-- 재고아이디
	SID NUMBER(4) NOT NULL,
	PRIMARY KEY (PID)
);


-- 리뷰
CREATE TABLE REVIEW
(
	-- 리뷰아이디
	RID NUMBER(10) NOT NULL,
	-- 비밀번호
	RPW VARCHAR2(100),
	-- 리뷰제목
	RTITLE VARCHAR2(300),
	-- 리뷰내용
	RCONTENT VARCHAR2(4000),
	-- 리뷰사진1
	RPHOTO1 VARCHAR2(4000),
	-- 리뷰사진2
	RPHOTO2 VARCHAR2(4000),
	-- 리뷰사진3
	RPHOTO3 VARCHAR2(4000),
	-- 리뷰등록일 : DATE DEFAULT SYSDATE
	RRDATE DATE,
	-- 리뷰추천수 : DEFAULT 0
	RHIT NUMBER(4),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 재고아이디
	SID NUMBER(4) NOT NULL,
	PRIMARY KEY (RID)
);


-- 재고
CREATE TABLE STOCK
(
	-- 재고아이디
	SID NUMBER(4) NOT NULL,
	-- 상품명
	SNAME VARCHAR2(100),
	-- 색상
	SCOLOR VARCHAR2(20),
	-- 사이즈
	SSIZE VARCHAR2(20),
	-- 수량
	SAMOUNT NUMBER(4),
	-- slev
	SLEV NUMBER(3),
	PRIMARY KEY (SID)
);


-- 문의글
CREATE TABLE USERQNA
(
	-- 문의글아이디
	QID NUMBER(4) NOT NULL,
	-- 문의글카테고리 : 1.상품 2.교환/환불 3.사이트이용 4.기타
	QCATE VARCHAR2(20),
	-- 문의글비번
	QPW VARCHAR2(100),
	-- 문의글제목
	QTITLE VARCHAR2(300),
	-- 문의글내용
	QCONTENT VARCHAR2(4000),
	-- 문의글첨부
	QFILE VARCHAR2(4000),
	-- 문의글등록일 : DATE DEFAULT SYSDATE
	QRDATE DATE,
	-- 문의글처리여부 : 0.미처리 1.처리
	QLEV NUMBER(3),
	-- 그룹번호
	QREF NUMBER(3),
	-- 글번호
	QSTEP NUMBER(3),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 상품아이디
	PID NUMBER(3) NOT NULL,
	PRIMARY KEY (QID)
);

/* 시퀀스 모음 */
create SEQUENCE COUPON_seq;
create SEQUENCE seq;
create SEQUENCE GRADE_seq;
create SEQUENCE INBOUND_seq;
create SEQUENCE NOTICE_seq;
create SEQUENCE ORDERS_seq;
create SEQUENCE ORDER_DETAIL_seq;
create SEQUENCE PRODUCT_seq;
create SEQUENCE REVIEW_seq;
create SEQUENCE STOCK_seq;
create SEQUENCE USERQNA_seq;
create SEQUENCE CART_seq;


/* Create Foreign Keys */

ALTER TABLE FAQ
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE CART
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE COUPON
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE GRADE
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE ORDERS
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE USERQNA
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE ORDER_DETAIL
	ADD FOREIGN KEY (ORID)
	REFERENCES ORDERS (ORID)
;


ALTER TABLE CART
	ADD FOREIGN KEY (PID)
	REFERENCES PRODUCT (PID)
;


ALTER TABLE COUPON
	ADD FOREIGN KEY (PID)
	REFERENCES PRODUCT (PID)
;


ALTER TABLE ORDER_DETAIL
	ADD FOREIGN KEY (PID)
	REFERENCES PRODUCT (PID)
;


ALTER TABLE USERQNA
	ADD FOREIGN KEY (PID)
	REFERENCES PRODUCT (PID)
;


ALTER TABLE PRODUCT
	ADD FOREIGN KEY (SID)
	REFERENCES STOCK (SID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (SID)
	REFERENCES STOCK (SID)
;



/* Comments */

COMMENT ON TABLE CART IS '장바구니';
COMMENT ON COLUMN CART.CID IS '장바구니';
COMMENT ON COLUMN CART.CCOLOR IS '색상';
COMMENT ON COLUMN CART.CSIZE IS '사이즈';
COMMENT ON COLUMN CART.CAMOUNT IS '수량';
COMMENT ON COLUMN CART.MID IS '아이디';
COMMENT ON COLUMN CART.PID IS '상품아이디';
COMMENT ON TABLE COUPON IS '쿠폰';
COMMENT ON COLUMN COUPON.CID IS '쿠폰아이디';
COMMENT ON COLUMN COUPON.CNAME IS '쿠폰명';
COMMENT ON COLUMN COUPON.CDISCOUNT IS '할인율';
COMMENT ON COLUMN COUPON.CPRICE IS '할인금액';
COMMENT ON COLUMN COUPON.CRDATE IS '쿠폰생성일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN COUPON.CSTARTDATE IS '쿠폰적용시작일';
COMMENT ON COLUMN COUPON.CENDDATE IS '쿠폰적용마감일';
COMMENT ON COLUMN COUPON.MID IS 'mID';
COMMENT ON COLUMN COUPON.PID IS '상품아이디';
COMMENT ON TABLE FAQ IS '자주묻는질문';
COMMENT ON COLUMN FAQ.FID IS '자주묻는질문아이디';
COMMENT ON COLUMN FAQ.FTITLE IS '제목';
COMMENT ON COLUMN FAQ.FCONTENT IS '내용';
COMMENT ON COLUMN FAQ.FFILE IS '첨부파일';
COMMENT ON COLUMN FAQ.FRDATE IS '등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN FAQ.FHIT IS '조회수 : DEFAULT 0';
COMMENT ON COLUMN FAQ.FPUBLIC_PRIVATE IS '공개/비공개 : 0. 공개
1. 비공개';
COMMENT ON COLUMN FAQ.AID IS '어드민아이디';
COMMENT ON TABLE GRADE IS '등급';
COMMENT ON COLUMN GRADE.GID IS 'gID';
COMMENT ON COLUMN GRADE.GLEVEL IS '고객등급 : 0.실버 등등';
COMMENT ON COLUMN GRADE.GBUY IS '누적구매금액';
COMMENT ON COLUMN GRADE.MID IS '아이디';
COMMENT ON TABLE HEAD_ADMIN IS '관리자';
COMMENT ON COLUMN HEAD_ADMIN.AID IS '어드민아이디';
COMMENT ON COLUMN HEAD_ADMIN.APW IS '비밀번호';
COMMENT ON COLUMN HEAD_ADMIN.ANAME IS '이름';
COMMENT ON COLUMN HEAD_ADMIN.ALEVEL IS '권한';
COMMENT ON COLUMN HEAD_ADMIN.ARDATE IS '등록일';
COMMENT ON TABLE INBOUND IS '입고';
COMMENT ON COLUMN INBOUND.INID IS '상품아이디';
COMMENT ON COLUMN INBOUND.INDATE IS '입고날짜';
COMMENT ON COLUMN INBOUND.INNAME IS '상품명';
COMMENT ON COLUMN INBOUND.INPRICE IS '가격';
COMMENT ON COLUMN INBOUND.INAMOUNT IS '입고량';
COMMENT ON COLUMN INBOUND.INCOLOR IS '색상';
COMMENT ON COLUMN INBOUND.INSIZE IS '사이즈';
COMMENT ON COLUMN INBOUND.INCATEGORY IS '분류';
COMMENT ON TABLE MEMBERS IS '회원';
COMMENT ON COLUMN MEMBERS.MID IS '아이디';
COMMENT ON COLUMN MEMBERS.MPW IS '비밀번호';
COMMENT ON COLUMN MEMBERS.MNAME IS '이름';
COMMENT ON COLUMN MEMBERS.MADDRESS IS '주소';
COMMENT ON COLUMN MEMBERS.MPOST IS '우편번호';
COMMENT ON COLUMN MEMBERS.MPHONE IS '전화번호';
COMMENT ON COLUMN MEMBERS.MRDATE IS '가입일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN MEMBERS.MBIRTH IS '생일';
COMMENT ON COLUMN MEMBERS.MDROP IS '탈퇴여부 : DEFAULT 0';
COMMENT ON COLUMN MEMBERS.MMILEAGE IS '마일리지';
COMMENT ON COLUMN MEMBERS.MEMAIL IS '이메일';
COMMENT ON COLUMN MEMBERS.ADDTITLE IS 'addtitle';
COMMENT ON COLUMN MEMBERS.ADDNAME IS 'addname';
COMMENT ON COLUMN MEMBERS.ADDPHONE IS 'addphone';
COMMENT ON TABLE NOTICE IS '공지글';
COMMENT ON COLUMN NOTICE.FID IS '자주묻는질문아이디';
COMMENT ON COLUMN NOTICE.FTITLE IS '제목';
COMMENT ON COLUMN NOTICE.FCONTENT IS '내용';
COMMENT ON COLUMN NOTICE.FFILE IS '첨부파일';
COMMENT ON COLUMN NOTICE.FRDATE IS '등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN NOTICE.FHIT IS '조회수 : DEFAULT 0';
COMMENT ON COLUMN NOTICE.FPUBLIC_PRIVATE IS '공개/비공개 : 0. 공개
1. 비공개';
COMMENT ON COLUMN NOTICE.AID IS '어드민아이디';
COMMENT ON TABLE ORDERS IS '주문';
COMMENT ON COLUMN ORDERS.ORID IS '오더아이디';
COMMENT ON COLUMN ORDERS.ORDATE IS '주문일 : SYSDATE';
COMMENT ON COLUMN ORDERS.ORNAME IS '수령자';
COMMENT ON COLUMN ORDERS.ORPHONE IS '수령자연락처';
COMMENT ON COLUMN ORDERS.ORADDRESS IS '수령자주소';
COMMENT ON COLUMN ORDERS.ORPOST IS '수령자우편번호';
COMMENT ON COLUMN ORDERS.ORPAYMENT IS '결제수단 : 1.현금입금 2.카드 3.카카오페이 등';
COMMENT ON COLUMN ORDERS.ORINVOICE IS '송장번호';
COMMENT ON COLUMN ORDERS.ORDELPAY IS '배송비 : 0.무료 1.일반 2.특수';
COMMENT ON COLUMN ORDERS.ORDELIVERY IS '배송완료';
COMMENT ON COLUMN ORDERS.ORCOMPLETE IS '구매확정';
COMMENT ON COLUMN ORDERS.ORCANCLE IS '취소/환불';
COMMENT ON COLUMN ORDERS.ORTOTAL IS '총가격';
COMMENT ON COLUMN ORDERS.ORPAYMONEY IS '결제금액';
COMMENT ON COLUMN ORDERS.MID IS '아이디';
COMMENT ON TABLE ORDER_DETAIL IS '구매상세';
COMMENT ON COLUMN ORDER_DETAIL.ODID IS '상세아이디';
COMMENT ON COLUMN ORDER_DETAIL.ODCOLOR IS '색상';
COMMENT ON COLUMN ORDER_DETAIL.ODSIZE IS '사이즈';
COMMENT ON COLUMN ORDER_DETAIL.ODCOUNT IS '수량';
COMMENT ON COLUMN ORDER_DETAIL.ODCOUPON IS '쿠폰 : 전체가격쿠폰';
COMMENT ON COLUMN ORDER_DETAIL.ODMILEAGE IS '마일리지';
COMMENT ON COLUMN ORDER_DETAIL.ORID IS '오더아이디';
COMMENT ON COLUMN ORDER_DETAIL.PID IS '상품아이디';
COMMENT ON TABLE PRODUCT IS '상품';
COMMENT ON COLUMN PRODUCT.PID IS '상품아이디';
COMMENT ON COLUMN PRODUCT.PPRICE IS '가격';
COMMENT ON COLUMN PRODUCT.PDISCOUNT IS '할인율';
COMMENT ON COLUMN PRODUCT.PIMAGE1 IS '대표이미지';
COMMENT ON COLUMN PRODUCT.PIMAGE2 IS '섬네일';
COMMENT ON COLUMN PRODUCT.PRDATE IS '등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN PRODUCT.PSELL IS '상품팔린수 : DEFAULT 0';
COMMENT ON COLUMN PRODUCT.SID IS '재고아이디';
COMMENT ON TABLE REVIEW IS '리뷰';
COMMENT ON COLUMN REVIEW.RID IS '리뷰아이디';
COMMENT ON COLUMN REVIEW.RPW IS '비밀번호';
COMMENT ON COLUMN REVIEW.RTITLE IS '리뷰제목';
COMMENT ON COLUMN REVIEW.RCONTENT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.RPHOTO1 IS '리뷰사진1';
COMMENT ON COLUMN REVIEW.RPHOTO2 IS '리뷰사진2';
COMMENT ON COLUMN REVIEW.RPHOTO3 IS '리뷰사진3';
COMMENT ON COLUMN REVIEW.RRDATE IS '리뷰등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN REVIEW.RHIT IS '리뷰추천수 : DEFAULT 0';
COMMENT ON COLUMN REVIEW.MID IS '아이디';
COMMENT ON COLUMN REVIEW.SID IS '재고아이디';
COMMENT ON TABLE STOCK IS '재고';
COMMENT ON COLUMN STOCK.SID IS '재고아이디';
COMMENT ON COLUMN STOCK.SNAME IS '상품명';
COMMENT ON COLUMN STOCK.SCOLOR IS '색상';
COMMENT ON COLUMN STOCK.SSIZE IS '사이즈';
COMMENT ON COLUMN STOCK.SAMOUNT IS '수량';
COMMENT ON COLUMN STOCK.SLEV IS 'slev';
COMMENT ON TABLE USERQNA IS '문의글';
COMMENT ON COLUMN USERQNA.QID IS '문의글아이디';
COMMENT ON COLUMN USERQNA.QCATE IS '문의글카테고리 : 1.상품 2.교환/환불 3.사이트이용 4.기타';
COMMENT ON COLUMN USERQNA.QPW IS '문의글비번';
COMMENT ON COLUMN USERQNA.QTITLE IS '문의글제목';
COMMENT ON COLUMN USERQNA.QCONTENT IS '문의글내용';
COMMENT ON COLUMN USERQNA.QFILE IS '문의글첨부';
COMMENT ON COLUMN USERQNA.QRDATE IS '문의글등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN USERQNA.QLEV IS '문의글처리여부 : 0.미처리 1.처리';
COMMENT ON COLUMN USERQNA.QREF IS '그룹번호';
COMMENT ON COLUMN USERQNA.QSTEP IS '글번호';
COMMENT ON COLUMN USERQNA.MID IS '아이디';
COMMENT ON COLUMN USERQNA.PID IS '상품아이디';


