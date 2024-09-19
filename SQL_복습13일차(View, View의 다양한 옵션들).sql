--view--
select * from emp;

--view 생성--
create view v_emp
as select empno, ename, deptno, job
from emp;

--view불러오기--
select * from v_emp;


--or replace--
create or replace view v_emp(사원번호, 사원이름, 부서번호, 직업)
as select empno, ename, deptno, job
from emp;

select * from v_emp;

--생성된 view DML--
insert into v_emp values(7200, 'JIMI', 30, 'ANALYST');
update v_emp set 부서번호=10 where 사원이름='SMITH';
update v_emp set 부서번호=50 where 사원이름='SMITH';--에러!--
--참조키인  depno에 50번이 없음--

--읽기전용 view 생성--
create or replace view v_emp
as select * from emp
where job = 'CLERK'
with read only;

select * from v_emp;

--읽기전용 view에 DML--
delete from v_emp where deptno = 30;


--FORCE--
select * from v_test;--존재하지 않는 테이블--

create force view v_test
as select member, name, leader
from v_test;

select * from v_test; --생성은 되나 조회는 안된다--


--with check option--
create or replace view v_emp
as select empno, ename, job, deptno from emp
where deptno=10
with check option;

select * from v_emp;

--생성된 view DML--
insert into v_emp values(7901, 'JIMI', 'CLERK', 10);
insert into v_emp values(7902, 'TIMI', 'CLERK', 20); --에러!--


--복합 view--

--복합 view생성을 위한 직원 취향 테이블 생성--
create table emp_favorit(
empno number
constraint empno_fk references emp(empno), 
movie varchar2(100),
food varchar2(100),
music varchar2(100)
);


insert into emp_favorit values(7369, '기생충', '떡볶이', '국내밴드 음악');
insert into emp_favorit values(7782, '미드소마', '삼겹살', '해외 메탈 락');
insert into emp_favorit values(7839, '지구를 지켜라', '짜장면', '클래식');
insert into emp_favorit values(7934, '보 이즈 어프레이드', '떡볶이', '국내 인디밴드');

select * from emp_favorit;
select * from emp;

--복합 view생성--
create or replace view v_emp
as select e.empno, e.ename, e.job, e.deptno, f.movie, f.food, f.music
from emp e, emp_favorit f
where e.empno=f.empno;

select * from v_emp;
