-- 1. 모든 사원의 이름(last_name, first_name)을 조회하라.
select LAST_NAME, FIRST_NAME from EMPLOYEES;

-- 2. 모든 사원의 모든 정보를 조회하라.
select * from EMPLOYEES;

-- 3. 모든 도시 명을 조회하라.
select distinct(CITY) from LOCATIONS;

-- 4. 이름(last_name)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select * from EMPLOYEES
	where LAST_NAME like 'M%';

-- 5. 이름(last_name)의 두 번째 글자가 'a'인 사원의 이름(last_name)과 연봉을 조회하라.
select LAST_NAME, SALARY from EMPLOYEES
	where LAST_NAME like '_a%';
	
-- 6. 도시 명을 오름차순 정렬하라.
select distinct(CITY) from LOCATIONS
	order by CITY;

-- 7. 부서 명을 내림차순 정렬하라.
select distinct(DEPARTMENT_NAME) from DEPARTMENTS
	order by DEPARTMENT_NAME desc;
	
-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
select * from EMPLOYEES
	where SALARY >= 7000
		order by SALARY;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES
	where COMMISSION_PCT is null;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES
	where COMMISSION_PCT is not null;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(last_name, first_name) 그리고 부서번호를 조회하라.
select EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE from EMPLOYEES
	where HIRE_DATE = '2007-06-21';
	
select EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE from EMPLOYEES
	where to_char(HIRE_DATE, 'yyyy') = '2007'
		and to_char(HIRE_DATE, 'mm') = '06'
		and to_char(HIRE_DATE, 'dd') = '21';
		
select EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE from EMPLOYEES
	where substr(HIRE_DATE, 1, 2) = '07'
		and substr(HIRE_DATE, 4, 2) = '06'
		and substr(HIRE_DATE, 7, 2) = '21';
		
-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
select EMPLOYEE_ID, HIRE_DATE from EMPLOYEES
	where HIRE_DATE like '06%';

select EMPLOYEE_ID, HIRE_DATE from EMPLOYEES
	where to_char(HIRE_DATE, 'yyyy') = '2006';
	
select EMPLOYEE_ID, HIRE_DATE from EMPLOYEES
	where substr(HIRE_DATE, 1, 2) = '06';
	
-- 13. 이름(last_name)의 길이가 5글자 이상인 사원을 조회하라.
select LAST_NAME from EMPLOYEES
	where LAST_NAME like '_____%';

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 first_name 및 연봉을 조회힌다.
select FIRST_NAME, SALARY from EMPLOYEES
	where SALARY between 5000 and 12000
		order by SALARY;
	
select FIRST_NAME, SALARY from EMPLOYEES
	where SALARY >= 5000
		and SALARY <= 12000
		order by SALARY;
	
-- 15. 사원번호가 176 인 사람의 first_name 과 부서 번호를 조회한다.
select FIRST_NAME, DEPARTMENT_ID, EMPLOYEE_ID from EMPLOYEES
	where EMPLOYEE_ID = 176

-- 16. 연봉이 12000 이상되는 직원들의 first_name 및 연봉을 조회한다.
select FIRST_NAME, SALARY from EMPLOYEES
	where SALARY >= 12000
		order by SALARY;

-- 17. 2004년도에 고용된 모든 사람들의 first_name 및 고용일을 조회한다.
select FIRST_NAME, HIRE_DATE from EMPLOYEES
	where HIRE_DATE like '04/%';
	
select FIRST_NAME, HIRE_DATE from EMPLOYEES
	where to_char(HIRE_DATE, 'yyyy') = '2004';

select FIRST_NAME, HIRE_DATE from EMPLOYEES
	where substr(HIRE_DATE, 1, 2) = '04';
	
-- 18. 매니저가 없는 사람들의 first_name 및 JOB_ID 를 조회한다.
select FIRST_NAME, JOB_ID, MANAGER_ID from EMPLOYEES
	where MANAGER_ID is null;

