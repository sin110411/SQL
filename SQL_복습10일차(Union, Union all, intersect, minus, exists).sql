--실습테이블 생성--

--테이블 생성--
create table class_1(
id varchar2(100),
constraint number_pk primary key(id),
name varchar2(100) not null,
total_scoure varchar2(100)
);

create table class_2(
id varchar(100),
constraint in_2 primary key(id),
name varchar2(100) not null,
total_scoure varchar2(100)
);

--값 삽입--
insert into class_1 values('1001A', '나상현', 500);
insert into class_1 values('1002A', '유다빈', 480);
insert into class_1 values('1003A', '권민', 390);
insert into class_1 values('1004A', '김한주', 210);

insert into class_2 values('1001A', '나상현', 500);
insert into class_2 values('1002A', '유다빈', 480);
insert into class_2 values('1004B', '김춘추', 280);
insert into class_2 values('1005B', '한로로', 400);


select * from class_1;
select * from class_2;

--union all--
select * from class_1
union all
select * from class_2; --중복 값까지 전부  출력--

--union--
select * from class_1
union
select * from class_2;


--별칭사용하기--
select id as 확인번호, name as 이름, total_scoure as 과목합산점수
from class_1
union all
select id, name, total_scoure from class_2;

select id as 확인번호, name as 이름, total_scoure as 과목합산점수
from class_1
union
select * from class_2;

--order by사용하기--
select id, name from class_1
union all
select id, name from class_2
order by name;

select id, name from class_1
order by name  --에러!--
union all
select id, name from class_2
order by name;

--where절 사용하기--
select * from class_1
where total_scoure >=300
union all
select * from class_2
where total_scoure >=400; --where절은 조건절이기때문에 각각 사용가능--

--교집합, 차집합--

--intersect--
select * from class_1
intersect
select * from class_2;

--minus--
select * from class_1
minus
select * from class_2;

select * from class_2
minus
select * from class_1;


--exists 구문 사용하기--

--intersect--
select * from class_1 c1
where exists(select 1 from class_2 c2 where c1.id=c2.id);

--minus--
select * from class_1 c1
where not exists(select 1 from class_2 c2 where c1.id=c2.id);
