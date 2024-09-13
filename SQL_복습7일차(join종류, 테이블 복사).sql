--join--

--inner join--
select * from emp;
select * from dept;

--�μ������� ������� �Ѳ����� ����ϱ�--
select e.empno, e.ename, e.job, e.sal, e.deptno, d.dname
from emp e ,dept d
where e.deptno = d.deptno;

--mysql--
select e.empno, e.ename, e.job, e.sal, e.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno;


--outer join--

--outer join ������ ī�� ���̺� ����--
create table emp_copy
as select empno, ename, job
from emp;

select * from emp_copy;
delete emp_copy where job='CLERK';
delete emp_copy where empno between 7400 and 7500;

alter table emp_copy add hobby varchar2(100);
update emp_copy set hobby='���ǵ��' ;


--left outer join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e, emp_copy c
where e.empno= c.empno(+);
--����Ŭ�� ��� outer join�̶�� ���� �ʰ� (+)ǥ�� ���--

--mysql�� ���--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e left outer join emp_copy c
on e.empno=c.empno;


--right outer join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e, emp_copy c
where e.empno(+) = c.empno;

--mysql�� ���--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e right outer join emp_copy c
on e.empno = c.empno;

--fullouter join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e full outer join emp_copy c
on e.empno=c.empno;


--self join--
select e.ename, e.empno, e.job, m.ename, m.mgr
from emp e, emp m
where e.empno = m.mgr;

--natural join--
select empno, ename, job, sal, hobby
from emp
natural join emp_copy;
--��Ī���X, ���� �÷����� �����Ͽ� �ߺ��߻��� �� ����--

--cross join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e
cross join emp_copy c;
--īƼ�þ� �� �߻�-- 


--���̺� �����ϱ�--
create table emp_copy1
as select *
from emp
; --������ �Ȱ��� ���̺�--

select * from emp_copy1;

create table emp_copy2
as select ename, deptno --���ϴ� �÷��� ��������--
from emp;

select * from emp_copy2;

--���̺� ������ ����--
create table emp_copy3
as select *
from emp
where 1 <> 1 ;

select * from emp_copy3;