-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.
select LAST_NAME, SALARY, COMMISSION_PCT from EMPLOYEES
	where COMMISSION_PCT is not null
		order by SALARY desc, COMMISSION_PCT desc;
	
-- 20. first_name 의 네번째 글자가 a 인 사원들의 first_name 을 조회한다.
select FIRST_NAME from EMPLOYEES
	where FIRST_NAME like '___a%';

-- 21. first_name 에 a 및(OR) e 글자가 있는 사원들의 first_name 을 조회한다.
select FIRST_NAME from EMPLOYEES
	where FIRST_NAME like '&a%'
		or FIRST_NAME like '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select FIRST_NAME, SALARY, JOB_ID from EMPLOYEES
	where SALARY not in (2,500, 3,500, 7000)
		and JOB_ID in ('SA_REP', 'ST_CLERK');
		
-- 23. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
select max(SALARY), min(SALARY), sum(SALARY), floor(avg(SALARY)) from EMPLOYEES

-- 24. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
select JOB_ID, max(SALARY), min(SALARY), sum(SALARY), floor(avg(SALARY)) from EMPLOYEES
	group by JOB_ID;

-- 25. 동일한 직업을 가진 사원들의 총 수를 조회한다.
select JOB_ID, count(EMPLOYEE_ID) from EMPLOYEES
	group by JOB_ID;

-- 26. 매니저로 근무하는 사원들의 총 수를 조회한다.
select count(distinct(MANAGER_ID)) from EMPLOYEES;
	
-- 27. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
select max(SALARY) - min(SALARY) from EMPLOYEES;

-- 28. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.
select MANAGER_ID, min(SALARY) from EMPLOYEES
	where MANAGER_ID is not null
		group by MANAGER_ID
			having min(SALARY) >= 6000
				order by min(SALARY) desc;

-- 29. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다. 평균 연봉은 소수점 2 자리까지만 표현한다.
select d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID), floor(avg(e.SALARY)) from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		group by DEPARTMENT_NAME;

select d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID), floor(avg(e.SALARY)) from EMPLOYEES e, DEPARTMENTS d
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID
		group by DEPARTMENT_NAME;
								
-- 30. 총 사원 수 및 2004, 2005, 2006, 2007 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.
select
	(select count(EMPLOYEE_ID) from EMPLOYEES) as "total",
	(select count(EMPLOYEE_ID) from EMPLOYEES where to_char(HIRE_DATE, 'yyyy') = '2004') as "2004",
	(select count(EMPLOYEE_ID) from EMPLOYEES where to_char(HIRE_DATE, 'yyyy') = '2005') as "2005",
	(select count(EMPLOYEE_ID) from EMPLOYEES where to_char(HIRE_DATE, 'yyyy') = '2006') as "2006",
	(select count(EMPLOYEE_ID) from EMPLOYEES where to_char(HIRE_DATE, 'yyyy') = '2007') as "2007"
		from dual;

-- 31. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
select DEPARTMENT_ID, count(EMPLOYEE_ID) from EMPLOYEES
	where DEPARTMENT_ID is not null
		group by DEPARTMENT_ID
			order by DEPARTMENT_ID;

-- 32.  각 부서별 각 직업 별 연봉 총 합 및 평균 연봉을 조회한다.
select DEPARTMENT_ID, JOB_ID, sum(SALARY), floor(avg(SALARY)) from EMPLOYEES
	where DEPARTMENT_ID is not null and JOB_ID is not null
		group by DEPARTMENT_ID, JOB_ID
			order by DEPARTMENT_ID, JOB_ID;
		
-- 33) 모든 사원들의 first_name, 부서 이름 및 부서 번호을 조회하세요
select e.FIRST_NAME, d.DEPARTMENT_NAME, d.DEPARTMENT_ID from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	
select e.FIRST_NAME, d.DEPARTMENT_NAME, d.DEPARTMENT_ID from EMPLOYEES e, DEPARTMENTS d
	where d.DEPARTMENT_ID = e.DEPARTMENT_ID;

