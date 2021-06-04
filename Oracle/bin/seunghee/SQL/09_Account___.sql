create user USER
	identified by PASSWORD;
	
grant
	create user,
	create session,
	create table,
	create view,
	create sequence,
	create proceduser
		to USER;