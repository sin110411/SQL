--order by--
--asc, desc--
select * from emp;

--select절의 맨 마지막에 작성--
select * from emp order by sal; --오름차순--
select ename, job from emp order by sal; --select 절에 명시되지 않은 컬럼을 기준으로 정렬하는것도 가능함--
--이렇게 적을 경우 orderby가 항상 마지막에 실행되기 때문에 사원이름과 직업만 먼저 출력된다음에 월급기준으로 오름차순하는것--
select * from emp where deptno =30 order by sal asc;


select * from emp order by sal desc; --내림차순--
select ename, job, deptno from emp order by sal desc;
--내림차순의 경우 반드시 해당 기준 컬럼명뒤에 desc를 붙여야 한다--

--이중 정렬--
select ename, job, sal, deptno from emp
order by deptno asc, sal desc;
--앞에 위치한 deptno를 먼저 작은 순서대로 정렬하고, 그 안에서 sal이 큰 순서대로 다시 정렬한다--

--별칭 및 숫자 사용--
select ename as e, job as j, sal as s, deptno as d
from emp
order by e,j,s desc, d;

select ename, job, sal, deptno from emp
order by 1,2,3,4 desc; --select에 나열된 순서대로 숫자표기 가능--


--다른 연산자와 함꼐 사용하기--
select * from emp where job in ('CLERK','SALESMAN','ANALYST')
order by hiredate; 
--직업이 'CLERK','SALESMAN','ANALYST'인 사람들중에--
--입사날짜가 가장 작은 순서대로 출력 --> 가장 일찍 입사한 사람순서대로--


--집계함수--

--sum 합계--
select sum(sal) from emp;
select sum(comm) from emp;
select sum(sal), sum(comm) from emp;

select ename, sum(sal) from emp;--에러!--


--count 개수파악--
select count(*) from emp; --14--
select * from emp; --14개 행--
select count(comm) from emp; --null제외 값--

select count(comm) from emp where comm is null;
--count는 null로 이루어진 컬럼을 출력하게 되면 공집합이 아니라 0이 출력된다--


--avg 합계--
select avg(sal) from emp;
select avg(comm) from emp;

--min최소 max최대--
select min(sal) from emp;
select max(sal) from emp;
select max(hiredate) from emp;
select min(hiredate) from emp;
select min(sal), max(comm) from emp;


--집계함수와 where절 함께 사용--

select sum(sal) from emp where sal >=3000;
--sal이 3000이상인 sal만 합계처리--
select count(job) from emp where job like 'S%';
--직업이름이 S로 시작하는 행의 수--


--집계함수와 같이 사용되는 null치환함수--
--NVL(컬럼, 치환값)--
select round(avg(comm),2) from emp;
select round(avg(NVL(comm,0)),2) from emp; --사원 전체수 포함-- 