-- 1) 모든 도서의 이름과 가격을 조회하세요
select * from BOOKS;

-- 2) 모든 도서의 가격, 이름을 조회하세요
select PRICE as "가격", BOOKNAME as "이름" from BOOKS;

-- 3) 모든 도서의 출판사를 조회하세요
select PUBLISHER as "출판사" from BOOKS;

-- 4) 모든 도서의 출판사를 조회하세요 (중복제거)
select distinct(PUBLISHER) as "출판사" from BOOKS;

-- 5) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
select BOOKID "번호", BOOKNAME "이름", PUBLISHER "출판사" from BOOKS;

-- 6) 고객의 이름, 주소를 조회하세요
select NAME as "이름", ADDRESS as "주소" from BOOKMEMBERS;

-- 7) 가격이 20000미만인 도서를 조회하세요
select BOOKNAME as "도서명", PRICE as "가격" from BOOKS
	where PRICE < 20000;

-- 8) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select BOOKNAME as "도서명", PRICE as "가격" from BOOKS
	where PRICE between 15000 and 25000;
	
select BOOKNAME as "도서명", PRICE as "가격" from BOOKS
	where PRICE > 15000 and PRICE <=25000;
	
-- 9) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select BOOKNAME as "도서명", PUBLISHER as "출판사" from BOOKS
	where BOOKNAME in ('축구의 역사', '피겨 교본');
	
select BOOKNAME as "도서염", PUBLISHER as "출판사" from BOOKS
	where BOOKNAME = '축구의 역사' or BOOKNAME = '피겨 교본';
	
-- 10) '축구'로 시작하는 도서 이름을 조회하세요
select BOOKNAME as "도서명" from BOOKS
	where BOOKNAME like '축구%';
	
-- 11) '축구'로 끝나는 도서 이름을 조회하세요
select BOOKNAME as "도서명" from BOOKS
	where BOOKNAME like '%축구';
	
-- 12) '축구'를 포함하는 도서 이름을 조회하세요
select BOOKNAME as "도서명" from BOOKS
	where BOOKNAME like '%축구%';

-- 13) 도서이름 중에 '의'를 포함하는 책은?
select BOOKNAME as "도서명" from BOOKS
	where BOOKNAME like '%의%';
	
-- 14) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
select BOOKNAME as "도서명", PRICE as "가격" from BOOKS
	where BOOKNAME like '%골프%'
		and PRICE >= 30000;
	
-- 15) 고객이름을 가나다순으로 오름차순 정렬하고 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select NAME as "이름", ADDRESS as "주소" from BOOKMEMBERS
	order by NAME, ADDRESS desc;
	
-- 16) 도서의 가격을 내림차순으로, 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
select BOOKNAME as "도서명", PRICE as "가격", PUBLISHER as "출판사" from BOOKS
	order by PRICE desc, PUBLISHER;

-- 17) 출판사별 도서의 총 수량 조회하세요
select PUBLISHER as "출판사", count(BOOKID) as "총 수량" from BOOKS
	group by PUBLISHER;

-- 18) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
select PUBLISHER as "출판사", count(BOOKID) as "총 수량" from BOOKS
	group by PUBLISHER
		having count(BOOKID) >= 2;
	
-- 19) 고객이 주문한 도서의 총, 평균, 최고, 최저 판매액을 조회하세요
select NAME, sum(SALEPRICE), avg(SALEPRICE), max(SALEPRICE), min(SALEPRICE) from BOOKORDERS bo
	inner join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID
		group by NAME;
	
select NAME, sum(SALEPRICE), avg(SALEPRICE), max(SALEPRICE), min(SALEPRICE) from BOOKORDERS bo, BOOKMEMBERS bm
	where bo.CUSTID = bm.CUSTID
		group by NAME;
		
-- 20) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
select NAME, count(b.BOOKID) from BOOKORDERS bo
	inner join BOOKS b on b.BOOKID = bo.BOOKID
	inner join BOOKMEMBERS bm on bm.CUSTID = bo.CUSTID
		group by NAME
			having max(SALEPRICE) >= 8000;
		
select NAME, count(b.BOOKID) from BOOKS b, BOOKMEMBERS bm, BOOKORDERS bo
	where b.BOOKID = bo.BOOKID and bm.CUSTId = bo.CUSTID
		group by NAME
			having max(SALEPRICE) >= 8000;

