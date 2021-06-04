select * from EMPLOYEES e, DEPARTMENTS d
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select * from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;
		
select * from EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID
		and d.LOCATION_ID = l.LOCATION_ID;
		
select * from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;
	
select * from EMPLOYEES e1, EMPLOYEES e2
	where e1.MANAGER_ID = e2.EMPLOYEE_ID;

select * from EMPLOYEES e1
	inner join EMPLOYEES e2 on e1.MANAGER_ID = e2.EMPLOYEE_ID;

select * from EMPLOYEES e
	right outer join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;
		
select * from EMPLOYEES e
	right outer join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		where e.DEPARTMENT_ID is null;
		
select * from EMPLOYEES e, DEPARTMENTS d
	where (e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID)
		and e.DEPARTMENT_ID is null;

select * from EMPLOYEES e
	full join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;