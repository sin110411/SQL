--서버 on으로 열어주기--
set serveroutput on;
show serveroutput;

--저장프로시저--
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

--저장 프로시저 실행--

--execute 실행법--
execute myproc1;

--익명프로시저 실행법--
begin
myproc1;
end;
/

--파라미터--

--in파라미터 저장 프로시저--
create or replace procedure mypro2(--파라미터 사용시 괄호사용--
p_p1 in number, --in파라미터 설정, 반드시 인수값있어야함--
p_p2 number, --in생략되어도 in모드로 설정. 인수값 필수--
p_p3 number := 2024, --in모드 생략. 2024라는 값이 디폴트로 들어감--
p_p4 number default 2034 --in모드 생락. 디폴트로 2034값 들어감--
)
as
begin
dbms_output.put_line('p_p1: '||p_p1);
dbms_output.put_line('p_p2: '||p_p2);
dbms_output.put_line('p_p3: '||p_p3);
dbms_output.put_line('p_p4: '||p_p4);
end;
/

--in파라미터 호출--
execute mypro2(1,2);
execute mypro2(1,2,10,20); --디폴트값에도 다른 값 넣기 가능--
execute mypro2(p_p1 => 1, p_p2 => 100); --기호 넣기 가능--

--out파라미터 저장프로시저--
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

--out 파라미터 호출--
declare
v_value number ;
begin
mypro3(2,3,v_value);
dbms_output.put_line('v_vlaue: '|| v_value);
end;
/

------------------------------


--in파라미터 실습--
--in파라미터로 밴드 정보 출력 폼 만들기--
create or replace procedure band_name(
p_p1 in varchar2,
p_p2 in varchar2,
p_p3 in varchar2
)
as
begin
dbms_output.put_line('밴드 명: ' || p_p1 );
dbms_output.put_line('밴드 리더: '|| p_p2);
dbms_output.put_line('대표 곡: '|| p_p3);
end;
/

--in파라미터 호출--
execute band_name('유다빈 밴드','유다빈','항해');


--out파라미터 실습--
--out파라미터로 직원평가 점수 폼 만들기--
create or replace procedure emp_scoure(
p_p1 in varchar2,
p_p2 in number,
p_p3 in number,
p_p4 out number
)
as
begin
dbms_output.put_line('이름: ' || p_p1);
dbms_output.put_line('부서평가 점수(100점 만점): '|| p_p2);
dbms_output.put_line('동기평가 점수(100점 만점): '|| p_p3);
p_p4 := p_p2+p_p3;
end;
/

--out파라미터 호출--
declare
v_total number;
begin
emp_scoure('홍길동',78,90,v_total);
dbms_output.put_line('최종점수: '|| v_total);
end;
/