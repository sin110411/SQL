--�ǽ����̺� ����--

--���̺� ����--
create table class_1(
id varchar2(100),
constraint number_pk primary key(id),
name varchar2(100) not null,
total_scoure varchar2(100)
);

create table class_2(
id varchar(100),
constraint in_2 primary key(id),
name varchar2(100) not null,
total_scoure varchar2(100)
);

--�� ����--
insert into class_1 values('1001A', '������', 500);
insert into class_1 values('1002A', '���ٺ�', 480);
insert into class_1 values('1003A', '�ǹ�', 390);
insert into class_1 values('1004A', '������', 210);

insert into class_2 values('1001A', '������', 500);
insert into class_2 values('1002A', '���ٺ�', 480);
insert into class_2 values('1004B', '������', 280);
insert into class_2 values('1005B', '�ѷη�', 400);


select * from class_1;
select * from class_2;

--union all--
select * from class_1
union all
select * from class_2; --�ߺ� ������ ����  ���--

--union--
select * from class_1
union
select * from class_2;


--��Ī����ϱ�--
select id as Ȯ�ι�ȣ, name as �̸�, total_scoure as �����ջ�����
from class_1
union all
select id, name, total_scoure from class_2;

select id as Ȯ�ι�ȣ, name as �̸�, total_scoure as �����ջ�����
from class_1
union
select * from class_2;

--order by����ϱ�--
select id, name from class_1
union all
select id, name from class_2
order by name;

select id, name from class_1
order by name  --����!--
union all
select id, name from class_2
order by name;

--where�� ����ϱ�--
select * from class_1
where total_scoure >=300
union all
select * from class_2
where total_scoure >=400; --where���� �������̱⶧���� ���� ��밡��--

--������, ������--

--intersect--
select * from class_1
intersect
select * from class_2;

--minus--
select * from class_1
minus
select * from class_2;

select * from class_2
minus
select * from class_1;


--exists ���� ����ϱ�--

--intersect--
select * from class_1 c1
where exists(select 1 from class_2 c2 where c1.id=c2.id);

--minus--
select * from class_1 c1
where not exists(select 1 from class_2 c2 where c1.id=c2.id);