select e.FIRST_NAME, d.DEPARTMENT_NAME, DEPARTMENT_ID from EMPLOYEES e
	inner join DEPARTMENTS d using (DEPARTMENT_ID);
	
-- 34) 부서번호 30의 모든 직업들과 부서명으로 조회하세요. 90 부서 또한 포함한다.
select e.DEPARTMENT_ID, e.JOB_ID, d.DEPARTMENT_NAME from DEPARTMENTS d
	inner join EMPLOYEES e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		where e.DEPARTMENT_ID in (30, 90);
	
select DEPARTMENT_ID, e.JOB_ID, d.DEPARTMENT_NAME from DEPARTMENTS d
	inner join EMPLOYEES e using (DEPARTMENT_ID)
		where DEPARTMENT_ID in (30, 90);

select e.DEPARTMENT_ID, e.JOB_ID, d.DEPARTMENT_NAME from DEPARTMENTS d, EMPLOYEES e
	where d.DEPARTMENT_ID = e.DEPARTMENT_ID
		and e.DEPARTMENT_ID in (30, 90);
	
-- 35) 부서번호 30 이하의 모든 직업들과 부서명으로 조회하세요
select d.DEPARTMENT_ID, e.JOB_ID, d.DEPARTMENT_NAME from EMPLOYEES e, DEPARTMENTS d		
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID
		and e.DEPARTMENT_ID <= 30
		order by d.DEPARTMENT_ID;
		
select d.DEPARTMENT_ID, e.JOB_ID, d.DEPARTMENT_NAME from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		where e.DEPARTMENT_ID <= 30
			order by d.DEPARTMENT_ID;

select DEPARTMENT_Id, e.JOB_ID, d.DEPARTMENT_NAME from EMPLOYEES e
	inner join DEPARTMENTS d using (DEPARTMENT_ID)
		where DEPARTMENT_ID <= 30
			order by DEPARTMENT_ID;
				
-- 36) 커미션을 버는 모든 사람들의 first_name, 부서명, 지역 ID 및 도시 명을 조회하세요
select e.FIRST_NAME, d.DEPARTMENT_NAME, l.LOCATION_ID, l.CITY, e.COMMISSION_PCT from EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
	where d.DEPARTMENT_ID = e.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID
		and e.COMMISSION_PCT is not null;

select e.FIRST_NAME, d.DEPARTMENT_NAME, l.LOCATION_ID, l.CITY, e.COMMISSION_PCT from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
		where e.COMMISSION_PCT is not null;

select FIRST_NAME, DEPARTMENT_NAME, LOCATION_ID, CITY, COMMISSION_PCT from EMPLOYEES
	inner join DEPARTMENTS using (DEPARTMENT_ID)
	inner join LOCATIONS using (LOCATION_ID)
		where COMMISSION_PCT is not null;
			
-- 37) 커미션을 버는 사람들 중 Oxford 에 거주하는 사람들의 first_name, 부서명, 지역 ID 및 도시 명을 조회하세요
select e.FIRST_NAME, d.DEPARTMENT_NAME, l.LOCATION_ID, l.CITY, e.COMMISSION_PCT from EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID and l.LOCATION_ID = d.LOCATION_ID
		and e.COMMISSION_PCT is not null
			and l.CITY = 'Oxford';

select e.FIRST_NAME, d.DEPARTMENT_NAME, l.LOCATION_ID, l.CITY, e.COMMISSION_PCT from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
		where e.COMMISSION_PCT is not null
			and l.CITY = 'Oxford';

select FIRST_NAME, DEPARTMENT_NAME, LOCATION_ID, CITY, COMMISSION_PCT from EMPLOYEES
	inner join DEPARTMENTS using (DEPARTMENT_ID)
	inner join LOCATIONS using (LOCATION_ID)
		where COMMISSION_PCT is not null
			and CITY = 'Oxford';
			
