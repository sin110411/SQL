--테이블 생성
create table emp1(
     empno number,
     ename varchar2(10),
     sal number,
     deptno number    
);

--내용삽입
insert into emp1 values(100, 'king', 240, 10);
insert into emp1 values(101, 'kocchar', 170, 10);
insert into emp1 values(103, 'Hunold', 900, 20);
insert into emp1 values(104, 'Ernst', 600, 30);
insert into emp1 values(105, 'Austin', 480, 40);


select * from emp1;

--새로운 컬럼 삽입하기
--add 사용
alter table emp1 add comm number;
select * from emp1;

--빈칸은 update로 값 넣어줄수 있다
update emp1 set comm=300;
select *from emp1;

--이미 정해진 컬럼의 형식 수정하기
--modify사용
alter table emp1 modify ename varchar2(100);
alter table emp1 modify ename varchar2(200);
--alter table emp1 modify ename number(5);  데이터타입이 아예 다른것들은 변경불가--

--컬럼 삭제
--drop columns 사용
alter table emp1 drop column comm;
select * from emp1;

--테이블명 바꾸기
alter table emp1 rename to emp11;

select * from emp1; --테이블이름 변경되어 존재하지 않는 테이블--
select * from emp11; --출력가능--

--컬럼명 바꾸기
alter table emp11 rename column deptno to dept_no; 
select * from emp11; --바뀐 컬럼명으로 출력--


--테이블 Alias(별칭)
select * from emp11;

--기존 컬럼명 뒤에 as(약어)를 적은 뒤 
--스크립트에서 출력할때 사용할 컬럼 별칭 적기
select empno as 사원번호, ename as 사원이름  from emp11;

--테이블 별칭
--as 사용하지 않음
select * from emp11 t; --emp11을 t라고 정의한것--
--주로 인라인뷰나 join할때 사용된다