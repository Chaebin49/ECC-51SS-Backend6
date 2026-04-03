-- 학습 내용: SQL 첫걸음 5~6장 실습 (집계, 서브쿼리, 제약조건)

-- 1. 집계 함수 활용 (COUNT)
-- 전체 행 개수와 특정 열(NULL 제외) 개수 비교
SELECT COUNT(*) FROM sample51;
SELECT COUNT(name) FROM sample51;

-- 2. GROUP BY 그룹화
-- name별로 그룹화 (MariaDB는 NULL을 먼저 배치)
SELECT name FROM sample51 GROUP BY name;

-- 3. 서브쿼리를 이용한 데이터 삭제
-- 가장 작은 값을 찾아 해당 행만 삭제 (상관 서브쿼리 활용)
DELETE FROM sample54 
WHERE a = (SELECT min_a FROM (SELECT MIN(a) AS min_a FROM sample54) AS tmp);

-- 4. EXISTS 술어 활용 (데이터 존재 시 업데이트)
-- sample552에 번호가 있으면 '있음'으로 표시
UPDATE sample551
SET a = '있음'
WHERE EXISTS (
    SELECT * FROM sample552 
    WHERE sample552.no2 = sample551.no
);

-- 5. 테이블 생성 및 에러 처리 (ERROR 1050 대비)
-- 기존 테이블이 있으면 삭제 후 재생성
DROP TABLE IF EXISTS sample632;

CREATE TABLE sample632(
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL,
    name VARCHAR(30),
    CONSTRAINT pkey_sample PRIMARY KEY (no, sub_no)
);

-- 6. 복합 기본키 (Composite Primary Key) 실습
-- 두 열을 묶어 기본키로 지정 (데이터 중복 방지 설계)
CREATE TABLE sample635 (
    a INT NOT NULL,
    b INT NOT NULL,
    PRIMARY KEY (a, b)
);

-- 7. 제약 조건 삭제 및 이름 확인 (ERROR 1091 대비)
-- 실제 생성된 제약 조건 이름 확인법
SHOW CREATE TABLE sample631;

-- 이름 대신 키워드로 기본키 즉시 삭제
ALTER TABLE sample631 DROP PRIMARY KEY;