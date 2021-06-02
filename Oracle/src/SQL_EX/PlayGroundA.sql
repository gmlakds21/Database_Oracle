Create table users (
    user_id	varchar2(10) primary key,
    name 	char(10),
    age 	int,
    grade	varchar2(10) default 'bronze',
    job		varchar2(20),
    mileage int
);

insert into users values ('apple', '정소화', 20, 'gold', '학생', 	1000);
insert into users values ('banana', '김선우', 25, 'vip', '간호사', 2500);
insert into users values ('carrot', '고명석', 28, 'gold', '교사', 4500);
insert into users values ('orange', '김용욱', 22, 'silver', '학생', 0);
insert into users values ('melon', '성원용', 35, 'gold', '회사원', 5000);
insert into users values ('peach', '오형준', NULL, 'silver', '의사', 	300);
insert into users values ('pear', '채광주', 31, 'silver', '회사원', 500);

Create table product (
    pro_no		varchar2(3)	primary key,
    pro_name 	varchar2(30),
    stock		int,
    price		int,
    brand		varchar2(30)
);

insert into product values ('p01', '그냥만두', 5000, 4500, '대한식품');
insert into product values ('p02', '매운쫄면', 2500, 5500, '민국푸드');
insert into product values ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
insert into product values ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
insert into product values ('p05', '얼큰라면', 2200, 1200, '대한식품');
insert into product values ('p06', '통통우동', 1000, 1550, '민국푸드');
insert into product values ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

Create table order_table (
    ord_no		varchar2(3)	primary key,
    user_id		varchar2(10),
    pro_no		varchar2(3),
    amount		int,
    address 	varchar2(20),
    order_time	date,
    foreign key (user_id) references users (user_id),
    foreign key (pro_no)  references product (pro_no)
);

insert into order_table values ('o01', 'apple',	'p03', 10, '서울시 마포구', '2019-01-01');
insert into order_table values ('o02', 'melon', 'p01', 5, '인천시 계양구', '2019-01-10');
insert into order_table values ('o03', 'banana', 'p06', 45,	'경기도 부천시', '2019-01-11');
insert into order_table values ('o04', 'carrot', 'p02', 8, '부산시 금정구', '2019-02-01');
insert into order_table values ('o05', 'melon', 'p06', 36, '경기도 용인시', '2019-02-20');
insert into order_table values ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2019-03-02');
insert into order_table values ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2019-03-15');
insert into order_table values ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2019-04-10');
insert into order_table values ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2019-04-11');
insert into order_table values ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2019-05-22');



Create table Books (
    bookid		int			primary key,
    bookname	varchar2(50),
    publisher	varchar2(50),
    price		int
);

insert into Books values (1, '축구의 역사', '굿스포츠', 7000);
insert into Books values (2, '축구하는 여자', '나무수', 13000);
insert into Books values (3, '축구의 이해', '대한미디어', 22000);
insert into Books values (4, '골프 바이블', '대한미디어', 35000);
insert into Books values (5, '피겨교본', '굿스포츠', 8000);
insert into Books values (6, '역도 단계별 기술', '굿스포츠', 6000);
insert into Books values (7, '야구의 추억', '이상미디어', 20000);
insert into Books values (8, '야구를 부탁해', '이상미디어', 13000);
insert into Books values (9, '올림픽 이야기', '삼성당', 7500);
insert into Books values (10, 'Olympic Champions', 'Pearson', 13000);

Create table BookMembers (
    custid	int			primary key,
    name	varchar2(10),
    address	varchar2(50),
    phone	varchar2(50)
);

insert into BookMembers values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into BookMembers values (2, '김연아', '대한민국 서울', '000-6000-0001');
insert into BookMembers values (3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into BookMembers values (4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into BookMembers values (5, '박세리', '대한민국 대전', NULL);

Create table BookOrders (
    orderid		int 	primary key,
    custid		int,
    bookid		int,
    saleprice	int,
    orderdate	date,
    foreign key	(bookid)
        references Books (bookid),
    foreign key (custid)
        references BookMembers (custid)
);

insert into BookOrders values ( 1,1,1, 6000, '2014-07-01');
insert into BookOrders values ( 2,1,3, 21000, '2014-07-03');
insert into BookOrders values ( 3,2,5, 8000, '2014-07-03');
insert into BookOrders values ( 4,3,6, 6000, '2014-07-04');
insert into BookOrders values ( 5,4,7, 20000, '2014-07-05');
insert into BookOrders values ( 6,1,2, 12000, '2014-07-07');
insert into BookOrders values ( 7,4,8, 13000, '2014-07-07');
insert into BookOrders values ( 8,3,10, 12000, '2014-07-08');
insert into BookOrders values ( 9,2,10, 7000, '2014-07-09');
insert into BookOrders values (10,3,8, 13000, '2014-07-10');