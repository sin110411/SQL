--��������--

--��Į�� ��������--

select * from emp;

select * from dept;

select e.empno, e.ename, e.job, e.deptno, 
(select d.dname from dept d where e.deptno=d.deptno) as dname
from emp e;


--join���� ���� ��� ����ϱ�--
select e.empno, e.ename, e.job, e.deptno, d.dname
from emp e , dept d
where e.deptno=d.deptno;


select e.empno, e.ename, e.job, e.deptno,
(select d.dname d.loc from dept d where e.deptno=d.deptno)as dname
from emp e; --����!--

select e.empno, e.ename, e.job, e.deptno,
(select d.dname from dept d where deptno=0) as dname
from emp e; --�������� ����--



--�ζ��� ��--
--1�� N�ζ��κ�--
select e.ename, e.job, e.deptno, d.dname
from emp e, 
(select deptno, dname from dept) d
where e.deptno= d.deptno;

select deptno, dname from dept;

--1��1 �ζ��κ�--
select e.dept_sal, d.deptno, d.dname
from dept d, (select deptno,max(sal) as dept_sal from emp group by deptno) e
where e.deptno=d.deptno;

select deptno,max(sal) as dept_sal from emp group by deptno;

--join���� �ۼ�--
select d.deptno, max(e.sal), d.dname
from emp e, dept d
where d.deptno= e.deptno
group by d.deptno, d.dname;


--������ ���̺����ϱ�--
select e.empno, e.ename, e.job, c.company
from emp e, (select '���ѻ��' as company from dual) c;

select '���ѻ��' as company from dual;

--��ø��������--

--������ �񿬰���������--
select ename, sal, job
from emp
where sal > (select avg(sal) from emp);


--������ �񿬰� ��������--
select ename, sal, job
from emp
where sal in (select sal from emp where sal >= 2000);

select sal from emp where sal >= 2000;


--������ ������������--
select e.ename, e.empno, e.job, e.deptno
from emp e
where e.ename=(select ename from emp where ename = 'JONES');

select ename from emp where ename = 'JONES';

--������ ������������--
select e.ename, e.empno, e.job, e.deptno
from emp e
where exists (select 1 from dept d where e.deptno= d.deptno);
