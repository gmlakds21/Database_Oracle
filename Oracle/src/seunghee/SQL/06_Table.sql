create table TEST_TABLE (
	NAME varchar2(20),
	AGE integer
);

select * from TEST_TABLE;

alter table TEST_TABLE
	add phone varchar2(15);

select * from TEST_TABLE;
	
alter table TEST_TABLE
	rename column phone to PHONE2;

select * from TEST_TABLE;
	
drop table TEST_TABLE;

select * from TEST_TABLE;