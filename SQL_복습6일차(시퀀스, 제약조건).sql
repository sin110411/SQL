--시퀀스--

--시퀀스 생성--
create sequence number_seq;

--생성된 시퀀스 조회--
select * from user_sequences; --생성된 시퀀스 목록 출력--

create table test_sqe(
no number,
name varchar2(10)
);

--내용삽입--
insert into test_sqe values (number_seq.nextval, '김한주');
insert into test_sqe values (number_seq.nextval, '유다빈');
insert into test_sqe values (number_seq.nextval, '나상현');
insert into test_sqe values (number_seq.nextval, '한로로');

--테이블 조회--
select * from test_sqe;
--NO에 자동적으로 번호가 들어감--


--현재 생성된 시퀀스 조회--
select number_seq.currval from dual;

--다음 시퀀스 조회--
select number_seq.nextval from dual; --조회할때마다 다음 시퀀스로 넘어감--

--시퀀스 삭제--
drop sequence number_seq;

--시퀀스 옵션--
create sequence number_seq1
increment by 3 --시퀀스에서는 쉼표사용X--
maxvalue 20;

select number_seq1.nextval from dual;

--시퀀스 수정-
alter sequence number_seq1 
cache 5
cycle;

--제약조건--

--primary key(기본키)--
create table table_pk(
no number,
constraint no_pk1 primary key(no)
);

insert into table_pk values(); --not null제약조건때문에 에러--
insert into table_pk values(1);

--pk값을 나중에 추가할때 alter 사용--
alter table table_pk add constraint no_pk primary key(no);


--foregin key(자식 부모 관계)--
create table parent (
user_no number,
constraint user_nopk primary key(user_no),
name varchar2(10)
);

insert into parent values(1, '이고도');
insert into parent values(2, '박문치');
insert into parent values(3, '김뜻돌');

select * from parent;

--자식테이블 만들기--
create table son(
no number
constraint no_son_fk references parent(user_no),
join_date varchar2(10)
);

insert into son values(1, '2024-10-11');
insert into son values(2, '2024-11-01');
insert into son values(3, '2024-1-03');
insert into son values(4, '2024,05-05'); --에러!--
--부모테이블에 4가 없기때문--

--부모테이블의 값 삭제하기--
delete parent where user_no=1; --자식테이블이 키를 참조하고있기때문에 삭제불가--
insert into parent values(4, '허회경'); --데이터값 삽입은 상관없음--

--자식테이블의 값 삭제하기--
delete son where no=3;
select * from son; --문제없이 삭제가능--

insert into son values(5, '2024-03-14'); --삽입은 제약이 걸림--
insert into son values(4, '2024-06-08'); --부모키에 존재하는 값만 가능--



--check(삽입 값 제약)--
create table table_check(
name varchar2(10),
gender char(1)
constraint gender_check check(gender in ('M','F'))
);

insert into table_check values('한로로','M');
insert into table_check values('허회경', 'M');
insert into table_check values('김제형', 'F');
insert into table_check values('이무이', 'B'); --check제약조건때문에 삽입X--

select * from table_check;

--alter로 추가하기--
alter table add constraint gender_check check(gender in('M','F'));


--not null과 unique--
create table test_null(
no number
constraint no_uk unique,  --괄호사용X--
name varchar2(10)
constraint name_notnull not null --괄호사용X--
);

insert into test_null values(1, '전자양');
insert into test_null values(2, '심규선');
insert into test_null values(2, '하현상'); --unique키는 중복값이 들어갈수없음--
insert into test_null values('', '하현상');--unique키는 null허용--
insert into test_null values(3, ''); --not null제약조건때문에 삽입X--
insert into test_null values(4, '전자향');
insert into test_null values(5, '전자양'); --not null은 중복값허용 null만 아니면됨-

select * from test_null;

--alter--
alter table test_null modify name not null;
--null은 속성이기때문에 modify로 바꿔줌--



--실습--
--사원관리 테이블 생성--

--부모 테이블--
create table dept_info(
deptno number,
constraint deptno_pk primary key(deptno),
dname varchar2(10) 
constraint dname not null,
member number
);

insert into dept_info values(10, '총무부', 4);
insert into dept_info values(20, '개발부', 10);
insert into dept_info values(30, '기획부', 5);

select * from dept_info;


--자식테이블 생성--
create table emp_info(
empno number,
constraint empno_pk primary key(empno),
ename varchar2(100) 
constraint ename unique,
job varchar2(100)
constraint job not null,
sal number,
gender varchar(5)
constraint gender_ckeck check(gender in ('여', '남')),
deptno number
constraint deptno_fk references dept_info(deptno)
);

insert into emp_info values(9812, '박소은', '개발자', 3000, '여', 20 );
insert into emp_info values(3024, '한민정', '개발자', 3000, '여', 20);
insert into emp_info values(3462, '김한주', '기획자', 2000, '남', 30);
insert into emp_info values(1032, '권원희', '총무', 5000, '여', 10);

select * from emp_info;