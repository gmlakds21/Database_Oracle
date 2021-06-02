select DEPARTMENT_ID from DEPARTMENTS
	where LOCATION_ID = 1700;

select EMPLOYEE_ID from EMPLOYEES
	where DEPARTMENT_ID in (10, 30, 90, 100, 110);

select EMPLOYEE_ID from EMPLOYEES
	where DEPARTMENT_ID in
		(select DEPARTMENT_ID from DEPARTMENTS
			where LOCATION_ID = 1700);

select EMPLOYEE_ID from EMPLOYEES
	where DEPARTMENT_ID in
		(select DEPARTMENT_ID from DEPARTMENTS
			where LOCATION_ID in
				(select LOCATION_ID from LOCATIONS
					where CITY = 'London'));

select DEPARTMENT_ID,
	(select count(*) from EMPLOYEES e
		where e.DEPARTMENT_ID = d.DEPARTMENT_ID) as countable
	from DEPARTMENTS d;
	
select DEPARTMENT_ID, count(EMPLOYEE_ID) from EMPLOYEES
	group by DEPARTMENT_ID;