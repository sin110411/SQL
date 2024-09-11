--테이블 생성하기--

--테이블 구성 로직
--1)기업의 서비스 이용자 데이터 수집 테이블 생성
--2)이용자ID, 가입일자, 사용횟수, 사용시간
create table user_info(
    ID varchar2(10),
    join_data varchar2(20),
    count number,
    time number
);


--테이블 내용 삽입
insert into user_info values ('1', '2024-05-01', 3, 2);
insert into user_info values ('2', '2024-04-21', 5, 9);
insert into user_info values ('3', '2024-02-31', 1, 1);
insert into user_info values ('4', '2024-06-11', 7, 18);
insert into user_info values ('5', '2024-04-10', 9, 22);


--테이블 내용 불러오기
select * from user_info;


--테이블 내용 변경하기
--update 구문사용
--ID 3번의 join_data를 2024-02-22로 수정하기!
update user_info set join_data='2024-02-22' where ID='3';
--update uset_info set join_date=2023-11-04'-- where절로 변경할 행의 제한을 걸지 않으면 행전체가 변경됨!--
select * from user_info where ID='3';

--여러행 한꺼번에 변경하기
update user_info set time=90, count=50 where ID=5;
select * from user_info;

--행삭제하기
--delect 구문 사용
--이용자수 가장 적은 3번째 행 삭제하기
select * from user_info;
delete from user_info where count=1;
delete from user_info where ID='1';
--delete from user_info; delete에서 where절 빼면 전체삭제 되므로 주의!!--

--update이용하여 값1개만 삭제(null로 바꾸기)
update user_info set count=null where ID=2;

--Truncate 구문 사용해서 테이블 구조만 남기기
Truncate table user_info;
select * from user_info;

--drop 테이블로 테이블 완전삭제
drop table user_info purge;

select * from user_info;