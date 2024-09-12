--grop by--
select * from emp;


--부서별로 그룹나누기--
select  deptno from emp
group by deptno;
--집계함수와 함께 사용하여 그룹별로 총 부서가 몇개있는지 고유값 확인하기--
select deptno, count(*) as deptno_count from emp
group by deptno ;
--부서별 최고 연봉 알아보기--
select deptno, max(sal) as max_sal from emp
group by deptno;
--부서별 평균 월급과 최저월급 알아보기--
select deptno, round(avg(sal),2), min(sal) from emp
where sal is not null
group by deptno order by deptno;

--직업으로 그룹화하기--
select job, count(*) as job_count from emp
group by job order by job_count;
--직업별 평균연봉 알아보기--
select job, round(avg(nvl(sal,0)),2) as sal_avg from emp
group by job order by sal_avg desc;

--where절로 원하는 조건의 그룹만 출력하기--
select job, count(*) as job_count from emp
where job = 'CLERK'
group by job;

--이중 그룹화--
select deptno, job, count(job) as job_count from emp
group by deptno, job order by deptno;

--group function--
--group by grouping--
select deptno, job, count(*) from emp
group by grouping sets(deptno,job); --sets절안에 나열된 순서대로 그룹화--

--grouby rollup--
select deptno,job,sum(sal) from emp
group by rollup(deptno,job);
--총계값 자동 반환, 나열순서대로 a그룹, (a,b)그룹화 하기때문에 순서 중요--

--group by cube--
select deptno, job from emp
group by cube(deptno, job)order by deptno;
--총계값 자동 반환--
--각각 나열된 컬럼끼리 한번씩 그룹화한다음에 전체 그룹화항 보여줌--

--cube대체--
select deptno,job from emp
group by grouping sets(deptno, job, (deptno,job),()) order by deptno;


--having--
select deptno, job, count(job) from emp
where count(job) >3
group by deptno, job order by deptno; --에러!--

select deptno, job, count(job) from emp
group by deptno, job
having count(deptno) >=2 order by deptno;
--집계함수의 결과에따른 조건을 사용하고싶을때 having절을 사용한다--


--having절과 where절 함께 사용하기--
--부서와 직업별 사원수와 평균 연봉구한 뒤, 연봉이2000이상인 사원수가 2명이상인 정보 출력하기--
select deptno, job, count(*) as 사원수 from emp
where sal >=2000
group by deptno, job
having count(*)>=2 ;