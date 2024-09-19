--commit, rollbck--

--���̺� ����--
create table rollback_test(
id number not null,
name varchar2(100)
);

select * from rollback_test ;

--Ʈ������ ����--
insert into rollback_test values(1,'����');
insert into rollback_test values(2,'���ٺ�');
insert into rollback_test values(3, '��浹');
savepoint sp1;
update rollback_test set name='�ڹ�ġ' where id=3;
delete from rollback_test where name='����';
rollback to sp1;
commit;

select * from rollback_test;


--�ǽ�--

--�ǽ��� ���̺� �����--
create table emp_sal
as select empno, ename, sal
from emp
where sal=0;


select * from emp_sal;


--Ʈ����� ����--
insert into emp_sal values(7780, '��浹', 2000);
insert into emp_sal values(7781, '������', 2500);
insert into emp_sal values(7782, '���ٺ�', 3000);

update emp_sal set sal=5000 where empno=7780;
rollback;

select * from emp_sal; --�ٷ� �������� �ѹ�--

insert into emp_sal values(7783, '�ڹ�ġ', 6000);
update emp_sal set sal = sal+100 where sal <=2000;
delete from emp_sal where sal>=4500;
rollback;

commit;

insert into emp_sal values(7783, '�ڹ�ġ', 6000);

commit;
select * from emp_sal;



--���̺� ���� �ɼ� ��ɾ�--
select * from emp2;

drop table emp1 purge; --���̺� �Ϻ�����--
drop table emp2; --�����뿡 ����--

--������ Ȯ��--
show recyclebin;

--�����뿡 �ִ� ���̺� �����--
purge recyclebin;


--�����뿡 ������ ���̺� �����ϱ�--
drop table emp_sal;
show recyclebin;
flashback table emp_sal to before drop;