-- 21) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
--      단, 고객별 2권이상 주문한 고객을 대상으로 한다
select NAME, count(b.BOOKID) from BOOKORDERS bo
	inner join BOOKS b on b.BOOKID = bo.BOOKID
	inner join BOOKMEMBERs bm on bm.CUSTID = bo.CUSTID
		group by NAME
			having max(SALEPRICE) >= 8000 and count(b.BOOKID) >= 2;
		
select NAME, count(b.BOOKID) from BOOKORDERS bo, BOOKS b, BOOKMEMBERS bm
	where b.BOOKID = bo.BOOKID and bm.CUSTID = bo.CUSTID
		group by NAME
			having max(SALEPRICE) >= 8000 and count(b.BOOKID) >= 2;
		
-- 22) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
select bo.ORDERID as "주문 번호", bm.CUSTID as "고객 번호", NAME as "고객 이름", PRICE as "주문 금액", ADDRESS as "주소" from BOOKS b
	inner join BOOKORDERS bo on bo.BOOKID = b.BOOKID
	inner join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID
		order by bo.ORDERID;
		
select bo.ORDERID as "주문 번호", bo.CUSTID as "고객 번호", NAME as "고객 이름", PRICE as "주문 금액", ADDRESS as "주소" from BOOKS b, BOOKORDERS bo, BOOKMEMBERS bm
	where b.BOOKID = bo.BOOKID and bo.CUSTID = bm.CUSTID
		order by bo.ORDERID;

-- 23) 주문한 도서이름,주문금액,주문일자를 조회하세요
select bo.ORDERID as "주문 번호", b.BOOKNAME as "도서 이름", b.PRICE as "주문 금액", bo.ORDERDATE as "주문 일자" from BOOKS b
	inner join BOOKORDERS bo on b.BOOKID = bo.BOOKID
		order by bo.ORDERID;

select bo.ORDERID as "주문 번호", b.BOOKNAME as "도서 이름", b.PRICE as "주문 금액", bo.ORDERDATE as "주문 일자" from BOOKS b, BOOKORDERS bo
	where b.BOOKID = bo.BOOKID
		order by bo.ORDERID;
		
-- 24) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
select bm.NAME as "주문자", bo.SALEPRICE as "주문 금액", bm.ADDRESS as "주소", bo.ORDERDATE as "주문 일자" from BOOKORDERS bo
	inner join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID
		where bm.NAME = '박지성';

select bm.NAME as "주문자", bo.SALEPRICE as "주문 금액", bm.ADDRESS as "주소", bo.ORDERDATE as "주문 일자" from BOOKORDERS bo, BOOKMEMBERS bm
	where bo.CUSTID = bm.CUSTID
		and bm.NAME = '박지성';
		
-- 25) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
select bm.NAME as "주문자", bo.SALEPRICE as "책 가격" from BOOKORDERS bo
	inner join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID
	inner join BOOKS b on bo.BOOKID = b.BOOKID
		where b.PRICE = 20000;

select bm.NAME as "주문자", bo.SALEPRICE as "책 가격" from BOOKORDERS bo, BOOKMEMBERS bm, BOOKS b
	where bo.CUSTID = bm.CUSTID and b.BOOKID = bo.BOOKID
		and b.PRICE = 20000;
		
-- 26) 도서를 구매한 고객의 고객이름과 주문한 도서의 판매금액을 조회하세요
select bo.ORDERID as "주문 번호", bm.NAME as "고객 이름", bo.SALEPRICE as "판매 금액" from BOOKORDERS bo
	inner join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID;
	
select bo.ORDERID as "주문 번호", bm.NAME as "고객 이름", bo.SALEPRICE as "판매 금액" from BOOKORDERS bo, BOOKMEMBERS bm
	where bo.CUSTID = bm.CUSTID;
		
-- 27) 도서를 구매하지 않은 고객을 포함하여 고객이름과 주문한 도서의 판매금액을 조회하세요
select bm.NAME as "고객 이름", bo.SALEPRICE as "판매 금액" from BOOKMEMBERS bm
	left join BOOKORDERS bo on bo.CUSTID = bm.CUSTID;

select bm.NAME as "고객 이름", bo.SALEPRICE as "판매 금액" from BOOKORDERS bo
	right join BOOKMEMBERS bm on bo.CUSTID = bm.CUSTID;

select bm.NAME as "고객 이름", bo.SALEPRICE as "판매 금액" from BOOKMEMBERS bm, BOOKORDERS bo
	where bo.CUSTID(+) = bm.CUSTID;
		
