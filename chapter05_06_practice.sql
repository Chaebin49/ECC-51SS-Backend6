-- [SQL 첫걸음] 5장 & 6장 표준 핵심 실습 정리
-- 주제: 집계, 서브쿼리 및 데이터베이스 객체 설계

-- ==========================================
-- 5장. 집계와 서브쿼리
-- ==========================================

-- 1. 집계 함수 (Aggregate Functions)
-- COUNT: 행 개수 구하기 (*는 NULL 포함, 컬럼명은 NULL 제외)
SELECT COUNT(*) FROM sample51;
SELECT COUNT(name) FROM sample51;

-- SUM, AVG, MIN, MAX: 수치 요약
SELECT SUM(quantity), AVG(quantity) FROM sample51;
SELECT MIN(a), MAX(a) FROM sample54;

-- 2. 그룹화 (GROUP BY & HAVING)
-- 특정 열을 기준으로 그룹화하여 집계
SELECT name, COUNT(name) FROM sample51 GROUP BY name;

-- HAVING: 집계 결과에 조건 걸기 (WHERE절 사용 불가)
SELECT name, COUNT(name) FROM sample51 GROUP BY name HAVING COUNT(name) > 1;

-- 3. 서브쿼리 (Subquery)
-- DELETE 문에서의 서브쿼리 (가장 작은 값을 찾아 삭제)
DELETE FROM sample54 WHERE a = (SELECT min_a FROM (SELECT MIN(a) AS min_a FROM sample54) AS tmp);

-- 4. 상관 서브쿼리 (EXISTS)
-- 다른 테이블에 데이터가 존재하는지 확인하여 업데이트
UPDATE sample551 SET a = '있음'
WHERE EXISTS (SELECT * FROM sample552 WHERE sample552.no2 = sample551.no);


-- ==========================================
-- 6장. 데이터베이스 객체
-- ==========================================

-- 1. 테이블 생성 (CREATE TABLE)
-- 기본 구조 정의 및 데이터 형식 지정
CREATE TABLE sample62 (
    no INTEGER NOT NULL,
    a VARCHAR(30),
    b DATE
);

-- 2. 테이블 삭제 (DROP TABLE)
-- IF EXISTS를 사용하여 안전하게 삭제
DROP TABLE IF EXISTS sample62;

-- 3. 제약 조건 (Constraints)
-- PRIMARY KEY: 기본키 설정 (중복 및 NULL 허용 안 함)
-- NOT NULL: 빈 값 허용 안 함
CREATE TABLE sample63 (
    a INT NOT NULL,
    b INT NOT NULL,
    CONSTRAINT pkey_sample PRIMARY KEY (a, b) -- 복합 기본키 설정
);

-- 4. 열 추가 및 삭제 (ALTER TABLE)
-- 새로운 열 추가
ALTER TABLE sample63 ADD new_col INTEGER;

-- 열 속성 변경 또는 삭제
ALTER TABLE sample63 DROP COLUMN new_col;

-- 5. 인덱스 및 뷰 (Index & View)
-- 인덱스 확인 (성능 최적화 객체)
SHOW INDEX FROM sample63;

-- 뷰 생성 (가상 테이블)
CREATE VIEW sample_view AS SELECT * FROM sample51 WHERE no > 10;