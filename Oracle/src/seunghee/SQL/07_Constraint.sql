create table TEST_TABLE (
	id		varchar2(10) primary key,
	name	varchar2(20) not null,
	age		varchar2(10)
);

create table TEST_TABLE_2 (
	name	varchar2(20) primary key,
	addr	varchar2(20)
);

create table TEST_TABLE_1 (
	id		varchar2(10) primary key,
	name 	varchar2(20) references TEST_TABLE_2(name), 
	age		varchar2(10)
);

drop table TEST_TABLE_2;
drop table TEST_TABLE_1;

create table TEST_TABLE_2 (
	name 	varchar2(20) primary key,
	addr	varchar2(20)
);

create table TEST_TABLE_1 (
	id		varchar2(10) primary key,
	name	varchar2(20),
	age		varchar2(10)
);

alter table TEST_TABLE_1
	add constraint fk_1_2
		foreign key(name)
			references TEST_TABLE_2(name);