-- 28) 주문 테이블에서 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 조회하세요
select u.AGE as "나이", p.PRO_NAME as "주문 제품", o.ORDER_TIME as "주문 일자" from ORDER_TABLE o
	inner join PRODUCT p on p.PRO_NO = o.PRO_NO
	inner join USERS u on o.USER_ID = u.USER_ID
		where u.AGE >= 30;

select u.AGE as "나이", p.PRO_NAME as "주문 제품", o.ORDER_TIME as "주문 일자" from ORDER_TABLE o, PRODUCT p, USERS u
	where p.PRO_NO = o.PRO_NO and u.USER_ID = o.USER_ID
		and u.AGE >= 30;
		
-- 29) 주문 테이블에서 고명석 고객이 주문한 제품의 이름을 조회하세요
select u.NAME as "이름", p.PRO_NAME as "주문 제품" from USERS u
	inner join ORDER_TABLE o on u.USER_ID = o.USER_ID
	inner join PRODUCT p on o.PRO_NO = p.PRO_NO
		where u.NAME = '고명석';
		
select u.NAME as "이름", p.PRO_NAME as "주문 제품" from USERS u, ORDER_TABLE o, PRODUCT p
	where u.USER_ID = o.USER_ID and p.PRO_NO = o.PRO_NO
		and u.NAME = '고명석';
		
-- 30) 주문하지 않은 고객의 이름을 조회하세요
select u.NAME as "이름", o.ORD_NO as "주문 번호" from USERS u
	left join ORDER_TABLE o on u.USER_ID = o.USER_ID
		where o.ORD_NO is null;
		
select u.NAME as "이름", o.ORD_NO as "주문 번호" from ORDER_TABLE o
	right join USERS u on u.USER_ID = o.USER_ID
		where o.ORD_NO is null;
		
select u.NAME as "이름", o.ORD_NO as "주문 번호" from USERS u, ORDER_TABLE o
	where u.USER_ID = o.USER_ID(+)
		and o.ORD_NO is null;
		
-- 31) 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 조회
select PRO_NAME as "제품 명", PRICE as "단가", BRAND as "제조업체",
	(select max(PRICE) from PRODUCT where BRAND = '대한식품') as "최고 단가"
	from PRODUCT
		where PRICE > (select max(PRICE) from PRODUCT where BRAND = '대한식품');

-- 32) 2019년 3월 15일에 제품을 주문한 고객의 이름 조회
select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u
	inner join ORDER_TABLE o on o.USER_ID = u.USER_ID
		where o.ORDER_TIME = '2019-03-15';

select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u, ORDER_TABLE o
	where o.USER_ID = u.USER_ID
		and o.ORDER_TIME = '2019-03-15';

select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u
	inner join ORDER_TABLE o on o.USER_ID = u.USER_ID
		where to_char(ORDER_TIME, 'YYYY') = '2019'
			and to_char(ORDER_TIME, 'mm') = '03'
			and to_char(ORDER_TIME, 'dd') = '15';

	-- 날짜가 yy/mm/dd 형태로 바뀜
select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u
	inner join ORDER_TABLE o on o.USER_ID = u.USER_ID
		where substr(ORDER_TIME, 1, 2) = '19'
			and substr(ORDER_TIME, 4, 2) = '03'
			and substr(ORDER_TIME, 7, 2) = '15';
			
-- 33) 2019년 3월 15일에 제품을 주문하지 않은 고객의 이름 조회
select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u
	inner join ORDER_TABLE o on o.USER_ID = u.USER_ID
		where o.ORDER_TIME <> '2019-03-15';
			
select u.NAME as "이름", o.ORDER_TIME as "주문 일자" from USERS u, ORDER_TABLE o
	where u.USER_ID = o.USER_ID
		and o.ORDER_TIME <> '2019-03-15';
			
-- 33) vip 고객의 아이디, 이름, 나이로 구성된 뷰 생성 단, 이름은 우수고객으로 작성
create view "우수고객" as
	(select USER_ID as "아이디", NAME as "이름", AGE as "나이" from  USERS);

-- 40) 제조업체별 제품수로 구성된 뷰 생성, 뷰 이름은 업체별 제품수로 지정
create view  "업체별 제품수" as
	(select BRAND as "제조업체", count(PRO_NO) as "제품수" from PRODUCT
		group by BRAND); 

-- 41) 우수고객 테이블에서 나이가 25세 이상인 회원 조회
select 이름, 나이 from 우수고객
	where 나이 >= 25;