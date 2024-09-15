--������ �Լ�--

select * from emp;

select sum(sal) as sum_sal
from emp; 

select empno, ename, job, deptno, sum(sal) as sum_sal
from emp; --����!--

--������ �Լ�_�����Լ��� �Բ� ����ϱ�--

--�޿���ü�հ� ���ϱ�--
select empno, ename, job, deptno,
sum(sal) over() as sal_total
from emp
order by deptno;

--��ü�� �ִ�޿� ���ϱ�--
select empno, ename, job, deptno,
max(sal) over() as sal_max
from emp order by deptno;


--��ü�� �ּұ޿� ���ϱ�--
select empno, ename, job, deptno,
min(sal) over() as min_sal
from emp order by deptno;

--��ü�� ��� �޿� ���ϱ�--
select empno, ename, job,deptno,
round(avg(sal) over(),2) as sal_avg
from emp order by deptno;
--������ �Լ����� round�� �� ��� over()������ ���� ��� ��ȣ�ȿ� �־����!--

--��ü �� ���� ���ϱ�--
select empno, ename, job, deptno,
count(empno) over() as count_emp
from emp;


--patition by �� order by--

--�μ��� �޿� �հ豸�ϱ�--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno) as deptno_sal_sum
from emp;


--�μ��� �޿� ��� ���ϱ�--
select empno, ename, job, deptno, sal,
round(avg(sal) over(partition by deptno),2) deptno_sal_avg
from emp;

--order by�� �߰��ϸ� ��������� �����ϴ�--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal) as sum_sal
from emp;

--�������� ���� �����ϱ�--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal rows between 1 preceding and 2 following) as sum_sal
from emp;

select empno, ename, job, deptno, sal,
round(avg(sal) over(partition by deptno order by sal 
rows between unbounded preceding and 1 following),2) as avg_sal
from emp; --ó������ ������ �ϳ� �ر���--

--range--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal) as sum_sal
from emp; --���� ���� �ϳ��� ���--

--ragne�� �� ���� ����--
select empno, ename, job, deptno, sal,
count(*) over(order by sal range between 1000 preceding and 1000 following) as range_count
from emp; 
--������ ���ؿ��� 1000�� �� �� ���̿� �ְ� ������ ���ؿ��� 1000�� ���� ���� ���̿� �ִ� ��--


--���� �Լ�--

--rank--
select empno, ename, job, deptno, sal,
rank() over(order by sal) as sal_rank
from emp;

--dense_rank--
select empno, ename, job, deptno, sal,
dense_rank() over(order by sal) as dense_rank
from emp;

--row number--
select empno, ename, job, deptno, sal,
row_number() over(order by sal) as row_number
from emp;


--���� �Լ� ��--
select empno, ename, job, deptno, sal,
rank() over(order by sal) as rank_sal,
dense_rank() over(order by sal) as dense_rank,
row_number() over(order by sal) as row_number
from emp;
