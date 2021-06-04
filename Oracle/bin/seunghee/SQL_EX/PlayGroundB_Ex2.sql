-- 1. 직원 employees 의 모든 정보를 조회하세요
select * from EMPLOYEES;

-- 2. 고객 customers 의 모든 정보를 조회하세요
select * from CUSTOMERS;

-- 3. 상품 products 의 모든 정보를 조회하세요
select * from PRODUCT_INFORMATION;

-- 4. 직원의 성과 이름, 직책을 조회하세요
select FIRST_NAME, LAST_NAME, JOB_ID from EMPLOYEES;

-- 5. 직원의 성을 조회하세요. 단, 중복 제외
select distinct(LAST_NAME) from EMPLOYEES;

-- 6. 국적이 독일인 고객은 모두 몇명인가?
select count(CUSTOMER_ID) from CUSTOMERS
	where NLS_TERRITORY = 'GERMANY';

-- 7. 고객 중 현금한도가 높은 순으로  5명을 조회하세요
select CUST_FIRST_NAME, CREDIT_LIMIT from CUSTOMERS
	where rownum <= 5
		order by CREDIT_LIMIT desc;
		
-- 8. 고객 중 현금한도가 높은 순으로 6번째 ~ 10번째 고객을 조회하세요
select * from
	(select rownum as rnum, CUST_FIRST_NAME, CREDIT_LIMIT from CUSTOMERS)
	where rnum between 6 and 10;

-- 9. 고객의 성과 이름을 알파벳 순으로 조회하세요
select CUST_FIRST_NAME, CUST_LAST_NAME from CUSTOMERS
	order by CUST_FIRST_NAME, CUST_LAST_NAME;
	
-- 10. 주문상세 order details 에서 주문번호, 주문수량, 개별가격, 주문수량*개별가격으로 조회하세요
select ORDER_ID, QUANTITY, UNIT_PRICE, QUANTITY*UNIT_PRICE from ORDER_ITEMS;	
	
-- 11. 주문금액이 큰 순서대로 출력한다면?
select QUANTITY * UNIT_PRICE as "주문 금액" from ORDER_ITEMS
	order by '주문 금액';
	
-- 12. 상품 테이블에서 구매가격이 90이상 100이하인 상품의 상품코드, 상품명, 가격을 조회하세요
select PRODUCT_ID, PRODUCT_NAME, LIST_PRICE from PRODUCT_INFORMATION
	where LIST_PRICE between 90 and 100
		order by LIST_PRICE;

-- 13. 주문 테이블에서 요구일자가 2007년 9월인 주문의 주문번호와 요구일자, 상태를 조회하세요
select ORDER_DATE, ORDER_STATUS from ORDERS
	where to_char(ORDER_DATE, 'yyyy"년 "mm"월"') = '2007년 09월';

-- 14. 직원의 성이나 이름이 a로 시작하는 직원의 성과 이름을 조회하세요
select LAST_NAME, FIRST_NAME from EMPLOYEES
	where LAST_NAME like 'A%'
		or FIRST_NAME like 'A%';
	
-- 15. 직원의 성이나 이름이 on로 끝나는 직원의 성과 이름을 조회하세요
select LAST_NAME, FIRST_NAME from EMPLOYEES
	where LAST_NAME like '%on'
		or FIRST_NAME like '%on';

-- 16. 직원의 이름이 3자이며, T로 시작하고 m으로 끝나는 직원의 성과 이름을 조회하세요
select LAST_NAME, FIRST_NAME from EMPLOYEES
	where FIRST_NAME like 'T_m'
		or LAST_NAME like 'T_m';
		
-- 17 직원의 이름이 5자이며, j로 시작하고 e으로 끝나는 직원의 성과 이름을 조회하세요
select LAST_NAME, FIRST_NAME from EMPLOYEES
	where FIRST_NAME like 'j___e'
		or LAST_NAME like 'j___e';
		
-- 18. 고객 테이블에서 담당직원번호가 없는 고객의 이름과, 국가, 담당직원번호를 조회하세요
select e.FIRST_NAME, e.EMPLOYEE_ID, c.CUST_FIRST_NAME from EMPLOYEES e, CUSTOMERS c
	where e.EMPLOYEE_ID = c.ACCOUNT_MGR_ID;
		
