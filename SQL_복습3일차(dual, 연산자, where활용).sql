--dual테이블 사용하기--
select * from dual;
--daul테이블에서는 true라면 x가 출력된다--

select 100+88+90 from dual;
select 273/3 from dual;

--dual테이블을 사용하지 않는 경우
select * from dept;
--dept테이블의 행은 4개--
select 2*2 from dept;
--연산을 할때 dept테이블을 사용했으므로 행의 개수인 4개만 출력--

--산술 연산자--
select 2 + 1 from dual;
select 2 - 1 from dual;
select 3 * 3 from dual;
select 10 / 2 from dual;
select 10 % 2 from dual;--에러!--
--오라클에서는 나머지 연산자가 없고 mod()함수를 이용한다--
select mod(10,2) from dual; --출력!--

--관계연산자--
select * from dual where 2 > 1; --2가 1보다 크다는것은 참이기때문에 true출력--
select * from dual where 2 < 1; --2가 1보다 크기때문에 조건이 거짓이므로 x가 출력되지 않음--
select * from dual where 2 >=1;
select * from dual where 2 <=1;
select * from dual where 2 <>1; --<>같지 않다--
select * from dual where 2 !=1; --!=같지 않다--
select * from dual where 2^=2; --^=같지 않다--

--논리연산자-
--and or not--
--and : 전부다 참일때 참 출력--
select * from dual where 2 > 1 and 2 >1; --2가 1보다 크면서 2가 1보다 클때 둘다 참--
select * from dual where 2 > 1and 10 <=5; --2가 1보다 크면서 10이 5 이하일때 후자 거짓--

--or : 둘중 하나가 참일때 참 출력 / 둘다 거짓일때 거짓 출력--
select * from dual where 90!=90 or 2>1; --90은 90과 같지 않거나 2가 1보다 클때 후자 참--
select * from dual where 0=10 or 80^=80; --0은 10과 같거나 80은 80이 아닐때 둘다 거짓--
select empno, ename, sal from emp where sal <2000 or sal >3000;

--not : 참이면 거짓, 거짓이면 참으로 출력된다--
select * from dual where not 1 = 1;
select * from dual where not 2 < 1;


--Between and 연산자--
--해당 값 사이의 값을 출력할 수 있다--
select * from emp where sal >= 2000; --2000보다 큰 직원정보--
select * from emp where sal <=3000; --3000보다 작은 직원정보--
select * from emp where sal >=3000; --3000보다 큰 직원정보--
select * from emp where sal >=2000 and sal <=3000; --2000이상 3000이하--

select * from emp where sal between 2000 and 3000;
--between and 연산자를 사용하면 깔끔하게 해당 값 사이의 값들을 출력할 수 있다--
select * from emp where sal not between 2000 and 3000;
--between 앞에 not을 이용하면 사이에 해당하지 않는 값들만 출력이 된다--

--in 연산자--
--in, not in--
--사원테이블에서 comm이 300,500,1400인 사원 출력--
select * from emp where comm = 300 or comm =500 or comm=1400;
select * from emp where comm in (300,500,1400);

--사원테이블에서 comm이 300,500,1400이 아닌 사원 출력
select * from emp where comm != 300;
select * from emp where comm !=500;
select * from emp where comm !=1400;
select * from emp where comm != 300 and comm !=500 and comm != 1400;
select * from emp where comm not in(300,500,1400);

--사원테이블에서 JOB이 'MANAGER', 'SALESMAN', 'CLERK'의 사원의 모든 컬럼을 출력한다.--
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');


--like 연산자와 와일드 카드--
select * from emp where ename like 'S%'; --S로 시작하는 직원출력--
select * from emp where ename like 'F%';--F로 시작하는 직원 출력--
select * from emp where ename like 'K%'; --K로 시작하는 직원 출력--
select * from emp where ename not like 'S%'; --S로 시작하지 않는 직원 출력--

select * from emp where ename like '%CO%';
select * from emp where ename like '__OT_'; --_는 정확한 한 글자를 의미한다--

-- 사원테이블에서 사원명(ENAME)이 첫 글자가 어떤 문자로 시작해도 상관없고--
-- 두 번째 문자가 L이고 나머지 문자들이 %(0개 이상인) 모든 사원의 모든 컬럼을 출력한다.--
select * from emp where ename like '_L%';

--is null, is not null--

select comm from emp; --널이 포함되어있는 열--
--null값은 =연산자로 출력이 불가하다--
select * from emp where comm = null; --공집합 출력--
select * from emp where comm is null;
select * from emp where comm is not null;

select * from emp where mgr is null;
select * from emp where mgr is not null;

--where절 사용하기 
--where절은 데이터를 조회할때 조건을 지정해서 원하는 데이터를 출력하는데 사용--
select * from emp;

--emp테이블에서 부서번호가 30인 사원만 출력한다--
select * from emp where deptno=30;

--emp테이블에서 부서번호가 10인 사원만 출력한다--
select * from emp where deptno=10;

--사원테이블에서 사원명이 JAMES만 출력한다
select * from emp where ename='JAMES';
select * from emp where ename="JAMES";
--오라클에서 홑따옴표는 문자열 값을 나타내는데 사용되므로 정상 실행된다--
--쌍따옴표는 식별자(테이블명, 열명)등에 주로 사용된다.--
--그러므로 열이나 테이블명이 아니라 값인 JAMES에는 홑따옴표를 붙여사용한다--


--사원테이블에서 사원명이 SAL이 5000인 직원만 출력한다
select * from emp where sal=5000;
select * from emp where sal='5000';
--묵시적 형변환 때문에 숫자식 문자형은 정상 출력됨!--

--논리연산자와 where--
select * from emp where deptno=30 and job='SALESMAN';
select * from emp where deptno=10 or deptno=20;

--[활용]--
--산술연산자를 이용해서 SAL컬럼에 12를 곱한값이 36000과 동일하면 출력하기--
select * from emp where sal*12=36000;
--관계연산자를 이용해서 SAL컬럼이 3000 이상인 직원 출력하기--
select * from emp where sal >=3000;

--아스키코드표와 where--
select * from emp where ename > 'F'; --아스키 코드표를 참고해서 F보다 큰 숫자를 가지는 문자들 출력--
select * from emp where ename <='FORZ';