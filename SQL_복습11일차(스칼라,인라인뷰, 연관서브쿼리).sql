--서브쿼리--

--스칼라 서브쿼리--

select * from emp;

select * from dept;

select e.empno, e.ename, e.job, e.deptno, 
(select d.dname from dept d where e.deptno=d.deptno) as dname
from emp e;


--join으로 같은 결과 출력하기--
select e.empno, e.ename, e.job, e.deptno, d.dname
from emp e , dept d
where e.deptno=d.deptno;


select e.empno, e.ename, e.job, e.deptno,
(select d.dname d.loc from dept d where e.deptno=d.deptno)as dname
from emp e; --에러!--

select e.empno, e.ename, e.job, e.deptno,
(select d.dname from dept d where deptno=0) as dname
from emp e; --오류나지 않음--



--인라인 뷰--
--1대 N인라인뷰--
select e.ename, e.job, e.deptno, d.dname
from emp e, 
(select deptno, dname from dept) d
where e.deptno= d.deptno;

select deptno, dname from dept;

--1대1 인라인뷰--
select e.dept_sal, d.deptno, d.dname
from dept d, (select deptno,max(sal) as dept_sal from emp group by deptno) e
where e.deptno=d.deptno;

select deptno,max(sal) as dept_sal from emp group by deptno;

--join으로 작성--
select d.deptno, max(e.sal), d.dname
from emp e, dept d
where d.deptno= e.deptno
group by d.deptno, d.dname;


--가상의 테이블사용하기--
select e.empno, e.ename, e.job, c.company
from emp e, (select '무한상사' as company from dual) c;

select '무한상사' as company from dual;

--중첩서브쿼리--

--단일행 비연관서브쿼리--
select ename, sal, job
from emp
where sal > (select avg(sal) from emp);


--다중행 비연관 서브쿼리--
select ename, sal, job
from emp
where sal in (select sal from emp where sal >= 2000);

select sal from emp where sal >= 2000;


--단일행 연관서브쿼리--
select e.ename, e.empno, e.job, e.deptno
from emp e
where e.ename=(select ename from emp where ename = 'JONES');

select ename from emp where ename = 'JONES';

--다중행 연관서브쿼리--
select e.ename, e.empno, e.job, e.deptno
from emp e
where exists (select 1 from dept d where e.deptno= d.deptno);
