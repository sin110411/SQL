--���̺� ����
create table emp1(
     empno number,
     ename varchar2(10),
     sal number,
     deptno number    
);

--�������
insert into emp1 values(100, 'king', 240, 10);
insert into emp1 values(101, 'kocchar', 170, 10);
insert into emp1 values(103, 'Hunold', 900, 20);
insert into emp1 values(104, 'Ernst', 600, 30);
insert into emp1 values(105, 'Austin', 480, 40);


select * from emp1;

--���ο� �÷� �����ϱ�
--add ���
alter table emp1 add comm number;
select * from emp1;

--��ĭ�� update�� �� �־��ټ� �ִ�
update emp1 set comm=300;
select *from emp1;

--�̹� ������ �÷��� ���� �����ϱ�
--modify���
alter table emp1 modify ename varchar2(100);
alter table emp1 modify ename varchar2(200);
--alter table emp1 modify ename number(5);  ������Ÿ���� �ƿ� �ٸ��͵��� ����Ұ�--

--�÷� ����
--drop columns ���
alter table emp1 drop column comm;
select * from emp1;

--���̺�� �ٲٱ�
alter table emp1 rename to emp11;

select * from emp1; --���̺��̸� ����Ǿ� �������� �ʴ� ���̺�--
select * from emp11; --��°���--

--�÷��� �ٲٱ�
alter table emp11 rename column deptno to dept_no; 
select * from emp11; --�ٲ� �÷������� ���--


--���̺� Alias(��Ī)
select * from emp11;

--���� �÷��� �ڿ� as(���)�� ���� �� 
--��ũ��Ʈ���� ����Ҷ� ����� �÷� ��Ī ����
select empno as �����ȣ, ename as ����̸�  from emp11;

--���̺� ��Ī
--as ������� ����
select * from emp11 t; --emp11�� t��� �����Ѱ�--
--�ַ� �ζ��κ䳪 join�Ҷ� ���ȴ