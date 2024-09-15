--윈도우 함수--

select * from emp;

select sum(sal) as sum_sal
from emp; 

select empno, ename, job, deptno, sum(sal) as sum_sal
from emp; --에러!--

--윈도우 함수_집계함수와 함께 사용하기--

--급여전체합계 구하기--
select empno, ename, job, deptno,
sum(sal) over() as sal_total
from emp
order by deptno;

--전체중 최대급여 구하기--
select empno, ename, job, deptno,
max(sal) over() as sal_max
from emp order by deptno;


--전체중 최소급여 구하기--
select empno, ename, job, deptno,
min(sal) over() as min_sal
from emp order by deptno;

--전체중 평균 급여 구하기--
select empno, ename, job,deptno,
round(avg(sal) over(),2) as sal_avg
from emp order by deptno;
--윈도우 함수에서 round를 쓸 경우 over()절까지 같이 묶어서 괄호안에 넣어야함!--

--전체 행 개수 구하기--
select empno, ename, job, deptno,
count(empno) over() as count_emp
from emp;


--patition by 와 order by--

--부서별 급여 합계구하기--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno) as deptno_sal_sum
from emp;


--부서별 급여 평균 구하기--
select empno, ename, job, deptno, sal,
round(avg(sal) over(partition by deptno),2) deptno_sal_avg
from emp;

--order by를 추가하면 누적계산이 가능하다--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal) as sum_sal
from emp;

--누적계산시 범위 설정하기--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal rows between 1 preceding and 2 following) as sum_sal
from emp;

select empno, ename, job, deptno, sal,
round(avg(sal) over(partition by deptno order by sal 
rows between unbounded preceding and 1 following),2) as avg_sal
from emp; --처음부터 현재행 하나 밑까지--

--range--
select empno, ename, job, deptno, sal,
sum(sal) over(partition by deptno order by sal) as sum_sal
from emp; --같은 값은 하나로 출력--

--ragne로 값 범위 설정--
select empno, ename, job, deptno, sal,
count(*) over(order by sal range between 1000 preceding and 1000 following) as range_count
from emp; 
--현재행 기준에서 1000을 뺀 수 사이에 있고 현재행 기준에서 1000을 더한 수의 사이에 있는 값--


--순위 함수--

--rank--
select empno, ename, job, deptno, sal,
rank() over(order by sal) as sal_rank
from emp;

--dense_rank--
select empno, ename, job, deptno, sal,
dense_rank() over(order by sal) as dense_rank
from emp;

--row number--
select empno, ename, job, deptno, sal,
row_number() over(order by sal) as row_number
from emp;


--순위 함수 비교--
select empno, ename, job, deptno, sal,
rank() over(order by sal) as rank_sal,
dense_rank() over(order by sal) as dense_rank,
row_number() over(order by sal) as row_number
from emp;