select e.FIRST_NAME, e.EMPLOYEE_ID, c.CUST_FIRST_NAME from EMPLOYEES e
	inner join CUSTOMERS c on e.EMPLOYEE_ID = c.ACCOUNT_MGR_ID
		
-- 19. 고객 customer 이름별 주문 orders 건수를 조회하세요
select c.CUST_FIRST_NAME, count(o.ORDER_ID) from CUSTOMERS c, ORDERS o
	where c.CUSTOMER_ID = o.CUSTOMER_ID
		group by c.CUST_FIRST_NAME;
	
select c.CUST_FIRST_NAME, count(o.ORDER_ID) from CUSTOMERS c
	inner join ORDERS o on c.CUSTOMER_ID = o.CUSTOMER_ID
		group by c.CUST_FIRST_NAME;
	
select CUST_FIRST_NAME, count(ORDER_ID) from CUSTOMERS
	inner join ORDERS using (CUSTOMER_ID)
		group by CUST_FIRST_NAME;
		
-- 20. 상품코드, 상품이름, 상품설명을 조회하세요
select PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION from PRODUCT_INFORMATION;
		
-- 21. 주문번호와 주문상태, 주문수량*개별가격을 조회하세요
select o.ORDER_ID, o.ORDER_STATUS, oi.UNIT_PRICE * oi.QUANTITY from ORDERS o, ORDER_ITEMS oi
	where o.ORDER_ID = oi.ORDER_ID;

select o.ORDER_ID, o.ORDER_STATUS, oi.UNIT_PRICE * oi.QUANTITY from ORDERS o
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID;

select ORDER_ID, ORDER_STATUS, UNIT_PRICE * QUANTITY from ORDERS
	inner join ORDER_ITEMS using (ORDER_ID);
	
-- 22. 상품코드 2422에 대한 주문번호와  상품이름, 딜러가msrp, 개별가격을 조회하세요
select o.ORDER_ID, p.PRODUCT_NAME, p.LIST_PRICE, o.UNIT_PRICE from ORDER_ITEMS o, PRODUCT_INFORMATION p
	where o.PRODUCT_ID = p.PRODUCT_ID
		and p.PRODUCT_ID = '2422';

select o.ORDER_ID, p.PRODUCT_NAME, p.LIST_PRICE, o.UNIT_PRICE from ORDER_ITEMS o
	inner join PRODUCT_INFORMATION p on p.PRODUCT_ID = o.PRODUCT_ID
		where p.PRODUCT_ID = '2422';
		
select ORDER_ID, PRODUCT_NAME, LIST_PRICE, UNIT_PRICE from ORDER_ITEMS
	inner join PRODUCT_INFORMATION using (PRODUCT_ID)
		where PRODUCT_ID = '2422';
		
-- 23. 고객customer 중 주문번호와 주문상태를 조회하세요.
-- 단, 주문번호가 없는 고객도 포함한다
select c.CUST_FIRST_NAME, o.ORDER_ID, o.ORDER_STATUS from CUSTOMERS c, ORDERS o
	where o.CUSTOMER_ID(+) = c.CUSTOMER_ID;
	
select c.CUST_FIRST_NAME, o.ORDER_ID, o.ORDER_STATUS from CUSTOMERS c
	left join ORDERS o on c.CUSTOMER_ID = o.CUSTOMER_ID

select CUST_FIRST_NAME, ORDER_ID, ORDER_STATUS from CUSTOMERS
	left join ORDERS using (CUSTOMER_ID);
		
-- 24. 고객customer 중 주문번호와 주문상태가 없는 고객을 조회하세요
select c.CUST_FIRST_NAME, o.ORDER_ID, o.ORDER_STATUS from CUSTOMERS c, ORDERS o
	where o.CUSTOMER_ID(+) = c.CUSTOMER_ID
		and o.CUSTOMER_ID is null;
		
select c.CUST_FIRST_NAME, o.ORDER_ID, o.ORDER_STATUS from CUSTOMERS c
	left join ORDERS o on o.CUSTOMER_ID = c.CUSTOMER_ID
		where o.CUSTOMER_ID is null;

