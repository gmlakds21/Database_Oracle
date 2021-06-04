select * from EMPLOYEES;

select * from EMPLOYEES
	where rownum <= 5;

select * from (
	select rownum as rnum, A.* from (select * from EMPLOYEES) A
		where rownum <= 8)
	where rnum >= 3;

select * from EMPLOYEES
	order by EMPLOYEE_ID desc;

select * from EMPLOYEES
	 where EMPLOYEE_ID = 206

select * from EMPLOYEES
	where EMPLOYEE_ID < 205;
		
select * from EMPLOYEES
	where EMPLOYEE_ID between 100 and 110;
		
select * from EMPLOYEES
	where MANAGER_ID is null;

select * from EMPLOYEES
	where SALARY < 5000 and DEPARTMENT_ID = 50;
	
select * from EMPLOYEES
	where salary in(2400, 3300);
	
select * from EMPLOYEES
	where not department_id = 50; 
	
select * from EMPLOYEES
	where LAST_NAME like 'Ki%';