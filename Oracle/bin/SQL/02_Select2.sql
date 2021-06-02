select LAST_NAME || FIRST_NAME from EMPLOYEES;

select SALARY*1.2 from EMPLOYEES;

select count(EMPLOYEE_ID) from EMPLOYEES;

select max(SALARY) from EMPLOYEES;

select avg(SALARY) from EMPLOYEES;

select distinct(department_id) from EMPLOYEES;

select DEPARTMENT_ID, count(EMPLOYEE_ID) from EMPLOYEES
	group by DEPARTMENT_ID;

select DEPARTMENT_ID, count(EMPLOYEE_ID) from EMPLOYEES
	group by DEPARTMENT_ID
		having count(EMPLOYEE_ID) >= 10;