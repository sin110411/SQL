--commit, rollbck--

--테이블 생성--
create table rollback_test(
id number not null,
name varchar2(100)
);

select * from rollback_test ;

--트랜젝션 시작--
insert into rollback_test values(1,'정우');
insert into rollback_test values(2,'유다빈');
insert into rollback_test values(3, '김뜻돌');
savepoint sp1;
update rollback_test set name='박문치' where id=3;
delete from rollback_test where name='정우';
rollback to sp1;
commit;

select * from rollback_test;


--실습--

--실습용 테이블 만들기--
create table emp_sal
as select empno, ename, sal
from emp
where sal=0;


select * from emp_sal;


--트렌잭션 시작--
insert into emp_sal values(7780, '김뜻돌', 2000);
insert into emp_sal values(7781, '김한주', 2500);
insert into emp_sal values(7782, '유다빈', 3000);

update emp_sal set sal=5000 where empno=7780;
rollback;

select * from emp_sal; --바로 이전으로 롤백--

insert into emp_sal values(7783, '박문치', 6000);
update emp_sal set sal = sal+100 where sal <=2000;
delete from emp_sal where sal>=4500;
rollback;

commit;

insert into emp_sal values(7783, '박문치', 6000);

commit;
select * from emp_sal;



--테이블 삭제 옵션 명령어--
select * from emp2;

drop table emp1 purge; --테이블 완벽삭제--
drop table emp2; --휴지통에 보관--

--휴지통 확인--
show recyclebin;

--휴지통에 있는 테이블 지우기--
purge recyclebin;


--휴지통에 보관된 테이블 복구하기--
drop table emp_sal;
show recyclebin;
flashback table emp_sal to before drop;
