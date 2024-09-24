--��Ű�� �ڵ�ǽ� �� ����--

--��Ȳ����--
/*���� ����ȸ���� �����ͺм������� �ϰ��ִ�. ������ vip��带 ���� ����
�۳⵵�� ���󰹼��� ���ƿ���� �ջ��Ͽ� ���� ���� ���� ����ϴ� ��带 �����ϴµ�
�� �۾��� �Ź� �ִٺ��� �̿� ���� ��Ű���� �����, �̸��� �Է��ϸ� ���ϴ� ������
������ִ� ��Ű���� ������� �Ѵ�*/

--��Ű�� ��¹�--
/*����: ��½� ���� ���
  ����� ��:(���ν���)
  ���ƿ� ��:(���ν���)
  �հ�: (�Լ�)*/

--��������--
/* 1. ������� ���̺� ����
    -�̸�, ���ƿ� ��, ����� ��, ��ǥ��
   2.��Ű�� ����
    -���ν������� in�Ķ���Ͱ����� ����� �̸��� �Է�
    -�Է��� ���� where�� �������� �ξ� ���ƿ���� ����� ���� ������ ����
    -����� �� ���� ���ε��� ����� �� �ֵ��� ���ν������� dbms��¹����� �ۼ�
    (���⼭ �Լ������� ��밡���ϵ��� ������ ���������� �ۼ�����)
    -�Լ����� �� ������ ����� ���� ���Ͽ� ������ ������ ���ϰ����� ��ȯ*/

-------------------------------------

--���̺� ����--
create table band_info
(
name varchar2(100),
like_no number,
prize number,
sing varchar2(100)
);

--�� ����--
insert into band_info values('���ٺ� ���', 13243, 11, '����');
insert into band_info values('�Ǹ�ī��', 30243, 12, 'no_pain');
insert into band_info values('��ġ��', 40293, 10, '�߰�');
insert into band_info values('���߰� �ں���', 30425, 7, '������ ��Ű�����Ŷ�');
insert into band_info values('���ھ�', 34923, 10,'��Ʈ��Ÿ��');

select * from band_info;


--��Ű�� �ۼ�--

--��Ű�� ����ۼ�--
create or replace package band_sele
is
function get_band return number;
procedure set_band(p_name varchar2);
end band_sele;
/

--��Ű�� �����ۼ�--
create or replace package body band_sele
is
v_like number;
v_prize number;
function get_band
return number
is
v_total number;
begin
v_total := v_like + v_prize;
return v_total;
end get_band;
procedure set_band(p_name varchar2)
is
begin
select like_no,prize into v_like, v_prize from band_info where name=p_name;
dbms_output.put_line('���ƿ� ��: '||v_like);
dbms_output.put_line('����� ��: '||v_prize);
end set_band;
end;
/

--���� on--
set serveroutput on;
show serveroutput;


--��Ű�� ȣ��--
declare
v_name varchar2(100);
v_total number;
begin
v_name := '���ٺ� ���';
dbms_output.put_line('����: '||v_name);
--���ν����� out�Ķ���Ͱ� ���� �ʴ��̻� ��ȯ���� ���⶧���� dbms������ ����� �Ұ����ϴ�--
band_sele.set_band(v_name);
--�Լ��� ���� in���� ������ ��ȣ�� �ݵ�� �����־����--
v_total := band_sele.get_band();
dbms_output.put_line('�� �հ�: '||v_total);
end;
/


declare
v_name varchar2(100);
v_total number;
begin
v_name := '��ġ��';
dbms_output.put_line('���� : ' || v_name);
band_sele.set_band(v_name);
v_total := band_sele.get_band();
dbms_output.put_line('�� �հ�: '||v_total);
end;
/

--Ŀ�� ����Ͽ� ���������� ����ϱ�--

--�������--
/*����: (���ν���)
  ����� ��:(�Լ�)
  ���ƿ� ��:(�Լ�)
  �հ�: (�Լ�)*/


--��������--
/* 
   1.��Ű�� ����
    -���ν������� �ݺ����� ���� Ŀ���� ���� �̸�, ���ƿ� ��, ����� ���� ������� ���
    -while loop�����
    -����� ���� ���ε��� ����� �� �ֵ��� ���ν������� dbms��¹����� �ۼ�
    (���⼭ �Լ������� ��밡���ϵ��� ������ ���������� �ۼ�����)
    -�Լ����� �� ������ ����� ���� ���Ͽ� ������ ������ ���ϰ����� ��ȯ*/

--��Ű�� ���--
create or replace package loop_p
is
function get_band return number;
procedure set_band;
end;
/

--��Ű�� ����--
create or replace package body loop_p
is
   v_name varchar2(100);
   v_like number;
   v_prize number;
function get_band
  return number
is
  v_total number;
begin
  v_total := v_like + v_prize;
  return v_total;
 end get_band;
procedure set_band
is
  cursor band_c is
    select name, like_no, prize from band_info;
begin
    open band_c;
    fetch band_c into v_name,v_like, v_prize;
while band_c%FOUND loop
   dbms_output.put_line('����: '||v_name);
   dbms_output.put_line('���ƿ� ��: '||v_like);
   dbms_output.put_line('����� ��: '||v_prize);
   fetch band_c into v_name,v_like, v_prize;
  end loop;
 close band_c;
end set_band;
end;
/

--��Ű�� ȣ��--
declare
v_total number;
begin
loop_p.set_band();
v_total := loop_p.get_band;
dbms_output.put_line('�� �հ�: '||v_total);
end;
/

/*����� �Ǳ� �ϳ�, ������ �������ȿ� �� ���� �ʾ�,
�� ������ ���� ������ ��µ�. �׷��ٰ� ���ձ��� ���ν����� Ŀ���ȿ� ������
��ǻ� �׳� Ŀ���� ����ϴ°Ͱ� �ƹ� ���̰� ������ ��Ű���� ����ϴ� ������ �������� �ǹǷ�
�̹����� �ƿ� Ŀ�� ������ Ŀ���θ� ��½õ�*/


--------------------------
--Ŀ���θ� ����ϱ�--
declare
v_name band_info.name%type;
v_like band_info.like_no%type;
v_prize band_info.prize%type;
cursor loop_c is
select name, like_no, prize from band_info;
begin
open loop_c;
fetch loop_c into v_name, v_like,v_prize;
while loop_c%found loop
dbms_output.put_line('����: '|| v_name);
dbms_output.put_line('���ƿ� ��: '||v_like);
dbms_output.put_line('����� ��: '|| v_prize);
dbms_output.put_line('�� �հ�: '||(v_like+v_prize));
dbms_output.put_line('                       ');
fetch loop_c into v_name, v_like,v_prize;
end loop;
close loop_c;
end;
/
