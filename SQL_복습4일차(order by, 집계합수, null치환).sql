--order by--
--asc, desc--
select * from emp;

--select���� �� �������� �ۼ�--
select * from emp order by sal; --��������--
select ename, job from emp order by sal; --select ���� ��õ��� ���� �÷��� �������� �����ϴ°͵� ������--
--�̷��� ���� ��� orderby�� �׻� �������� ����Ǳ� ������ ����̸��� ������ ���� ��µȴ����� ���ޱ������� ���������ϴ°�--
select * from emp where deptno =30 order by sal asc;


select * from emp order by sal desc; --��������--
select ename, job, deptno from emp order by sal desc;
--���������� ��� �ݵ�� �ش� ���� �÷���ڿ� desc�� �ٿ��� �Ѵ�--

--���� ����--
select ename, job, sal, deptno from emp
order by deptno asc, sal desc;
--�տ� ��ġ�� deptno�� ���� ���� ������� �����ϰ�, �� �ȿ��� sal�� ū ������� �ٽ� �����Ѵ�--

--��Ī �� ���� ���--
select ename as e, job as j, sal as s, deptno as d
from emp
order by e,j,s desc, d;

select ename, job, sal, deptno from emp
order by 1,2,3,4 desc; --select�� ������ ������� ����ǥ�� ����--


--�ٸ� �����ڿ� �Բ� ����ϱ�--
select * from emp where job in ('CLERK','SALESMAN','ANALYST')
order by hiredate; 
--������ 'CLERK','SALESMAN','ANALYST'�� ������߿�--
--�Ի糯¥�� ���� ���� ������� ��� --> ���� ���� �Ի��� ����������--


--�����Լ�--

--sum �հ�--
select sum(sal) from emp;
select sum(comm) from emp;
select sum(sal), sum(comm) from emp;

select ename, sum(sal) from emp;--����!--


--count �����ľ�--
select count(*) from emp; --14--
select * from emp; --14�� ��--
select count(comm) from emp; --null���� ��--

select count(comm) from emp where comm is null;
--count�� null�� �̷���� �÷��� ����ϰ� �Ǹ� �������� �ƴ϶� 0�� ��µȴ�--


--avg �հ�--
select avg(sal) from emp;
select avg(comm) from emp;

--min�ּ� max�ִ�--
select min(sal) from emp;
select max(sal) from emp;
select max(hiredate) from emp;
select min(hiredate) from emp;
select min(sal), max(comm) from emp;


--�����Լ��� where�� �Բ� ���--

select sum(sal) from emp where sal >=3000;
--sal�� 3000�̻��� sal�� �հ�ó��--
select count(job) from emp where job like 'S%';
--�����̸��� S�� �����ϴ� ���� ��--


--�����Լ��� ���� ���Ǵ� nullġȯ�Լ�--
--NVL(�÷�, ġȯ��)--
select round(avg(comm),2) from emp;
select round(avg(NVL(comm,0)),2) from emp; --��� ��ü�� ����-- 