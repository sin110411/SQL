--PL/SQL���--

--if��--

--����if��--
declare
v_number number :=1;
begin
  if v_number =1 then
     dbms_output.put_line('v_number�� 1�Դϴ�.');
  end if;
  dbms_output.put_line('����');
end;
/

declare
v_number number :=10;
begin
  if v_number > 100 then --����--
    dbms_output.put_line('v_number�� 100���� Ů�ϴ�'); 
  end if;
  dbms_output.put_line('����');
end;
/

--if~else��--
declare
v_number number :=1;
begin
 if v_number = 1 then
  dbms_output.put_line('v_number�� 1�Դϴ�');
 else
  dbms_output.put_line('v_number�� 1�� �ƴմϴ�');
 end if;
  dbms_output.put_line('����');
end;
/

--����if��--
declare
v_number number :=4;
begin
 if v_number =1 then
  dbms_output.put_line('v_number�� 1�Դϴ�');
 elsif v_number =2 then
  dbms_output.put_line('v_number�� 2�Դϴ�');
 elsif v_number =3 then
  dbms_output.put_line('v_number�� 3�Դϴ�');
 else
 dbms_output.put_line('v_number�� �ش��ϴ� ���� �����ϴ�');
 end if;
 dbms_output.put_line('����');
end;
/

--case ��--
declare
v_num number :=1;
v_numword varchar2(30);
begin
v_numword :=
case v_num  --������ case�� ��¹� �Ҵ�--
    when 1 then '�ϳ�'
    when 2 then '��'
    when 3 then '��'
    when 4 then '��'
    else '�׿��� ��'
end;
dbms_output.put_line(v_numword);
end;
/


--case������ �ٷ� ����ϱ�--
declare
v_jumsu number :=99;
begin
case round(v_jumsu/10)
    when 10 then dbms_output.put_line('A����');
    when 9 then dbms_output.put_line('A����');
    when 8 then dbms_output.put_line('B����');
    when 7 then dbms_output.put_line('B����');
    when 6 then dbms_output.put_line('C����');
    when 5 then dbms_output.put_line('D����');
    end case;
end;
/

--loop�� ����ϱ�--

--loop��(���ѷ���)--
declare
v_num number := 1;
begin
 loop
  dbms_output.put_line(v_num);
  v_num := v_num + 1;
 if v_num >5 then
 exit;
 end if;
 end loop;
 dbms_output.put_line('����');
end;
/

--while loop����--
declare
v_no number := 1;
begin
 while v_no <=7 loop
  dbms_output.put_line(v_no);
  v_no := v_no + 1;
 end loop;
 dbms_output.put_line('����');
end;
/

--for �ݺ���--
begin
for i in 1..5 loop
 dbms_output.put_line(i);
 end loop;
end;
/

begin
for i in reverse 1..5 loop --���� �Ųٷ� ���--
 dbms_output.put_line(i);
end loop;
end;
/

--continue���� for�� ���--
begin
for i in 1..10 loop
if i = 7 then
continue;
else
dbms_output.put_line(i);
end if;
end loop;
end;
/

--continue������ ¦���� ����ϱ�--
begin
for i in 1..10 loop
 if mod(i,2)=0 then
 dbms_output.put_line(i);
 else
 continue;
 end if;
 end loop;
end;
/

--����������� Ȧ���� ����ϱ�--
begin
for i in 1..10 loop
if mod(i,2) = 1 then
dbms_output.put_line(i);
else
continue;
end if;
end loop;
dbms_output.put_line('Ȧ�� ��� ����');
end;
/