-- 25. 주문중 주문번호와 고객번호, 상품코드를 조회하세요
--    단, 상품코드가 없는 주문도 포함한다
select o.ORDER_ID, o.CUSTOMER_ID, p.PRODUCT_ID from ORDERS o, ORDER_ITEMS oi, PRODUCT_INFORMATION p
	where o.ORDER_ID = oi.ORDER_ID
		and oi.PRODUCT_ID = p.PRODUCT_ID(+);

select o.ORDER_ID, o.CUSTOMER_ID, p.PRODUCT_ID from ORDERS o
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID
	left join PRODUCT_INFORMATION p on oi.PRODUCT_ID = p.PRODUCT_ID;
	
select ORDER_ID, CUSTOMER_ID, PRODUCT_ID from ORDERS
	inner join ORDER_ITEMS using ORDER_ID
	left join PRODUCT_INFORMATION using PRODUCT_ID;

-- 26. 영업 사원 중 담당 고객이 없는 사원의 성과 이름, 직책, 고객이름을 조회하세요
--    단, 직책은 'SA_REP'인 사원을 대상으로 한다
select e.LAST_NAME, e.FIRST_NAME, e.JOB_ID, c.CUST_FIRST_NAME from EMPLOYEES e, CUSTOMERS c
	where e.EMPLOYEE_ID = c.ACCOUNT_MGR_ID(+)
		and JOB_ID = 'SA_REP';
		
select e.LAST_NAME, e.FIRST_NAME, e.JOB_ID, c.CUST_FIRST_NAME from EMPLOYEES e
	left join CUSTOMERS c on e.EMPLOYEE_ID = c.ACCOUNT_MGR_ID
		and JOB_ID = 'SA_REP';
		
-- 27. 고객 중 영업사원이 없는 고객의 이름, 직책, 사원의 성과 이름을 조회하세요
select c.CUST_FIRST_NAME, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME from EMPLOYEES e, CUSTOMERS c
	where e.EMPLOYEE_ID(+) = c.ACCOUNT_MGR_ID
		and c.ACCOUNT_MGR_ID is null;

select c.CUST_FIRST_NAME, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME from EMPLOYEES e
	right join CUSTOMERS on e.EMPLOYEE_ID = c.ACCOUNT_MGR_ID
		and c.ACCOUNT_MGR_ID is null;
		
-- 28. 주문상태별로 주문상태, 주문금액(주문수량x개별금액)의 총합을 조회하세요
select o.ORDER_STATUS, sum(UNIT_PRICE * QUANTITY) as "주문 금액" from ORDERS o, ORDER_ITEMS oi
	where o.ORDER_ID = oi.ORDER_ID
		group by o.ORDER_STATUS
			order by o.ORDER_STATUS;
			
select o.ORDER_STATUS, sum(UNIT_PRICE * QUANTITY) as "주문 금액" from ORDERS o
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID
		group by o.ORDER_STATUS
			order by o.ORDER_STATUS;
			
select ORDER_STATUS, sum(UNIT_PRICE * QUANTITY) as "주문 금액" from ORDERS o
	inner join ORDER_ITEMS using (ORDER_ID)
		group by ORDER_STATUS
			order by ORDER_STATUS;
			
-- 29. 주문번호별로 주문번호, 주문금액(주문수량x개별금액)의 총합을 조회하세요
select ORDER_ID, sum(UNIT_PRICE * QUANTITY) as "주문 금액" from ORDER_ITEMS
	group by ORDER_ID
		order by ORDER_ID;
	
-- 30. 주문년도별로  주문년도, 주문금액(주문수량x개별금액)의 총합을 조회하세요
--    단, 주문일자에서 년도만을 구하는 함수는 year() 이다
select to_char(o.ORDER_DATE, 'yyyy') as "주문년도", sum(oi.UNIT_PRICE * oi.QUANTITY) as "주문 금액" from ORDER_ITEMS oi, ORDERS o
	where o.ORDER_ID = oi.ORDER_ID
		group by to_char(o.ORDER_DATE, 'yyyy')
			order by "주문년도";

