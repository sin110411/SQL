--�����Լ�--

--���� on���� �����ֱ�--
set serveroutput on;
show serveroutput;


create or replace function func_test1
(p_no number)
return number
as 
v_no number;
begin
v_no := p_no +10;
return v_no;
end;
/

--�Լ� ����--

--select������ ȣ��--
select func_test1(10) from dual;
select func_test1(2) from dual;

--�͸����ν����� ȣ��--
declare
v_number number;
begin
v_number :=func_test1(100);
dbms_output.put_line(v_number);
end;
/

declare
v_no number;
begin
v_no := func_test1(200);
dbms_output.put_line(v_no);
end;
/


-----------------------
--�Լ� ���� �ǽ� / exception����ϱ�--
create or replace function myfunction
(p_name varchar2)
return varchar2
as
v_job emp.job%type;
begin
select job into v_job from emp where ename=p_name;
return v_job;
exception
when no_data_found then
return '����� ����';
end;
/

--�Լ� ����--
select myfunction('SCOTT')from dual;
select myfunction('KING') from dual;

--�͸����ν����� ����--
declare
v_name varchar2(100);
begin
v_name := myfunction('SCOTT');
dbms_output.put_line(v_name);
end;
/

--�͸����ν��� ���� ���� ����--
begin
dbms_output.put_line('SCOTT ��������: '||myfunction('SCOTT'));
dbms_output.put_line('KING ��������: '||myfunction('KING'));
dbms_output.put_line('JOMI ��������: '||myfunction('JOMI'));
end;
/

--if�� ����ϱ�--
create or replace function mymax
(
p_no1 number,
p_no2 number
)
return number
as
add_num number;
begin
if p_no1 > p_no2 then
add_num := p_no1;
else
add_num := p_no2;
end if;
return add_num; 
end;
/


--���ݴ� �����ϰ� �ۼ��ϱ�--
create or replace function mymax
(p_no1 number,
p_no2 number)
return number
as
begin
if p_no1 > p_no2 then
return p_no1;
else
return p_no2;
end if;
end;
/


--�Լ� ȣ���ϱ�--
select mymax(10,23) from dual;

begin
dbms_output.put_line('����ū ��: '|| mymax(10,100));
end;
/

--------------------------------------

--�ڵ忬��--
create or replace function mymax
(
p_no1 number,
p_no2 number
)
return number;
as
v_no number;
begin
if p_no1 > p_no2 then
v_no := p_no1;
end if;
return v_no;
exception --Ư���ѻ�Ȳ�� �����ϰ�������� if else������--
--����if�� ���϶��� ����ϰ� �ϰ� �װ� �ƴҰ�� exception���� ����غ�����������, ����..!--
return p_no2;
end;
/


--2�� �õ�--
create or replace mymax
(
p_no1 number,
p_no2 number
)
return number
as
v_number number;
begin
if p_no1 > p_no2 then
v_number := p_no1;
else
v_number := p_no2;
end if;
return v_number;
exception
when others then
return '���ڰ� �����ϴ�'; --return���� number�� �����Ǿ��־ ����..!--
end;
/
/*�̹����� if������ ���� �ùٸ��� ����Ѵ����� ���� �����ΰ� �Է��Ѱ��
�����̶�� ��µǴ� ������ �����ϰ�;����� return�� ���Ǹ� numberŸ������ �����ؼ� �ȵ�..*/



--3���õ�--
create or replace function mymax
(
p_no1 number,
p_no2 number
)
return varchar2 --���ϰ� ��ü�� ���ڷ� �����غ�--
as
v_number number;
begin
if p_no1 > p_no2 then
v_number := p_no1;
else
v_number := p_no2;
end if;
return to_char(v_number); --���ڴٺ��� ���ϰ��� ���ڷ� ����ϰ�--
exception
when others then
return '�����Դϴ�'; --�ΰ��� ���� ���� ��� �����̶�� ����ϴ� ���ܹ�!--
end;
/
--�������� �Ǿ�����, �������� ���� ������� ���ܹ��� ��µ��� ����--
--�� �κ� ���ݴ� ���� �ʿ�..! �׷��� �Լ��� �������� �ʰ� ������ ��--

