--������--

--������ ����--
create sequence number_seq;

--������ ������ ��ȸ--
select * from user_sequences; --������ ������ ��� ���--

create table test_sqe(
no number,
name varchar2(10)
);

--�������--
insert into test_sqe values (number_seq.nextval, '������');
insert into test_sqe values (number_seq.nextval, '���ٺ�');
insert into test_sqe values (number_seq.nextval, '������');
insert into test_sqe values (number_seq.nextval, '�ѷη�');

--���̺� ��ȸ--
select * from test_sqe;
--NO�� �ڵ������� ��ȣ�� ��--


--���� ������ ������ ��ȸ--
select number_seq.currval from dual;

--���� ������ ��ȸ--
select number_seq.nextval from dual; --��ȸ�Ҷ����� ���� �������� �Ѿ--

--������ ����--
drop sequence number_seq;

--������ �ɼ�--
create sequence number_seq1
increment by 3 --������������ ��ǥ���X--
maxvalue 20;

select number_seq1.nextval from dual;

--������ ����-
alter sequence number_seq1 
cache 5
cycle;

--��������--

--primary key(�⺻Ű)--
create table table_pk(
no number,
constraint no_pk1 primary key(no)
);

insert into table_pk values(); --not null�������Ƕ����� ����--
insert into table_pk values(1);

--pk���� ���߿� �߰��Ҷ� alter ���--
alter table table_pk add constraint no_pk primary key(no);


--foregin key(�ڽ� �θ� ����)--
create table parent (
user_no number,
constraint user_nopk primary key(user_no),
name varchar2(10)
);

insert into parent values(1, '�̰�');
insert into parent values(2, '�ڹ�ġ');
insert into parent values(3, '��浹');

select * from parent;

--�ڽ����̺� �����--
create table son(
no number
constraint no_son_fk references parent(user_no),
join_date varchar2(10)
);

insert into son values(1, '2024-10-11');
insert into son values(2, '2024-11-01');
insert into son values(3, '2024-1-03');
insert into son values(4, '2024,05-05'); --����!--
--�θ����̺� 4�� ���⶧��--

--�θ����̺��� �� �����ϱ�--
delete parent where user_no=1; --�ڽ����̺��� Ű�� �����ϰ��ֱ⶧���� �����Ұ�--
insert into parent values(4, '��ȸ��'); --�����Ͱ� ������ �������--

--�ڽ����̺��� �� �����ϱ�--
delete son where no=3;
select * from son; --�������� ��������--

insert into son values(5, '2024-03-14'); --������ ������ �ɸ�--
insert into son values(4, '2024-06-08'); --�θ�Ű�� �����ϴ� ���� ����--



--check(���� �� ����)--
create table table_check(
name varchar2(10),
gender char(1)
constraint gender_check check(gender in ('M','F'))
);

insert into table_check values('�ѷη�','M');
insert into table_check values('��ȸ��', 'M');
insert into table_check values('������', 'F');
insert into table_check values('�̹���', 'B'); --check�������Ƕ����� ����X--

select * from table_check;

--alter�� �߰��ϱ�--
alter table add constraint gender_check check(gender in('M','F'));


--not null�� unique--
create table test_null(
no number
constraint no_uk unique,  --��ȣ���X--
name varchar2(10)
constraint name_notnull not null --��ȣ���X--
);

insert into test_null values(1, '���ھ�');
insert into test_null values(2, '�ɱԼ�');
insert into test_null values(2, '������'); --uniqueŰ�� �ߺ����� ��������--
insert into test_null values('', '������');--uniqueŰ�� null���--
insert into test_null values(3, ''); --not null�������Ƕ����� ����X--
insert into test_null values(4, '������');
insert into test_null values(5, '���ھ�'); --not null�� �ߺ������ null�� �ƴϸ��-

select * from test_null;

--alter--
alter table test_null modify name not null;
--null�� �Ӽ��̱⶧���� modify�� �ٲ���--



--�ǽ�--
--������� ���̺� ����--

--�θ� ���̺�--
create table dept_info(
deptno number,
constraint deptno_pk primary key(deptno),
dname varchar2(10) 
constraint dname not null,
member number
);

insert into dept_info values(10, '�ѹ���', 4);
insert into dept_info values(20, '���ߺ�', 10);
insert into dept_info values(30, '��ȹ��', 5);

select * from dept_info;


--�ڽ����̺� ����--
create table emp_info(
empno number,
constraint empno_pk primary key(empno),
ename varchar2(100) 
constraint ename unique,
job varchar2(100)
constraint job not null,
sal number,
gender varchar(5)
constraint gender_ckeck check(gender in ('��', '��')),
deptno number
constraint deptno_fk references dept_info(deptno)
);

insert into emp_info values(9812, '�ڼ���', '������', 3000, '��', 20 );
insert into emp_info values(3024, '�ѹ���', '������', 3000, '��', 20);
insert into emp_info values(3462, '������', '��ȹ��', 2000, '��', 30);
insert into emp_info values(1032, '�ǿ���', '�ѹ�', 5000, '��', 10);

select * from emp_info;