select to_char(o.ORDER_DATE, 'yyyy') as "주문년도", sum(oi.UNIT_PRICE * oi.QUANTITY) as "주문 금액" from ORDER_ITEMS oi
	inner join ORDERS o on o.ORDER_ID = oi.ORDER_ID
		group by to_char(o.ORDER_DATE, 'yyyy')
			order by "주문년도";
			
select to_char(ORDER_DATE, 'yyyy') as "주문년도", sum(UNIT_PRICE * QUANTITY) as "주문금액" from ORDER_ITEMS
	inner join ORDERS using (ORDER_ID)
		group by to_char(ORDER_DATE, 'yyyy')
			order by "주문년도";
			
-- 31. 주문년도별 주문건수를 조회하세요
select to_char(ORDER_DATE, 'yyyy') as "주문년도", count(ORDER_ID) from ORDERS
	group by to_char(ORDER_DATE, 'yyyy')
		order by "주문년도";

-- 32. 주문상태별 주문상태 수를 조회하세요
select ORDER_STATUS, count(ORDER_STATUS) from ORDERS
	group by ORDER_STATUS
		order by ORDER_STATUS;

-- 33. 주문번호별로 주문번호, 주문수량 총합, 주문금액(주문수량x개별금액)의 총합을 조회하세요
--    단, 주문금액이 1000이상, 주문수량이 60 이상을 대상으로 한다
select ORDER_ID, sum(QUANTITY), sum(QUANTITY * UNIT_PRICE) as "주문금액" from ORDER_ITEMS
	where QUANTITY >= 60 and (QUANTITY * UNIT_PRICE) >= 1000
		group by ORDER_ID
			order by ORDER_ID;

-- 34. 주문번호와 주문상태별로 그룹화한 후 주문번호와 주문상태, 주문금액(주문수량x개별금액)의 총합을 조회하라
--    단, 주문금액이 1500이상을 대상으로 한다
select o.ORDER_ID, o.ORDER_STATUS, sum(oi.UNIT_PRICE * oi.QUANTITY) as "주문금액" from ORDERS o, ORDER_ITEMS oi
	where o.ORDER_ID = oi.ORDER_ID
		group by o.ORDER_ID, o.ORDER_STATUS
			having sum(oi.UNIT_PRICE * oi.QUANTITY) >= 1500
				order by o.ORDER_ID, o.ORDER_STATUS;

select o.ORDER_ID, o.ORDER_STATUS, sum(oi.UNIT_PRICE * oi.QUANTITY) as "주문금액" from ORDERS o
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID
		group by o.ORDER_ID, o.ORDER_STATUS
			having sum(oi.UNIT_PRICE * oi.QUANTITY) >= 1500
				order by o.ORDER_ID, o.ORDER_STATUS;
				
select ORDER_ID, ORDER_STATUS, sum(UNIT_PRICE * QUANTITY) as "주문금액" from ORDERS
	inner join ORDER_ITEMS using (ORDER_ID)
		group by ORDER_ID, ORDER_STATUS
			having sum(UNIT_PRICE * QUANTITY) >= 1500
				order by ORDER_ID, ORDER_STATUS;
				
-- 35. USA에 있는 사무실에서 근무하는 사원의 성과 이름을 조회하세요 
select e.FIRST_NAME, e.LAST_NAME from EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID
		and l.COUNTRY_ID = 'US';
				
select e.FIRST_NAME, e.LAST_NAME from EMPLOYEES e
	inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
	inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
		where l.COUNTRY_ID = 'US';

select FIRST_NAME, LAST_NAME from EMPLOYEES
	inner join DEPARTMENTS using (DEPARTMENT_ID)
	inner join LOCATIONS using (LOCATION_ID)
		where COUNTRY_ID = 'US';
		
-- 36. 지불금액이 가장 많은 고객의 고객번호, 전화번호, 지불금액을 조회하세요
select c.CUSTOMER_ID, c.PHONE_NUMBERS, sum(oi.UNIT_PRICE * oi.QUANTITY) from CUSTOMERS c, ORDERS o, ORDER_ITEMS oi
	where o.CUSTOMER_ID = c.CUSTOMER_ID and o.ORDER_ID = oi.ORDER_ID
		group by c.CUSTOMER_ID, c.PHONE_NUMBERS
			order by c.CUSTOMER_ID;

