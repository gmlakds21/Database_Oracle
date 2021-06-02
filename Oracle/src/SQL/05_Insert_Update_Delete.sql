select * from EMPLOYEES where rownum = 1;
select JOB_ID from JOBS;
select MANAGER_ID from DEPARTMENTS;
select DEPARTMENT_ID from DEPARTMENTS;

insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, MANAGER_ID, DEPARTMENT_ID, HIRE_DATE)
	values (1100, 'Steven2', 'King', 'SKING2', 'AC_ACCOUNT', 200, 10, sysdate);

select * from EMPLOYEES where EMPLOYEE_ID = '1100';

update EMPLOYEES set FIRST_NAME = 'Steven3'
	where EMPLOYEE_ID = 1100;

select * from EMPLOYEES where EMPLOYEE_ID = '1100';

delete from EMPLOYEES where EMPLOYEE_ID = '1100';

select * from EMPLOYEES where EMPLOYEE_ID = '1100';
