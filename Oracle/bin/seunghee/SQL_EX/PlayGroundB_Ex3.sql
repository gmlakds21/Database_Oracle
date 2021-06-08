-- 1. 고객 테이블을 조회하세요
select * from CUSTOMERS;

-- 2. 고객 테이블에서 국가 수를 조회하세요
select count(distinct NLS_TERRITORY) from CUSTOMERS;

-- 3. 사원 테이블에서 ID가 105인 사원을 조회하세요
select LAST_NAME, EMPLOYEE_ID from EMPLOYEES
	where EMPLOYEE_ID = 105;
	
-- 4. 고객 테이블에서 국가순으로 A-Z로 정렬해서 조회하세요
select CUST_FIRST_NAME, NLS_TERRITORY from CUSTOMERS
    order by NLS_TERRITORY;

-- 5. 고객 테이블에서 국가순으로 Z-A로 정렬해서 조회하세요
select CUST_FIRST_NAME, NLS_TERRITORY from CUSTOMERS
	order by NLS_TERRITORY desc;
    

	
	
	
	
	
	
	
	
	
	
	
	
	
-- 15. 고객 테이블에서 국가순으로 A-Z로 정렬하되, 같은 경우 고객이름으로 A-Z로 정렬해서 조회하세요
select ContactName, country, ContactName from Customers
    order by Country, ContactName;

-- 16. 고객 테이블에서 국가순으로 A-Z로 정렬하되, 같은 경우 고객이름으로 Z-A로 정렬해서 조회하세요
select ContactName, Country, ContactName from Customers
    order by Country, ContactName desc;