select c.CUSTOMER_ID, c.PHONE_NUMBERS, sum(oi.UNIT_PRICE * oi.QUANTITY) from CUSTOMERS c
	inner join ORDERS o on c.CUSTOMER_ID = o.CUSTOMER_ID
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID
		group by c.CUSTOMER_ID, c.PHONE_NUMBERS
			order by c.CUSTOMER_ID;
			
select CUSTOMER_ID, PHONE_NUMBERS, sum(UNIT_PRICE * QUANTITY) from CUSTOMERS
	inner join ORDERS using (CUSTOMER_ID)
	inner join ORDER_ITEMS using (ORDER_ID)
		group by CUSTOMER_ID, PHONE_NUMBERS
			order by CUSTOMER_ID;
			
-- 37. 평균 지불금액보다 많은 금액을 지불한 고객의 고객번호, 전화번호, 지불금액을 조회하세요
select c.CUSTOMER_ID, c.PHONE_NUMBERS, sum(oi.UNIT_PRICE * oi.QUANTITY) as "지불 금액" from CUSTOMERS c, ORDERS o, ORDER_ITEMS oi
	where c.CUSTOMER_ID = o.CUSTOMER_ID and o.ORDER_ID = oi.ORDER_ID
		group by c.CUSTOMER_ID, c.PHONE_NUMBERS
			having sum(oi.UNIT_PRICE * oi.QUANTITY) > (select avg(sum(oi.UNIT_PRICE * oi.QUANTITY)) from ORDER_ITEMS oi, ORDERS o
															where oi.ORDER_ID = o.ORDER_ID
																group by CUSTOMER_ID)
				order by c.CUSTOMER_ID;

select c.CUSTOMER_ID, c.PHONE_NUMBERS, sum(oi.UNIT_PRICE * oi.QUANTITY) as "지불 금액" from CUSTOMERS c
	inner join ORDERS o on o.CUSTOMER_ID = c.CUSTOMER_ID
	inner join ORDER_ITEMS oi on o.ORDER_ID = oi.ORDER_ID
		group by c.CUSTOMER_ID, c.PHONE_NUMBERS
			having sum(oi.UNIT_PRICE * oi.QUANTITY) > (select avg(sum(oi.UNIT_PRICE * oi.QUANTITY)) from ORDER_ITEMS oi
															inner join ORDERS o on o.ORDER_ID = oi.ORDER_ID
																group by CUSTOMER_ID)
				order by c.CUSTOMER_ID;

select CUSTOMER_ID, PHONE_NUMBERS, sum(UNIT_PRICE * QUANTITY) as "지불 금액" from CUSTOMERS
	inner join ORDERS using (CUSTOMER_ID)
	inner join ORDER_ITEMS using (ORDER_ID)
		group by CUSTOMER_ID, PHONE_NUMBERs
			having sum(UNIT_PRICE * QUANTITY) > (select avg(sum(UNIT_PRICE * QUANTITY)) from ORDER_ITEMS
													inner join ORDERS using (ORDER_ID)
															group by CUSTOMER_ID)
				order by CUSTOMER_ID;
				
-- 38. 주문을 한번도 하지 않은 고객의 이름을 조회하세요
select c.CUST_FIRST_NAME, count(o.ORDER_ID) from CUSTOMERS c, ORDERS o
	where c.CUSTOMER_ID = o.CUSTOMER_ID(+)
		group by c.CUST_FIRST_NAME
			having count(o.ORDER_ID) = 0
				order by c.CUST_FIRST_NAME;
				
select c.CUST_FIRST_NAME, count(o.ORDER_ID) from CUSTOMERS c
	left join ORDERS o on c.CUSTOMER_ID = o.CUSTOMER_ID
		group by c.CUST_FIRST_NAME
			having count(o.ORDER_ID) = 0
				order by c.CUST_FIRST_NAME;
				
select CUST_FIRST_NAME, count(ORDER_ID) from CUSTOMERS
	left join ORDERS using (CUSTOMER_ID)
		group by CUST_FIRST_NAME
			having count(ORDER_ID) = 0
				order by CUST_FIRST_NAME;