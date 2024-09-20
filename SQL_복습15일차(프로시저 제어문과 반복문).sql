--PL/SQL제어문--

--if문--

--단일if문--
declare
v_number number :=1;
begin
  if v_number =1 then
     dbms_output.put_line('v_number는 1입니다.');
  end if;
  dbms_output.put_line('종료');
end;
/

declare
v_number number :=10;
begin
  if v_number > 100 then --거짓--
    dbms_output.put_line('v_number는 100보다 큽니다'); 
  end if;
  dbms_output.put_line('종료');
end;
/

--if~else문--
declare
v_number number :=1;
begin
 if v_number = 1 then
  dbms_output.put_line('v_number가 1입니다');
 else
  dbms_output.put_line('v_number가 1이 아닙니다');
 end if;
  dbms_output.put_line('종료');
end;
/

--다중if문--
declare
v_number number :=4;
begin
 if v_number =1 then
  dbms_output.put_line('v_number가 1입니다');
 elsif v_number =2 then
  dbms_output.put_line('v_number가 2입니다');
 elsif v_number =3 then
  dbms_output.put_line('v_number가 3입니다');
 else
 dbms_output.put_line('v_number에 해당하는 값이 없습니다');
 end if;
 dbms_output.put_line('종료');
end;
/

--case 문--
declare
v_num number :=1;
v_numword varchar2(30);
begin
v_numword :=
case v_num  --변수에 case문 출력문 할당--
    when 1 then '하나'
    when 2 then '둘'
    when 3 then '셋'
    when 4 then '넷'
    else '그외의 값'
end;
dbms_output.put_line(v_numword);
end;
/


--case문에서 바로 출력하기--
declare
v_jumsu number :=99;
begin
case round(v_jumsu/10)
    when 10 then dbms_output.put_line('A학점');
    when 9 then dbms_output.put_line('A학점');
    when 8 then dbms_output.put_line('B학점');
    when 7 then dbms_output.put_line('B학점');
    when 6 then dbms_output.put_line('C학점');
    when 5 then dbms_output.put_line('D학점');
    end case;
end;
/

--loop문 사용하기--

--loop문(무한루프)--
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
 dbms_output.put_line('종료');
end;
/

--while loop형식--
declare
v_no number := 1;
begin
 while v_no <=7 loop
  dbms_output.put_line(v_no);
  v_no := v_no + 1;
 end loop;
 dbms_output.put_line('종료');
end;
/

--for 반복문--
begin
for i in 1..5 loop
 dbms_output.put_line(i);
 end loop;
end;
/

begin
for i in reverse 1..5 loop --숫자 거꾸로 출력--
 dbms_output.put_line(i);
end loop;
end;
/

--continue문과 for문 사용--
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

--continue문으로 짝수만 출력하기--
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

--같은방법으로 홀수만 출력하기--
begin
for i in 1..10 loop
if mod(i,2) = 1 then
dbms_output.put_line(i);
else
continue;
end if;
end loop;
dbms_output.put_line('홀수 출력 종료');
end;
/