--case when--


--�ǽ����̺� �ҷ�����--
select * from emp1;

--�ܼ� case ǥ����--
select ename, empno, sal, deptno,
case deptno
when 10 then '���ߺ�'
when 20 then '������'
when 30 then '�����ú�'
when 40 then '��ȹ��'
else '�ش����' end as denam
from emp1;

--�˻� case ǥ����--
select ename, empno, sal, deptno,
case when sal >=500 then 'VVIP'
     when sal >=300 then 'VIP'
     else '����' end as ���
     from emp1;
     

--�ǽ�--
--��¥���� �űԻ���� ������� ������--
select * from emp1;

--��¥�߰��ϱ�--
alter table emp1 add hiredate number ;
update emp1 set hiredate=20200512 where empno=100;
update emp1 set hiredate=20220421 where empno=101;
update emp1 set hiredate=20220421 where empno=103;
update emp1 set hiredate=20231214 where empno=104;
update emp1 set hiredate=20240321 where empno=105;

--��¥���� �űԻ���� ������� ������--
select empno, ename, sal, deptno, hiredate,
case when hiredate >=20240000 then '�űԻ��'
     when hiredate >=20210000 then '�߰����'
     when hiredate >=20200000 then '�������'
     else '�ش����' end as �Ի�⵵_��� 
     from emp1;

--case when Ȱ��--

--���� ���--
select * from emp
order by sal;

--case when������ ����Ͽ� ���ϴ� �ุ ������ ������ �� ����--
select * from emp
order by case when sal=5000 then 0 else sal end; 

select * from emp
order by case when empno = 7369 then 10000 else empno end desc; 


--comment--
comment on table emp1 is '��������';
comment on column emp1.empno is '������ȣ';
comment on column emp1.ename is '�����̸�' ;
comment on column emp1.sal is '�����޿�';
comment on column emp1.deptno is '�μ���ȣ';
comment on column emp1.hiredate is '�Ի�����';

--�ڸ�Ʈ ��ȸ--
select * from all_col_comments where table_name ='emp1';