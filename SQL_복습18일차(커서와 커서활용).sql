--Ŀ��--

--���� on���� �����ֱ�--
set serveroutput on;
show serveroutput;

--Ŀ�� �̿����� �ʰ� ���--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_job emp.job%type;
begin
select empno, ename, job into v_empno, v_ename, v_job from emp where ename='SMITH';
dbms_output.put_line('������ȣ: '||v_empno);
dbms_output.put_line('�����̸�: '||v_ename);
dbms_output.put_line('��������: '||v_job);
end;
/

--Ŀ�� �̿��ؼ� ����ϱ�--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
cursor emp_cursor is
select empno, ename, deptno from emp where empno=7788;
begin
open emp_cursor;
fetch emp_cursor into v_empno, v_ename, v_deptno;
dbms_output.put_line('v_empno: '|| v_empno);
dbms_output.put_line('v_ename: '|| v_ename);
dbms_output.put_line('v_deptno: '|| v_deptno);
close emp_cursor;
end;
/

--Ŀ�� while loop���/ ������ ���--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
v_job emp.job%type;
cursor emp_cursor is
select empno, ename, deptno, job from emp;
begin
open emp_cursor;
fetch emp_cursor into v_empno, v_ename, v_deptno, v_job;
while emp_cursor%found loop
dbms_output.put_line('v_empno: '|| v_empno || '   '||
                     'v_ename: '|| v_ename || '   '||
                     'v_deptno: '|| v_deptno || '    '||
                    'v_job: '|| v_job || '   ');
fetch emp_cursor into v_empno, v_ename, v_deptno, v_job;
end loop;
end cursor;
/


--Ŀ�� �ڵ忬��--
--Ŀ������ join�� �����Ѱ�?--
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno;

--Ŀ���� join�����Ͽ� ����غ���--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
v_dname dept.dname%type; --�μ��̸� ������ emp���̺� �����Ƿ� dept���̺�� ����--
cursor join_cursor is
select e.empno, e.ename, e.deptno, d.dname from emp e, dept d
where e.deptno=d.deptno;
--Ŀ���� sql���������� inner join�� ����Ͽ� dept���̺� �ִ� �μ������������� ��µǵ�����--
begin
open join_cursor;
fetch join_cursor into v_empno,v_ename,v_deptno,v_dname;
while join_cursor%found loop
dbms_output.put_line('v_empno: '|| v_empno || '   '||
                     'v_ename: '|| v_ename || '   '||
                     'v_deptno: '|| v_deptno || '    '||
                    'v_dname: '|| v_dname || '   ');
fetch join_cursor into v_empno,v_ename,v_deptno,v_dname;
end loop;
dbms_output.put_line('�������� ��� ����');
close join_cursor; --��������--
end join_cursor;
/


--Ŀ���� �ζ��κ� / group by���--
--Ŀ���� �ζ��κ並 ����� group by�� ����� ����� �����Ѱ�?--
declare
v_dname dept.dname%type;
v_deptno emp.deptno%type;
v_count number; --�����Լ��� ����� �޾ƿ;��ϱ⶧���� number��� ������ ����--
cursor emp_cursor is
select e.dname, e.deptno, e.emp_count from(
select t.dname, t.deptno, count(t.empno) as emp_count
from (select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno) t
group by t.deptno, t.dname )e;
begin
open emp_cursor;
fetch emp_cursor into v_dname,v_deptno,v_count;
while emp_cursor%found loop
dbms_output.put_line('v_dname: '|| v_dname || '   '||
                     'v_deptno: '|| v_deptno || '   '||
                     'v_count: '|| v_count || '    '||);
fetch emp_cursor into v_dname,v_deptno,v_count;
end loop;
dbms_output.put_line('�������� ��� ����');
close emp_cursor; --��������--
end;
/

/*�ڵ忬�� ������
�̹����� �ζ��κ�� group by�� �̿��Ͽ� �����Լ��� ���� ����̵ǳ� Ȯ���غ����������� ���ν����� ������� �ʾҴ�.
������ �� ������ ���� �˰Ե� ����� �ִ�.

1. �����Լ��� Ȯ���Ϸ��� �������̺��� ���⶧���� ������ �����Ҷ� �׳� number�� �����ؾ��Ѵ�.
2. �����Լ��� ��Ī�� Ŀ�� �������ȿ��� ȥ���� ������ �ʵ��� count���ٴ� emp_count�� ���� �̸����� ����������Ѵ�.

�����ζ��κ並 ������ʿ�� ������ ���� join���� �ٲ� �����ߴµ� �װ� �ƴ�. 
������ �׷��� �ϸ� ���� �ٸ����� ���� �� �𸣰ھ..�� ���������� �̿��غ���;���.
��������� ���ν����� ������� �ʾ�����, ������ �κ��� �˰ԵǾ� �� ������ �� �ִ� �κ��� �����..!*/