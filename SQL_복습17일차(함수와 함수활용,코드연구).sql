--저장함수--

--서버 on으로 열어주기--
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

--함수 실행--

--select문으로 호출--
select func_test1(10) from dual;
select func_test1(2) from dual;

--익명프로시저로 호출--
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
--함수 생성 실습 / exception사용하기--
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
return '사용자 없음';
end;
/

--함수 실행--
select myfunction('SCOTT')from dual;
select myfunction('KING') from dual;

--익명프로시저로 실행--
declare
v_name varchar2(100);
begin
v_name := myfunction('SCOTT');
dbms_output.put_line(v_name);
end;
/

--익명프로시저 변수 없이 실행--
begin
dbms_output.put_line('SCOTT 직업정보: '||myfunction('SCOTT'));
dbms_output.put_line('KING 직업정보: '||myfunction('KING'));
dbms_output.put_line('JOMI 직업정보: '||myfunction('JOMI'));
end;
/

--if문 사용하기--
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


--조금더 간단하게 작성하기--
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


--함수 호출하기--
select mymax(10,23) from dual;

begin
dbms_output.put_line('가장큰 수: '|| mymax(10,100));
end;
/

--------------------------------------

--코드연구--
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
exception --특정한상황을 제어하고싶을때는 if else문으로--
--단일if로 참일때만 출력하게 하고 그게 아닐경우 exception으로 출력해보려고했으나, 실패..!--
return p_no2;
end;
/


--2차 시도--
create or replace function mymax
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
return '숫자가 같습니다'; --return값이 number로 지정되어있어서 실패..!--
end;
/
/*이번에는 if문으로 값을 올바르게 출력한다음에 만약 동점인걸 입력한경우
동점이라고 출력되는 로직을 구성하고싶었으나 return의 정의를 number타입으로 정의해서 안됨..*/



--3차시도--
create or replace function mymax
(
p_no1 number,
p_no2 number
)
return varchar2 --리턴값 자체를 문자로 정의해봄--
as
v_number number;
begin
if p_no1 > p_no2 then
v_number := p_no1;
else
v_number := p_no2;
end if;
return to_char(v_number); --숫자다보니 리턴값을 문자로 출력하고--
exception
when others then
return '동점입니다'; --두개의 수가 같을 경우 동점이라고 출력하는 예외문!--
end;
/
--컴파일은 되었으나, 동점으로 값을 줬을경우 예외문이 출력되지 않음--
--이 부분 조금더 연구 필요..! 그래도 함수가 오류나지 않고 컴파일 됨--

