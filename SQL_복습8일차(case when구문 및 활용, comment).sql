--case when--


--실습테이블 불러오기--
select * from emp1;

--단순 case 표현식--
select ename, empno, sal, deptno,
case deptno
when 10 then '개발부'
when 20 then '영업부'
when 30 then '마케팅부'
when 40 then '기획부'
else '해당없음' end as denam
from emp1;

--검색 case 표현식--
select ename, empno, sal, deptno,
case when sal >=500 then 'VVIP'
     when sal >=300 then 'VIP'
     else '보통' end as 등급
     from emp1;
     

--실습--
--날짜별로 신규사원과 기존사원 나누기--
select * from emp1;

--날짜추가하기--
alter table emp1 add hiredate number ;
update emp1 set hiredate=20200512 where empno=100;
update emp1 set hiredate=20220421 where empno=101;
update emp1 set hiredate=20220421 where empno=103;
update emp1 set hiredate=20231214 where empno=104;
update emp1 set hiredate=20240321 where empno=105;

--날짜별로 신규사원과 기존사원 나누기--
select empno, ename, sal, deptno, hiredate,
case when hiredate >=20240000 then '신규사원'
     when hiredate >=20210000 then '중간사원'
     when hiredate >=20200000 then '기존사원'
     else '해당없음' end as 입사년도_등급 
     from emp1;

--case when 활용--

--순서 출력--
select * from emp
order by sal;

--case when구문을 사용하여 원하는 행만 순서를 조정할 수 있음--
select * from emp
order by case when sal=5000 then 0 else sal end; 

select * from emp
order by case when empno = 7369 then 10000 else empno end desc; 


--comment--
comment on table emp1 is '직원정보';
comment on column emp1.empno is '직원번호';
comment on column emp1.ename is '직원이름' ;
comment on column emp1.sal is '직원급여';
comment on column emp1.deptno is '부서번호';
comment on column emp1.hiredate is '입사정보';

--코멘트 조회--
select * from all_col_comments where table_name ='emp1';