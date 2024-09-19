--view--
select * from emp;

--view ����--
create view v_emp
as select empno, ename, deptno, job
from emp;

--view�ҷ�����--
select * from v_emp;


--or replace--
create or replace view v_emp(�����ȣ, ����̸�, �μ���ȣ, ����)
as select empno, ename, deptno, job
from emp;

select * from v_emp;

--������ view DML--
insert into v_emp values(7200, 'JIMI', 30, 'ANALYST');
update v_emp set �μ���ȣ=10 where ����̸�='SMITH';
update v_emp set �μ���ȣ=50 where ����̸�='SMITH';--����!--
--����Ű��  depno�� 50���� ����--

--�б����� view ����--
create or replace view v_emp
as select * from emp
where job = 'CLERK'
with read only;

select * from v_emp;

--�б����� view�� DML--
delete from v_emp where deptno = 30;


--FORCE--
select * from v_test;--�������� �ʴ� ���̺�--

create force view v_test
as select member, name, leader
from v_test;

select * from v_test; --������ �ǳ� ��ȸ�� �ȵȴ�--


--with check option--
create or replace view v_emp
as select empno, ename, job, deptno from emp
where deptno=10
with check option;

select * from v_emp;

--������ view DML--
insert into v_emp values(7901, 'JIMI', 'CLERK', 10);
insert into v_emp values(7902, 'TIMI', 'CLERK', 20); --����!--


--���� view--

--���� view������ ���� ���� ���� ���̺� ����--
create table emp_favorit(
empno number
constraint empno_fk references emp(empno), 
movie varchar2(100),
food varchar2(100),
music varchar2(100)
);


insert into emp_favorit values(7369, '�����', '������', '������� ����');
insert into emp_favorit values(7782, '�̵�Ҹ�', '����', '�ؿ� ��Ż ��');
insert into emp_favorit values(7839, '������ ���Ѷ�', '¥���', 'Ŭ����');
insert into emp_favorit values(7934, '�� ���� �������̵�', '������', '���� �ε���');

select * from emp_favorit;
select * from emp;

--���� view����--
create or replace view v_emp
as select e.empno, e.ename, e.job, e.deptno, f.movie, f.food, f.music
from emp e, emp_favorit f
where e.empno=f.empno;

select * from v_emp;
