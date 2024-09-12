--grop by--
select * from emp;


--�μ����� �׷쳪����--
select  deptno from emp
group by deptno;
--�����Լ��� �Բ� ����Ͽ� �׷캰�� �� �μ��� ��ִ��� ������ Ȯ���ϱ�--
select deptno, count(*) as deptno_count from emp
group by deptno ;
--�μ��� �ְ� ���� �˾ƺ���--
select deptno, max(sal) as max_sal from emp
group by deptno;
--�μ��� ��� ���ް� �������� �˾ƺ���--
select deptno, round(avg(sal),2), min(sal) from emp
where sal is not null
group by deptno order by deptno;

--�������� �׷�ȭ�ϱ�--
select job, count(*) as job_count from emp
group by job order by job_count;
--������ ��տ��� �˾ƺ���--
select job, round(avg(nvl(sal,0)),2) as sal_avg from emp
group by job order by sal_avg desc;

--where���� ���ϴ� ������ �׷츸 ����ϱ�--
select job, count(*) as job_count from emp
where job = 'CLERK'
group by job;

--���� �׷�ȭ--
select deptno, job, count(job) as job_count from emp
group by deptno, job order by deptno;

--group function--
--group by grouping--
select deptno, job, count(*) from emp
group by grouping sets(deptno,job); --sets���ȿ� ������ ������� �׷�ȭ--

--grouby rollup--
select deptno,job,sum(sal) from emp
group by rollup(deptno,job);
--�Ѱ谪 �ڵ� ��ȯ, ����������� a�׷�, (a,b)�׷�ȭ �ϱ⶧���� ���� �߿�--

--group by cube--
select deptno, job from emp
group by cube(deptno, job)order by deptno;
--�Ѱ谪 �ڵ� ��ȯ--
--���� ������ �÷����� �ѹ��� �׷�ȭ�Ѵ����� ��ü �׷�ȭ�� ������--

--cube��ü--
select deptno,job from emp
group by grouping sets(deptno, job, (deptno,job),()) order by deptno;


--having--
select deptno, job, count(job) from emp
where count(job) >3
group by deptno, job order by deptno; --����!--

select deptno, job, count(job) from emp
group by deptno, job
having count(deptno) >=2 order by deptno;
--�����Լ��� ��������� ������ ����ϰ������ having���� ����Ѵ�--


--having���� where�� �Բ� ����ϱ�--
--�μ��� ������ ������� ��� �������� ��, ������2000�̻��� ������� 2���̻��� ���� ����ϱ�--
select deptno, job, count(*) as ����� from emp
where sal >=2000
group by deptno, job
having count(*)>=2 ;