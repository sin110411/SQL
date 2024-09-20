--PL/SQL--

--ȭ�� ���--
set serveroutput on;
show serveroutput; --serveroutput ����Ȯ��--

--�͸��� ����ϱ�--
begin
dbms_output.put_line('Hello Oracle PL/SQL');
end;
/

begin
dbms_output.put_line('�ȳ� ����Ŭ!');
end;
/

--�͸��Ͽ� ���� ���--
declare
v_message varchar(30) := 'Hello Oracle PL/SQL';
begin
dbms_output.put_line(v_message);
end;
/

--���๮(begin)������ ���� �� �Ҵ�--
declare
v_no number(4);
begin
v_no := 100;--declare������ ���� ���Ǹ��ϰ� ���� ���๮���� �־ ��--
dbms_output.put_line('v_no: '||v_no);
end;
/

--���ν��� �ǽ�--
declare
v_empno number(4);
v_ename varchar2(10);
begin
v_empno :=7369;
v_ename :='SMITH';
dbms_output.put_line('v_empno: '||v_empno);
--���� �����Լ� ||--
dbms_output.put_line('v_ename: '||v_ename);
end;
/

--������ ���氡��--
declare
v_empno number(4) := 2024;
v_ename varchar2(10) := 'ȫ�浿';
--������������ declare������ ���� �������ָ� ��--
begin
dbms_output.put_line(v_empno);
dbms_output.put_line(v_ename);
end;
/

--%type���� ���--
declare
v_emp dept.dname%type;
begin
select dname into v_emp from dept where deptno=30;
dbms_output.put_line('v_emp : '|| v_emp);
end;
/

--%rowtype���� ���--
declare
v_dept_row dept%rowtype;
begin
select deptno, dname, loc into v_dept_row from dept where deptno =20;
dbms_output.put_line(v_dept_row.deptno);
dbms_output.put_line(v_dept_row.dname);
dbms_output.put_line(v_dept_row.loc);
end;
/

--%type, %rowtype���� ����ϴ� ���--
declare
v_deptno dept.deptno%type;
v_dept_row dept%rowtype;
begin
select deptno,dname,loc into v_dept_row from dept where deptno=10;
v_deptno := v_dept_row.deptno;
dbms_output.put_line(v_deptno);
dbms_output.put_line(v_dept_row.dname);
dbms_output.put_line(v_dept_row.loc);
end;
/


--�÷� �����ؼ� ��������--
declare
v_emp_row emp%rowtype;
begin
select empno, ename, deptno 
into v_emp_row.empno, v_emp_row.ename, v_emp_row.deptno 
--�����ϴ� ���̺��� ��ü�÷���  �� ������� �ʴ´ٸ�--
--����� �÷����� ���� into���� ������ ���� �����־����--
from emp where empno=7788;
dbms_output.put_line('�����ȣ: '||v_emp_row.empno);
dbms_output.put_line('�����: '||v_emp_row.ename);
dbms_output.put_line('�μ���ȣ :'||v_emp_row.deptno);
end;
/
