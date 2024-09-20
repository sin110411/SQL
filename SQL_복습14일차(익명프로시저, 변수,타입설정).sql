--PL/SQL--

--화면 출력--
set serveroutput on;
show serveroutput; --serveroutput 상태확인--

--익명블록 사용하기--
begin
dbms_output.put_line('Hello Oracle PL/SQL');
end;
/

begin
dbms_output.put_line('안녕 오라클!');
end;
/

--익명블록에 변수 사용--
declare
v_message varchar(30) := 'Hello Oracle PL/SQL';
begin
dbms_output.put_line(v_message);
end;
/

--실행문(begin)절에서 변수 값 할당--
declare
v_no number(4);
begin
v_no := 100;--declare절에서 변수 정의만하고 값은 실행문에서 넣어도 됨--
dbms_output.put_line('v_no: '||v_no);
end;
/

--프로시저 실습--
declare
v_empno number(4);
v_ename varchar2(10);
begin
v_empno :=7369;
v_ename :='SMITH';
dbms_output.put_line('v_empno: '||v_empno);
--문자 연결함수 ||--
dbms_output.put_line('v_ename: '||v_ename);
end;
/

--변수값 변경가능--
declare
v_empno number(4) := 2024;
v_ename varchar2(10) := '홍길동';
--변수선언절인 declare절에서 값만 변경해주면 됨--
begin
dbms_output.put_line(v_empno);
dbms_output.put_line(v_ename);
end;
/

--%type형식 사용--
declare
v_emp dept.dname%type;
begin
select dname into v_emp from dept where deptno=30;
dbms_output.put_line('v_emp : '|| v_emp);
end;
/

--%rowtype형식 사용--
declare
v_dept_row dept%rowtype;
begin
select deptno, dname, loc into v_dept_row from dept where deptno =20;
dbms_output.put_line(v_dept_row.deptno);
dbms_output.put_line(v_dept_row.dname);
dbms_output.put_line(v_dept_row.loc);
end;
/

--%type, %rowtype같이 사용하는 경우--
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


--컬럼 선택해서 가져오기--
declare
v_emp_row emp%rowtype;
begin
select empno, ename, deptno 
into v_emp_row.empno, v_emp_row.ename, v_emp_row.deptno 
--참조하는 테이블의 전체컬럼을  다 사용하지 않는다면--
--사용할 컬럼들을 따로 into절에 개수를 맞춰 적어주어야함--
from emp where empno=7788;
dbms_output.put_line('사원번호: '||v_emp_row.empno);
dbms_output.put_line('사원명: '||v_emp_row.ename);
dbms_output.put_line('부서번호 :'||v_emp_row.deptno);
end;
/