-- 38) 자신의 매니저보다 먼저 고용된 사원들의 first_name 및 고용일을 조회하세요.
select e1.FIRST_NAME, e1.HIRE_DATE, e2.HIRE_DATE from EMPLOYEES e1, EMPLOYEES e2
	where e1.MANAGER_ID = e2.EMPLOYEE_ID
		and e1.HIRE_DATE < e2.HIRE_DATE;
			
select e1.FIRST_NAME, e1.HIRE_DATE, e2.HIRE_DATE from EMPLOYEES e1
	inner join EMPLOYEES e2 on e1.MANAGER_ID = e2.EMPLOYEE_ID
		where e1.HIRE_DATE < e2.HIRE_DATE;

-- 39) 부서별 사원수를 조회하세요 단, 부서명도 함께 출력합니다
select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID) from EMPLOYEES e, DEPARTMENTS d
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID
		group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME
			order by d.DEPARTMENT_ID;

select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID) from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME
			order by d.DEPARTMENT_ID;

select DEPARTMENT_ID, DEPARTMENT_NAME, count(EMPLOYEE_ID) from EMPLOYEES
	inner join DEPARTMENTS using (DEPARTMENT_ID)
		group by DEPARTMENT_ID, DEPARTMENT_NAME
			order by DEPARTMENT_ID;
			
-- 40) 부서별 사원수를 조회하세요 단, 부서명도 함께 출력하고 단, 사원수가 0이어도 부서명을 출력합니다
select d.DEPARTMENT_ID, count(e.EMPLOYEE_ID), d.DEPARTMENT_NAME from EMPLOYEES e, DEPARTMENTS d
	where e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID
		group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME
			order by d.DEPARTMENT_ID;

select d.DEPARTMENT_ID, count(e.EMPLOYEE_ID), d.DEPARTMENT_NAME from EMPLOYEES e
	right join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
		group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME
			order by d.DEPARTMENT_ID;

select DEPARTMENT_ID, count(EMPLOYEE_ID), DEPARTMENT_NAME from EMPLOYEES
	right join DEPARTMENTS using (DEPARTMENT_ID)
		group by DEPARTMENT_ID, DEPARTMENT_NAME
			order by DEPARTMENT_ID;
			
-- 41) first_name 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--      단, Zlotkey 는 제외한다.
select EMPLOYEE_ID, HIRE_DATE from EMPLOYEES
	where DEPARTMENT_ID = (select DEPARTMENT_ID from EMPLOYEES
								where FIRST_NAME = (select FIRST_NAME from EMPLOYEES
															where LAST_NAME = 'Zlotkey'));
	
-- 42) 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 first_name 을 조회한다.
select EMPLOYEE_ID, FIRST_NAME, SALARY from EMPLOYEES
	where SALARY > (select avg(SALARY) from EMPLOYEES)
		order by SALARY;

-- 43) first_name 에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 first_name 을 조회한다.
select EMPLOYEE_ID, FIRST_NAME from EMPLOYEES
	where DEPARTMENT_ID in (select DEPARTMENT_ID from EMPLOYEES
								where FIRST_NAME like '%u%');

-- 44) King 을 매니저로 두고 있는 모든 사원들의 first_name 및 연봉을 조회한다. 즉, King의 부하직원의 성과 연봉 조회하라
select FIRST_NAME, SALARY from EMPLOYEES
	where MANAGER_ID in (select EMPLOYEE_ID from EMPLOYEES
							where LAST_NAME = 'King');

-- 45) EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, first_name, JOB_ID를  조회한다.
select FIRST_NAME, JOB_ID from EMPLOYEES
	where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS
								where DEPARTMENT_NAME = 'Executive';
							
							
