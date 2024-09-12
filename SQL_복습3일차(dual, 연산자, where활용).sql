--dual���̺� ����ϱ�--
select * from dual;
--daul���̺����� true��� x�� ��µȴ�--

select 100+88+90 from dual;
select 273/3 from dual;

--dual���̺��� ������� �ʴ� ���
select * from dept;
--dept���̺��� ���� 4��--
select 2*2 from dept;
--������ �Ҷ� dept���̺��� ��������Ƿ� ���� ������ 4���� ���--

--��� ������--
select 2 + 1 from dual;
select 2 - 1 from dual;
select 3 * 3 from dual;
select 10 / 2 from dual;
select 10 % 2 from dual;--����!--
--����Ŭ������ ������ �����ڰ� ���� mod()�Լ��� �̿��Ѵ�--
select mod(10,2) from dual; --���!--

--���迬����--
select * from dual where 2 > 1; --2�� 1���� ũ�ٴ°��� ���̱⶧���� true���--
select * from dual where 2 < 1; --2�� 1���� ũ�⶧���� ������ �����̹Ƿ� x�� ��µ��� ����--
select * from dual where 2 >=1;
select * from dual where 2 <=1;
select * from dual where 2 <>1; --<>���� �ʴ�--
select * from dual where 2 !=1; --!=���� �ʴ�--
select * from dual where 2^=2; --^=���� �ʴ�--

--��������-
--and or not--
--and : ���δ� ���϶� �� ���--
select * from dual where 2 > 1 and 2 >1; --2�� 1���� ũ�鼭 2�� 1���� Ŭ�� �Ѵ� ��--
select * from dual where 2 > 1and 10 <=5; --2�� 1���� ũ�鼭 10�� 5 �����϶� ���� ����--

--or : ���� �ϳ��� ���϶� �� ��� / �Ѵ� �����϶� ���� ���--
select * from dual where 90!=90 or 2>1; --90�� 90�� ���� �ʰų� 2�� 1���� Ŭ�� ���� ��--
select * from dual where 0=10 or 80^=80; --0�� 10�� ���ų� 80�� 80�� �ƴҶ� �Ѵ� ����--
select empno, ename, sal from emp where sal <2000 or sal >3000;

--not : ���̸� ����, �����̸� ������ ��µȴ�--
select * from dual where not 1 = 1;
select * from dual where not 2 < 1;


--Between and ������--
--�ش� �� ������ ���� ����� �� �ִ�--
select * from emp where sal >= 2000; --2000���� ū ��������--
select * from emp where sal <=3000; --3000���� ���� ��������--
select * from emp where sal >=3000; --3000���� ū ��������--
select * from emp where sal >=2000 and sal <=3000; --2000�̻� 3000����--

select * from emp where sal between 2000 and 3000;
--between and �����ڸ� ����ϸ� ����ϰ� �ش� �� ������ ������ ����� �� �ִ�--
select * from emp where sal not between 2000 and 3000;
--between �տ� not�� �̿��ϸ� ���̿� �ش����� �ʴ� ���鸸 ����� �ȴ�--

--in ������--
--in, not in--
--������̺��� comm�� 300,500,1400�� ��� ���--
select * from emp where comm = 300 or comm =500 or comm=1400;
select * from emp where comm in (300,500,1400);

--������̺��� comm�� 300,500,1400�� �ƴ� ��� ���
select * from emp where comm != 300;
select * from emp where comm !=500;
select * from emp where comm !=1400;
select * from emp where comm != 300 and comm !=500 and comm != 1400;
select * from emp where comm not in(300,500,1400);

--������̺��� JOB�� 'MANAGER', 'SALESMAN', 'CLERK'�� ����� ��� �÷��� ����Ѵ�.--
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');


--like �����ڿ� ���ϵ� ī��--
select * from emp where ename like 'S%'; --S�� �����ϴ� �������--
select * from emp where ename like 'F%';--F�� �����ϴ� ���� ���--
select * from emp where ename like 'K%'; --K�� �����ϴ� ���� ���--
select * from emp where ename not like 'S%'; --S�� �������� �ʴ� ���� ���--

select * from emp where ename like '%CO%';
select * from emp where ename like '__OT_'; --_�� ��Ȯ�� �� ���ڸ� �ǹ��Ѵ�--

-- ������̺��� �����(ENAME)�� ù ���ڰ� � ���ڷ� �����ص� �������--
-- �� ��° ���ڰ� L�̰� ������ ���ڵ��� %(0�� �̻���) ��� ����� ��� �÷��� ����Ѵ�.--
select * from emp where ename like '_L%';

--is null, is not null--

select comm from emp; --���� ���ԵǾ��ִ� ��--
--null���� =�����ڷ� ����� �Ұ��ϴ�--
select * from emp where comm = null; --������ ���--
select * from emp where comm is null;
select * from emp where comm is not null;

select * from emp where mgr is null;
select * from emp where mgr is not null;

--where�� ����ϱ� 
--where���� �����͸� ��ȸ�Ҷ� ������ �����ؼ� ���ϴ� �����͸� ����ϴµ� ���--
select * from emp;

--emp���̺��� �μ���ȣ�� 30�� ����� ����Ѵ�--
select * from emp where deptno=30;

--emp���̺��� �μ���ȣ�� 10�� ����� ����Ѵ�--
select * from emp where deptno=10;

--������̺��� ������� JAMES�� ����Ѵ�
select * from emp where ename='JAMES';
select * from emp where ename="JAMES";
--����Ŭ���� Ȭ����ǥ�� ���ڿ� ���� ��Ÿ���µ� ���ǹǷ� ���� ����ȴ�--
--�ֵ���ǥ�� �ĺ���(���̺��, ����)� �ַ� ���ȴ�.--
--�׷��Ƿ� ���̳� ���̺���� �ƴ϶� ���� JAMES���� Ȭ����ǥ�� �ٿ�����Ѵ�--


--������̺��� ������� SAL�� 5000�� ������ ����Ѵ�
select * from emp where sal=5000;
select * from emp where sal='5000';
--������ ����ȯ ������ ���ڽ� �������� ���� ��µ�!--

--�������ڿ� where--
select * from emp where deptno=30 and job='SALESMAN';
select * from emp where deptno=10 or deptno=20;

--[Ȱ��]--
--��������ڸ� �̿��ؼ� SAL�÷��� 12�� ���Ѱ��� 36000�� �����ϸ� ����ϱ�--
select * from emp where sal*12=36000;
--���迬���ڸ� �̿��ؼ� SAL�÷��� 3000 �̻��� ���� ����ϱ�--
select * from emp where sal >=3000;

--�ƽ�Ű�ڵ�ǥ�� where--
select * from emp where ename > 'F'; --�ƽ�Ű �ڵ�ǥ�� �����ؼ� F���� ū ���ڸ� ������ ���ڵ� ���--
select * from emp where ename <='FORZ';