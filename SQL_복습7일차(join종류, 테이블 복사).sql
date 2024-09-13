--join--

--inner join--
select * from emp;
select * from dept;

--부서정보와 사원정보 한꺼번에 출력하기--
select e.empno, e.ename, e.job, e.sal, e.deptno, d.dname
from emp e ,dept d
where e.deptno = d.deptno;

--mysql--
select e.empno, e.ename, e.job, e.sal, e.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno;


--outer join--

--outer join 진행할 카피 테이블 생성--
create table emp_copy
as select empno, ename, job
from emp;

select * from emp_copy;
delete emp_copy where job='CLERK';
delete emp_copy where empno between 7400 and 7500;

alter table emp_copy add hobby varchar2(100);
update emp_copy set hobby='음악듣기' ;


--left outer join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e, emp_copy c
where e.empno= c.empno(+);
--오라클의 경우 outer join이라고 적지 않고 (+)표시 사용--

--mysql의 경우--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e left outer join emp_copy c
on e.empno=c.empno;


--right outer join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e, emp_copy c
where e.empno(+) = c.empno;

--mysql의 경우--
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
--별칭사용X, 같은 컬럼명끼리 조인하여 중복발생할 수 있음--

--cross join--
select e.empno, e.ename, e.job, e.sal, c.hobby
from emp e
cross join emp_copy c;
--카티시안 곱 발생-- 


--테이블 복사하기--
create table emp_copy1
as select *
from emp
; --완전히 똑같은 테이블--

select * from emp_copy1;

create table emp_copy2
as select ename, deptno --원하는 컬럼만 지정가능--
from emp;

select * from emp_copy2;

--테이블 구조만 복사--
create table emp_copy3
as select *
from emp
where 1 <> 1 ;

select * from emp_copy3;