-- 46) 회사 전체 평균 연봉보다 더 버는 사원들 중
--  first_name 에 u 가 있는 사원들이 근무하는 부서에서
--  근무하는 사원들의 사번, first_name 및 연봉을 조회한다.
select EMPLOYEE_ID, FIRST_NAME, SALARY from EMPLOYEES
	where DEPARTMENT_ID in (select DEPARTMENT_ID from EMPLOYEES where FIRST_NAME like '%u%')
		and SALARY > (select avg(SALARY) from EMPLOYEES)

-- 47-1) 직업 ID 가 SA_MAN 인 사원들의 최대 연봉보다
--      높게 받는 사원들의 first_name, JOB_ID 및 연봉을 조회한다.
select FIRST_NAME, JOB_ID, SALARY from EMPLOYEES
	where SALARY > (select max(SALARY) from EMPLOYEES where JOB_ID = 'SA_MAN');

-- 47-2) 직업 ID 가 SA_MAN 인 모든 사원들의 연봉보다
--      높게 받는 사원들의 first_name, JOB_ID 및 연봉을 조회한다.
select FIRST_NAME, JOB_ID, SALARY from EMPLOYEES
	where SALARY > all (select max(SALARY) from EMPLOYEES where JOB_ID = 'SA_MAN');

-- 48) 도시 이름이 T 로 시작하는 지역에 근무하는 사원들의 사번, first_name 및 부서 번호를 조회한다.
select EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID from EMPLOYEES
	where DEPARTMENT_ID in (select DEPARTMENT_ID from DEPARTMENTS
								where LOCATION_ID in (select LOCATION_ID from LOCATIONS
														where CITY like 'T%'));

select e.EMPLOYEE_ID, e.FIRST_NAME, e.DEPARTMENT_ID from EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID
		and l. CITY like 'T%';
		
select e.EMPLOYEE_ID, e.FIRST_NAME, e.DEPARTMENT_ID from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
		where l.CITY like 'T%';
		
select EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID from EMPLOYEES
	inner join DEPARTMENTS using (DEPARTMENT_ID)
	inner join LOCATIONS using (LOCATION_ID)
		where CITY like 'T%';

-- 49) 사원 테이블에서 사원 이름을 소문자로 출력하세요
select lower(FIRST_NAME) from EMPLOYEES;

-- 50) 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요.
select initcap(FIRST_NAME) from EMPLOYEES;

-- 51) 사원 테이블에서 사원 이름의 길이를 출력하세요.
select length(FIRST_NAME) from EMPLOYEES;

-- 52) 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요.
select instr(lower(FIRST_NAME), 'a'), FIRST_NAME from EMPLOYEES;

-- 53)사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를 출력하세요.
select * from EMPLOYEES where FIRST_NAME like '__r%';

-- 54) 사원 테이블에서 이름의 끝자리가 N으로 끝나는 사원의 정보를 출력하세요.
select * from EMPLOYEES	where FIRST_NAME like '%n';

-- 55) 사원들의 급여가 평균보다 큰 경우 '평균급여이상' 이라 출력하고 아닌 경우 '평균급여이하' 라고 출력하세요 ---------------------------------------------------------------------------------------------
select FIRST_NAME, if( SALARY>6461, '평균급여이상', '평균급여이하') from EMPLOYEES;

select avg(SALARY) from EMPLOYEES;

-- 56) 사원의 급여에 대해 평균을 계산하고 정수로 변환해서 출력하세요
select cast(avg(SALARY) as integer) from EMPLOYEES;

-- 57) 사원들을 입사일자가 빠른 순으로 정렬한 뒤
--      본인보다 입사일자가 빠른 사원의 급여를 본인의 급여와 함께 출력하세요
select lag(FIRST_NAME) over(order by HIRE_DATE), SALARY from EMPLOYEES;

-- 58) AND 나 BETWEEN 을 사용하지 않고 2002 년도에 입사한 직원의 이름과 월급을 출력하세요.
select FIRST_NAME, SALARY, HIRE_DATE from EMPLOYEES
	where HIRE_DATE like '02%';

