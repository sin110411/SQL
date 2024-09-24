--패키지 코드실습 및 개발--

--상황가정--
/*나는 음원회사의 데이터분석업무를 하고있다. 올해의 vip밴드를 고르기 위해
작년도의 수상갯수와 좋아요수를 합산하여 가장 높은 수를 기록하는 밴드를 골라야하는데
이 작업이 매번 있다보니 이에 대한 패키지를 만들어, 이름을 입력하면 원하는 정보를
출력해주는 패키지를 만들고자 한다*/

--패키지 출력문--
/*밴드명: 출력시 변수 사용
  어워드 수:(프로시저)
  좋아요 수:(프로시저)
  합계: (함수)*/

--로직구성--
/* 1. 밴드정보 테이블 생성
    -이름, 좋아요 수, 어워드 수, 대표곡
   2.패키지 로직
    -프로시저에서 in파라미터값으로 밴드의 이름을 입력
    -입력한 값을 where절 조건으로 두어 좋아요수와 어워드 수를 변수에 저장
    -저장된 두 값을 따로따로 출력할 수 있도록 프로시저에서 dbms출력문으로 작성
    (여기서 함수에서도 사용가능하도록 변수는 전역변수로 작성예정)
    -함수에서 두 변수에 저장된 값을 더하여 변수에 저장후 리턴값으로 반환*/

-------------------------------------

--테이블 생성--
create table band_info
(
name varchar2(100),
like_no number,
prize number,
sing varchar2(100)
);

--값 삽입--
insert into band_info values('유다빈 밴드', 13243, 11, '항해');
insert into band_info values('실리카겔', 30243, 12, 'no_pain');
insert into band_info values('터치드', 40293, 10, '야경');
insert into band_info values('눈뜨고 코베인', 30425, 7, '지구를 지키지말거라');
insert into band_info values('전자양', 34923, 10,'콘트롤타워');

select * from band_info;


--패키시 작성--

--패키지 사양작성--
create or replace package band_sele
is
function get_band return number;
procedure set_band(p_name varchar2);
end band_sele;
/

--패키지 본문작성--
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
dbms_output.put_line('좋아요 수: '||v_like);
dbms_output.put_line('어워드 수: '||v_prize);
end set_band;
end;
/

--서버 on--
set serveroutput on;
show serveroutput;


--패키지 호출--
declare
v_name varchar2(100);
v_total number;
begin
v_name := '유다빈 밴드';
dbms_output.put_line('밴드명: '||v_name);
--프로시저는 out파라미터가 있지 않는이상 반환값이 없기때문에 dbms문으로 출력이 불가능하다--
band_sele.set_band(v_name);
--함수에 넣을 in값이 없더라도 괄호는 반드시 적어주어야함--
v_total := band_sele.get_band();
dbms_output.put_line('총 합계: '||v_total);
end;
/


declare
v_name varchar2(100);
v_total number;
begin
v_name := '터치드';
dbms_output.put_line('밴드명 : ' || v_name);
band_sele.set_band(v_name);
v_total := band_sele.get_band();
dbms_output.put_line('총 합계: '||v_total);
end;
/

--커서 사용하여 다중행으로 출력하기--

--출력형태--
/*밴드명: (프로시저)
  어워드 수:(함수)
  좋아요 수:(함수)
  합계: (함수)*/


--로직구성--
/* 
   1.패키지 로직
    -프로시저에서 반복문을 통해 커서를 통해 이름, 좋아요 수, 어워드 수를 순서대로 출력
    -while loop문사용
    -저장된 값을 따로따로 출력할 수 있도록 프로시저에서 dbms출력문으로 작성
    (여기서 함수에서도 사용가능하도록 변수는 전역변수로 작성예정)
    -함수에서 두 변수에 저장된 값을 더하여 변수에 저장후 리턴값으로 반환*/

--패키지 사양--
create or replace package loop_p
is
function get_band return number;
procedure set_band;
end;
/

--패키지 본문--
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
   dbms_output.put_line('밴드명: '||v_name);
   dbms_output.put_line('좋아요 수: '||v_like);
   dbms_output.put_line('어워드 수: '||v_prize);
   fetch band_c into v_name,v_like, v_prize;
  end loop;
 close band_c;
end set_band;
end;
/

--패키지 호출--
declare
v_total number;
begin
loop_p.set_band();
v_total := loop_p.get_band;
dbms_output.put_line('총 합계: '||v_total);
end;
/

/*출력이 되긴 하나, 총합이 루프문안에 들어가 있지 않아,
맨 마지막 값만 총합이 출력됨. 그렇다고 총합까지 프로시저의 커서안에 넣으면
사실상 그냥 커서를 사용하는것과 아무 차이가 없으며 패키지를 사용하는 이유가 없어지게 되므로
이번에는 아예 커서 복습겸 커서로만 출력시도*/


--------------------------
--커서로만 출력하기--
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
dbms_output.put_line('밴드명: '|| v_name);
dbms_output.put_line('좋아요 수: '||v_like);
dbms_output.put_line('어워드 수: '|| v_prize);
dbms_output.put_line('총 합계: '||(v_like+v_prize));
dbms_output.put_line('                       ');
fetch loop_c into v_name, v_like,v_prize;
end loop;
close loop_c;
end;
/
