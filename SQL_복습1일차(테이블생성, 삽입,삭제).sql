--���̺� �����ϱ�--

--���̺� ���� ����
--1)����� ���� �̿��� ������ ���� ���̺� ����
--2)�̿���ID, ��������, ���Ƚ��, ���ð�
create table user_info(
    ID varchar2(10),
    join_data varchar2(20),
    count number,
    time number
);


--���̺� ���� ����
insert into user_info values ('1', '2024-05-01', 3, 2);
insert into user_info values ('2', '2024-04-21', 5, 9);
insert into user_info values ('3', '2024-02-31', 1, 1);
insert into user_info values ('4', '2024-06-11', 7, 18);
insert into user_info values ('5', '2024-04-10', 9, 22);


--���̺� ���� �ҷ�����
select * from user_info;


--���̺� ���� �����ϱ�
--update �������
--ID 3���� join_data�� 2024-02-22�� �����ϱ�!
update user_info set join_data='2024-02-22' where ID='3';
--update uset_info set join_date=2023-11-04'-- where���� ������ ���� ������ ���� ������ ����ü�� �����!--
select * from user_info where ID='3';

--������ �Ѳ����� �����ϱ�
update user_info set time=90, count=50 where ID=5;
select * from user_info;

--������ϱ�
--delect ���� ���
--�̿��ڼ� ���� ���� 3��° �� �����ϱ�
select * from user_info;
delete from user_info where count=1;
delete from user_info where ID='1';
--delete from user_info; delete���� where�� ���� ��ü���� �ǹǷ� ����!!--

--update�̿��Ͽ� ��1���� ����(null�� �ٲٱ�)
update user_info set count=null where ID=2;

--Truncate ���� ����ؼ� ���̺� ������ �����
Truncate table user_info;
select * from user_info;

--drop ���̺�� ���̺� ��������
drop table user_info purge;

select * from user_info;