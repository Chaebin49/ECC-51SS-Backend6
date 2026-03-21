-- 학습 내용: SQL 첫걸음 1~2장 SELECT문

-- 1. sample 데이터베이스 선택
USE sample;

-- 2. 모든 데이터 조회하기
SELECT * FROM sample21;

-- 3. WHERE 절을 이용한 조건 검색 (no가 2인 사람 찾기)
SELECT * FROM sample21 WHERE no = 2;

-- 4. LIKE 연산자 연습 (SQL 단어가 들어간 행 찾기)
SELECT * FROM sample25 WHERE text LIKE '%SQL%';