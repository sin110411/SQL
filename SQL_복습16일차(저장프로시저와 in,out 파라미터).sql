--���� on���� �����ֱ�--
set serveroutput on;
show serveroutput;

--�������ν���--
create procedure myproc1
is
v_empno number(4) := 7788;
v_ename varchar2(10);
begin
v_ename := 'SCOTT';
dbms_output.put_line('v_empno' || v_empno);
dbms_output.put_line('v_ename' || v_ename);
end myproc1;
/

--���� ���ν��� ����--

--execute �����--
execute myproc1;

--�͸����ν��� �����--
begin
myproc1;
end;
/

--�Ķ����--

--in�Ķ���� ���� ���ν���--
create or replace procedure mypro2(--�Ķ���� ���� ��ȣ���--
p_p1 in number, --in�Ķ���� ����, �ݵ�� �μ����־����--
p_p2 number, --in�����Ǿ in���� ����. �μ��� �ʼ�--
p_p3 number := 2024, --in��� ����. 2024��� ���� ����Ʈ�� ��--
p_p4 number default 2034 --in��� ����. ����Ʈ�� 2034�� ��--
)
as
begin
dbms_output.put_line('p_p1: '||p_p1);
dbms_output.put_line('p_p2: '||p_p2);
dbms_output.put_line('p_p3: '||p_p3);
dbms_output.put_line('p_p4: '||p_p4);
end;
/

--in�Ķ���� ȣ��--
execute mypro2(1,2);
execute mypro2(1,2,10,20); --����Ʈ������ �ٸ� �� �ֱ� ����--
execute mypro2(p_p1 => 1, p_p2 => 100); --��ȣ �ֱ� ����--

--out�Ķ���� �������ν���--
create or replace procedure mypro3(
p_p1 in number,
p_p2 in number,
p_p3 out number
)
as
begin
dbms_output.put_line('p_p1: '||p_p1);
dbms_output.put_line('p_p2: '||p_p2);
p_p3 := p_p1+p_p2;
end;
/

--out �Ķ���� ȣ��--
declare
v_value number ;
begin
mypro3(2,3,v_value);
dbms_output.put_line('v_vlaue: '|| v_value);
end;
/

------------------------------


--in�Ķ���� �ǽ�--
--in�Ķ���ͷ� ��� ���� ��� �� �����--
create or replace procedure band_name(
p_p1 in varchar2,
p_p2 in varchar2,
p_p3 in varchar2
)
as
begin
dbms_output.put_line('��� ��: ' || p_p1 );
dbms_output.put_line('��� ����: '|| p_p2);
dbms_output.put_line('��ǥ ��: '|| p_p3);
end;
/

--in�Ķ���� ȣ��--
execute band_name('���ٺ� ���','���ٺ�','����');


--out�Ķ���� �ǽ�--
--out�Ķ���ͷ� ������ ���� �� �����--
create or replace procedure emp_scoure(
p_p1 in varchar2,
p_p2 in number,
p_p3 in number,
p_p4 out number
)
as
begin
dbms_output.put_line('�̸�: ' || p_p1);
dbms_output.put_line('�μ��� ����(100�� ����): '|| p_p2);
dbms_output.put_line('������ ����(100�� ����): '|| p_p3);
p_p4 := p_p2+p_p3;
end;
/

--out�Ķ���� ȣ��--
declare
v_total number;
begin
emp_scoure('ȫ�浿',78,90,v_total);
dbms_output.put_line('��������: '|| v_total);
end;
/