--커서--

--서버 on으로 열어주기--
set serveroutput on;
show serveroutput;

--커서 이용하지 않고 출력--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_job emp.job%type;
begin
select empno, ename, job into v_empno, v_ename, v_job from emp where ename='SMITH';
dbms_output.put_line('직원번호: '||v_empno);
dbms_output.put_line('직원이름: '||v_ename);
dbms_output.put_line('직원직업: '||v_job);
end;
/

--커서 이용해서 출력하기--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
cursor emp_cursor is
select empno, ename, deptno from emp where empno=7788;
begin
open emp_cursor;
fetch emp_cursor into v_empno, v_ename, v_deptno;
dbms_output.put_line('v_empno: '|| v_empno);
dbms_output.put_line('v_ename: '|| v_ename);
dbms_output.put_line('v_deptno: '|| v_deptno);
close emp_cursor;
end;
/

--커서 while loop사용/ 다중행 출력--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
v_job emp.job%type;
cursor emp_cursor is
select empno, ename, deptno, job from emp;
begin
open emp_cursor;
fetch emp_cursor into v_empno, v_ename, v_deptno, v_job;
while emp_cursor%found loop
dbms_output.put_line('v_empno: '|| v_empno || '   '||
                     'v_ename: '|| v_ename || '   '||
                     'v_deptno: '|| v_deptno || '    '||
                    'v_job: '|| v_job || '   ');
fetch emp_cursor into v_empno, v_ename, v_deptno, v_job;
end loop;
end cursor;
/


--커서 코드연구--
--커서에서 join이 가능한가?--
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno;

--커서에 join대입하여 사용해보기--
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_deptno emp.deptno%type;
v_dname dept.dname%type; --부서이름 정보는 emp테이블에 없으므로 dept테이블로 정의--
cursor join_cursor is
select e.empno, e.ename, e.deptno, d.dname from emp e, dept d
where e.deptno=d.deptno;
--커서의 sql쿼리문에서 inner join을 사용하여 dept테이블에 있는 부서정보까지같이 출력되도록함--
begin
open join_cursor;
fetch join_cursor into v_empno,v_ename,v_deptno,v_dname;
while join_cursor%found loop
dbms_output.put_line('v_empno: '|| v_empno || '   '||
                     'v_ename: '|| v_ename || '   '||
                     'v_deptno: '|| v_deptno || '    '||
                    'v_dname: '|| v_dname || '   ');
fetch join_cursor into v_empno,v_ename,v_deptno,v_dname;
end loop;
dbms_output.put_line('직원정보 출력 종료');
close join_cursor; --생략가능--
end join_cursor;
/


--커서에 인라인뷰 / group by사용--
--커서에 인라인뷰를 사용한 group by의 결과도 출력이 가능한가?--
declare
v_dname dept.dname%type;
v_deptno emp.deptno%type;
v_count number; --집계함수의 결과를 받아와야하기때문에 number라는 값으로 변경--
cursor emp_cursor is
select e.dname, e.deptno, e.emp_count from(
select t.dname, t.deptno, count(t.empno) as emp_count
from (select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno) t
group by t.deptno, t.dname )e;
begin
open emp_cursor;
fetch emp_cursor into v_dname,v_deptno,v_count;
while emp_cursor%found loop
dbms_output.put_line('v_dname: '|| v_dname || '   '||
                     'v_deptno: '|| v_deptno || '   '||
                     'v_count: '|| v_count || '    '||);
fetch emp_cursor into v_dname,v_deptno,v_count;
end loop;
dbms_output.put_line('직원정보 출력 종료');
close emp_cursor; --생략가능--
end;
/

/*코드연구 느낀점
이번에는 인라인뷰와 group by를 이용하여 집계함수도 같이 출력이되나 확인해보려고했지만 프로시저가 실행되지 않았다.
하지만 이 과정을 통해 알게된 몇가지가 있다.

1. 집계함수를 확인하려면 참조테이블이 없기때문에 변수를 정의할때 그냥 number로 정의해야한다.
2. 집계함수의 별칭은 커서 쿼리문안에서 혼동이 생기지 않도록 count보다는 emp_count와 같이 이름으로 정의해줘야한다.

굳이인라인뷰를 사용할필요는 없을것 같아 join으로 바꿔 실행했는데 그건 됐다. 
하지만 그렇게 하면 위와 다른점이 뭔지 잘 모르겠어서..꼭 서브쿼리를 이용해보고싶었다.
결론적으로 프로시저가 실행되진 않았으나, 몰랐던 부분을 알게되어 더 공부할 수 있는 부분이 생겼다..!*/