select FIRST_NAME, SALARY, HIRE_DATE from EMPLOYEES
	where to_char(HIRE_DATE, 'yyyy') = '2002';
	
select FIRST_NAME, SALARY, HIRE_DATE from EMPLOYEES
	where substr(HIRE_DATE, 1, 2) = '02';
	
-- 59) 사원 테이블에서 사원의 이름이 5글자인 사원의 이름을 첫글자만 대문자로 출력하세요.
select initcap(FIRST_NAME) from EMPLOYEES
	where length(FIRST_NAME) = 5;

-- 60) 사원 테이블에서 이름과 입사일자 그리고 현재날까지의 경과일을 산출하세요 (소숫점을 빼버리고 해딩이름을 경과일로 바꾸세요)
select FIRST_NAME, HIRE_DATE, floor(sysdate - HIRE_DATE) as "경과일" from EMPLOYEES;

-- 61) 이전문제에서 경과일을 개월수로 바꿔서 산출하세요. 소숫점을 빼버리고 해당이름을 경과개월수로 바꾸세요
select FIRST_NAME, HIRE_DATe, floor(months_between(sysdate, HIRE_DATE)) from EMPLOYEES;

-- 62) 사원 테이블에서 입사후 6개월이 지난날짜 바로 다음 일요일을 구하세요.
select
	FIRST_NAME,
	HIRE_DATE,
	add_months(HIRE_DATE, 6), -- 6개월 추가
	next_day(add_months(HIRE_DATE, 6), 1) -- 해당 날짜로 부터 다음 월요일 (1 = 월요일)
		from EMPLOYEES

-- 63) 오늘날짜를 "xx년 xx월 xx일" 형식으로 출력하세요
select to_char(sysdate, 'yy"년 "mm"월 "dd"일"') from dual;

-- 64) 지금 현재 '몇시 몇분' 인지 출력하세요.
select to_char(sysdate, 'hh:mi') from dual;

-- 65) 이번 년도 12월 31일까지 몇일이 남았는지 출력하세요.
select floor(to_date(to_char(sysdate, 'yy')+1||'-01-01')-sysdate) from dual;

-- 66) 사원들의 입사일에서 입사 년도와 입사 달을 조회하세요
select HIRE_DATE, to_char(HIRE_DATE, 'yyyy') as "입사 년도", to_char(HIRE_DATE, 'mm') as "입사 달" from EMPLOYEES;

-- 67) 9월에 입사한 사원을 조회하세요
select FIRST_NAME, HIRE_DATE from EMPLOYEES
	where to_char(HIRE_DATE, 'mm') = '09';

select FIRST_NAME, HIRE_DATE from EMPLOYEES
	where HIRE_DATE like '%/09/%';

-- 68) 사원들의 입사일을 출력하되, 요일까지 함께 조회하세요
select FIRST_NAME, HIRE_DATE, to_char(HIRE_DATE, 'day') from EMPLOYEES;
	
-- 69) 사원들의 급여를 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 조회하세요
select FIRST_NAME, ltrim(to_char(SALARY, '$9,999,999')) from EMPLOYEES;

-- 70) 사원들의 급여를 10자리로 출력하되 자릿수가 남는 경우 빈칸으로 채워서 조회하세요
select FIRST_NAME, to_char(SALARY, '$9,999,999,999') from EMPLOYEES;

-- 71) 각 사원들의 근무한 개월 수를 현재를 기준으로 구하세요
select FIRST_NAME, floor(months_between(sysdate, HIRE_DATE)) from EMPLOYEES;

-- 72) 각 사원들의 입사일에서 4개월을 추가한 날짜를 조회하세요
select FIRST_NAME, add_months(HIRE_DATE, 4), HIRE_DATE from EMPLOYEES;

-- 73) 각 사원들의 입사한 달의 마지막 날을 조회하세요
select FIRST_NAME, last_day(HIRE_DATE), HIRE_DATE from EMPLOYEES;