-- 17. 다음의 고객정보를 고객 테이블에 입력하세요 회사이름, 연락처이름, 주소, 도시, 우편번호, 국가 =>
insert into Customers (CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country) values
    ('A','Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- 18. 다음의 고객정보를 고객 테이블에 입력하세요 회사이름, 도시, 국가 =>
insert into Customers (CustomerID, CompanyName, City, Country) value
    ('B','Cardinal', 'Stavanger', 'Norway');

-- 19. 고객 테이블에서 주소가 입력되지 않은 고객이름, 연락처이름, 주소를 조회하세요
select CustomerID, ContactName, Address from Customers
    where Address is null;

-- 20. 고객 테이블에서 주소가 입력된 고객이름, 연락처이름, 주소를 조회하세요
select CustomerID, ContactName, Address from Customers
    where Address is not null;

-- 21. 고객 테이블에서 1번 고객의 연락처 이름을 'Alfred Schmidt' 로, 도시를 'Frankfurt' 로 수정하세요
update Customers set ContactName = 'Alfred Schmidt' and City = 'Frankfurt'
    where CustomerID ='ALFKI';

-- 22. 고객 테이블에서 국가가 Mexico 인 고객들의 연락처 이름을 'Juan'으로 변경하세요
update Customers set ContactName = ' Juan'
    where Country = 'Mexico';

-- 23. 고객 테이블에서 연락처 이름이 'Alfreds Futterkiste' 인 고객들을 삭제하세요
delete from Customers
    where ContactName = 'Alfreds Futterkiste';

-- 24. 고객 테이블에서 3번째부터 7번째 고객을 조회하세요 단, 고객이름은 A-Z로 정렬한다
select ContactName from Customers limit 2,5;

-- 25. 고객 테이블에서 국가가 'Germany' 인 고객들 중 3번째부터 7번째 고객을 조회하세요
select ContactName from Customers
    where country = 'Germany'
    limit 2,5;

-- 26. 제품테이블에서 최대, 최소 가격을 조회하세요
select max(UnitPrice), min(UnitPrice) from Products where UnitPrice <> 0;

-- 27. 제품테이블에서 제품수, 평균가격을 조회하세요
select count(ProductID), round(avg(UnitPrice)) from Products;

-- 28. 제품테이블에서 가격이 20이상인 제품수를 조회하세요
select count(ProductID) from Products where UnitPrice >= 20;

-- 29. 제품상세테이블에서 주문수, 총 주문수량을 조회하세요
select count(OrderID), sum(Quantity) from Order_Details;

-- 30. 고객 테이블에서 고객이름이 'A'로 시작하는 고객을 조회하세요
select * from Customers where ContactName like 'A%';
select * from Customers where left(ContactName, 1) = 'A';

-- 31. 고객 테이블에서 고객이름이 'a'로 끝나는 고객을 조회하세요
select * from Customers where ContactName like '%a';
select * from Customers where right(ContactName, 1) = 'a';

-- 32. 고객 테이블에서 고객이름에 'or'을 포함하는 고객을 조회하세요
select * from Customers where ContactName like '%or%';
select * from Customers where instr(ContactName, 'or') != 0;

-- 32. 고객 테이블에서 고객이름의 2번째 글자가 'r'로 시작하는 고객을 조회하세요
select * from Customers where ContactName like '_r%';
select * from Customers where substr(ContactName, 2, 1) = 'r';
select * from Customers where instr(ContactName, 'r') = 2;

-- 32. 고객 테이블에서 고객이름이 'A'로 시작하고 최소 3자 이상인 고객을 조회하세요
select * from Customers where ContactName like 'A__%';
select * from Customers where left(ContactName, 1) = 'A' and length(ContactName) >= 3;

-- 33. 고객 테이블에서 연락처이름이 'a'로 시작하고 'o'로 끝나는 고객을 조회하세요
select * from Customers where ContactName like 'a%o';
select * from Customers where left(ContactName,1) = 'a' and right(ContactName,1) = 'o';

-- 34. 고객 테이블에서 고객이름이 'A'로 시작하지 않는 고객을 조회하세요
select * from Customers where ContactName not like 'A%';
select * from Customers where left(ContactName, 1) <> 'A';

-- 35. 고객 테이블에서 도시이름이 'ber' 로 시작하는 도시를 조회하세요
select distinct city from Customers where city like 'ber%';
select distinct city from Customers where left(city,3) = 'ber';

-- 36. 고객 테이블에서 도시이름에 'es' 를 포함하는 도시를 조회하세요
select distinct city from Customers where city like '%es%';
select distinct city from Customers where instr(city, 'es') > 0 ;

-- 37. 고객 테이블에서 도시이름이 6자이며 'erlin' 로 끝나는 도시를 조회하세요
select distinct city from Customers where city like '_erlin';
select distinct city from Customers where right(city,5) = 'erlin' and length(city) = 6;

-- 38. 고객 테이블에서 도시이름이 6자이며
--  'L'로 시작하고 on으로 끝나며, 3번째 글자가 n인 도시를 조회하세요
select distinct city from Customers where city like 'L_n%on';
select distinct city from Customers
    where left(city,1) = 'l'
        and right(city,2) = 'on'
        and instr(city,'n') = 3
        and length(city) = 6;

-- 39. 고객 테이블에서 도시이름이 b, s, p 등으로 시작하는 도시를 조회하세요
select distinct city from Customers
    where city like 'b%' or city like 's%' or city like 'p%';
select distinct city from Customers
    where city regexp '^[bsp]';
select distinct city from Customers
    where left(city,1) in ('b', 's', 'p');

-- 40. 고객 테이블에서 도시이름이 a 에서 c 사이로 시작하는 도시를 조회하세요
select distinct city from Customers
    where city like 'a%' or city like 'b%' or city like 'c%';
select distinct city from Customers
    where city regexp '^[abc]';
select distinct city from Customers
    where city regexp '^[a-c]';
select distinct city from Customers
    where left(city, 1) in ( 'a', 'b', 'c');

-- 41. 고객 테이블에서 도시이름이 b, s, p 등으로 시작하지 않는 도시를 조회하세요
select distinct city from Customers
    where city not like 'b%' and city not like 's%' and city not like 'p%';
select distinct city from Customers
    where city regexp '^[^bsp]';
select distinct city from Customers
    where not left(city, 1) in ( 'b', 's', 'p');

-- 42. 고객 테이블에서 국가이름이 'Germany', 'France', 'UK' 인 고객을 조회하세요
select * from Customers
    where country in ('Germany', 'France', 'UK');
select * from Customers
    where country regexp 'Germany|France|UK';
select * from Customers
    where instr('GermanyFranceUK', country) > 0;

-- 43. 고객 테이블에서 도시이름이 'Germany', 'France', 'UK' 가 아닌 고객을 조회하세요
select * from Customers
    where country not in ('Germany', 'France', 'UK');
select * from Customers
    where country not regexp 'Germany|France|UK';
select * from Customers
    where instr('GermanyFranceUK', country) = 0;

-- 44. 상품 테이블에서 가격이 10 ~ 20사이인 제품을 조회하세요
select * from Products
    where UnitPrice between 10 and 20;

-- 45. 상품 테이블에서 가격이 10 ~ 20사이인 제품을 조회하세요 단, 제품분류코드가 1,2,3인 제품은 제외한다
select * from Products
    where UnitPrice between 10 and 20
      and CategoryID not in (1,2,3);

-- 46. 상품 테이블에서 제품이름이 'Carnarvon Tigers' 에서 'Mozzarella di Giovanni' 사이인 제품을 조회하세요
select * from Products
    where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';

-- 47. 상품 테이블에서 제품이름이 'Carnarvon Tigers' 에서 'Mozzarella di Giovanni' 이외의 제품을 조회하세요
select * from Products
    where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';

-- 48. 주문 테이블에서 주문날짜가 '01-July-1996' 에서 '31-July-1996'사이인 주문을 조회하세요
select * from Orders
    where OrderDate between '01-July-1996' and '31-July-1996';
select * from Orders
    where left(OrderDate, 7) = '1996-07';
select * from Orders
    where instr(OrderDate, '1996-07') = 1;

-- 49. 고객 테이블에서 고객번호, 고객이름을 조회하세요 단, 고객번호는 ID로, 고객이름은 Customer 라는 별칭을 사용한다
select CustomerID ID, ContactName customer from Customers;

-- 50. 고객 테이블에서 고객번호, 주소, 우편번호, 도시, 국가등을 조회하세요
--    단, 주소, 우편번호,도시, 국가등은 쉼표로 연결해서 Address 라는 별칭을 사용한다
select CustomerID, concat(address,',', PostalCode,',', City,',', Country) as 'Address' from Customers;

-- 51. 고객 테이블을 이용해서 국가별 고객수를 조회하세요
select country, count(CustomerID) from Customers group by Country;

-- 52. 고객 테이블을 이용해서 국가별 고객수가 5명 이상인 국가를 조회하세요
select country, count(CustomerID) from Customers group by Country having count(Country) >= 5;

-- 53. 고객/주문 테이블을 이용해서 주문번호, 고객이름, 주문일자를 조회하세요
select OrderID, ContactName, OrderDate from Orders o
    inner join Customers C on o.CustomerID = C.CustomerID;

-- 54. 고객/주문/배송자 테이블을 이용해서 주문번호, 고객이름, 배송업체명을 조회하세요
select o.CustomerID, ContactName, ShipName from Orders o
    inner join Customers C on o.CustomerID = C.CustomerID
    inner join Shippers S on o.ShipVia = S.ShipperID;

-- 55. 주문/배송자 테이블을 이용해서 배송업체별 주문건수를 조회하세요
select companyname, count(OrderID) from Orders o
    inner join Shippers S on o.ShipVia = S.ShipperID
    group by CompanyName;

-- 56. 주문/배송자 테이블을 이용해서 배송업체별 주문건수가 300건 이상인 배송업체를 조회하세요
select CompanyName, count(OrderID) from Shippers s
    inner join Orders O on s.ShipperID = O.ShipVia
    group by CompanyName
    having count(OrderID) >= 300;

-- 57. 주문/사원 테이블을 이용해서 사원 'Davolio' 또는 'Fuller' 가 맡은
--  총 주문건수 중 100건 이상인 사원은 누구인가?
select lastname, count(OrderID) from Employees e
    inner join Orders o on e.EmployeeID = o.EmployeeID
    where LastName in ('Davolio', 'Fuller')
    group by e.EmployeeID
    having count(OrderID) >= 100;

-- 58. 고객/주문 테이블을 이용해서 주문번호가 없는 고객을 조회하세요
select ContactName from Customers c
    left join Orders O on c.CustomerID = O.CustomerID
    where OrderID is null;

-- 59. 사원/주문 테이블을 이용해서 주문번호가 없는 사원을 조회하세요
select lastname from Employees e
    left join Orders O on e.EmployeeID = O.EmployeeID
    where OrderID is null;

-- 60. 고객 테이블을 이용해서 같은 도시에서 온 고객들을 조회하세요
select city, count(CustomerID) from Customers group by City;

select distinct c1.ContactName, city from Customers c1
    join Customers c2 using (city)
        where c1.City = c2.City and c1.ContactName <> c2.ContactName;

select ContactName, city from Customers
    where city in ( select city from Customers
        group by city
        having count(CustomerID) > 1)
    order by city;

-- 61. 제품/상세주문 테이블을 이용해서 주문수량이 99 이상인 제품이름을 조회하세요
select ProductName, Quantity from Products p
    inner join Order_Details OD on p.ProductID = OD.ProductID
    where Quantity >= 99;

select Productname from Products
    where ProductID in (select ProductID from Order_Details
        where Quantity >= 99);

-- 62. 제품 테이블을 이용해서 제품분류코드가 2인 제품의 가격보다 높은 제품의 이름과 가격을 조회하세요
select ProductName, UnitPrice from Products
    where UnitPrice > all (select UnitPrice from Products
        where CategoryID = 2);

-- 64. 제품 테이블을 이용해서 제품이름, 1개당가격 * 재고량, 1개당가격 * 주문량을 조회하세요
select round(UnitPrice * UnitsInStock) 재고_총가격,
       round(UnitPrice * UnitsOnOrder) 주문_총가격
            from Products;