-- [SQL 첫걸음] 7장 & 8장 표준 핵심 실습 정리
-- 주제: 집합 연산, 테이블 결합 및 데이터베이스 설계 원리
-- ==========================================
-- 7장. 복수의 테이블 다루기 (Multi-Table Operations)
-- ==========================================

-- 1. 집합 연산 (Set Operations) - 31강
-- UNION: 합집합 (중복 제거)
-- 두 SELECT 문의 열 개수와 데이터 형식이 일치해야 함
SELECT * FROM sample71_a
UNION
SELECT * FROM sample71_b;

-- UNION ALL: 중복을 포함한 단순 병합 (성능상 유리)
SELECT * FROM sample71_a
UNION ALL
SELECT * FROM sample71_b;

-- INTERSECT / EXCEPT: 교집합 및 차집합 (일부 DBMS 지원)
-- MariaDB/MySQL에서는 JOIN이나 서브쿼리로 대체 가능

-- 2. 결합 (JOIN) - 32강
-- 곱집합(Cross Join): 모든 행의 조합을 생성 (n x m)
SELECT * FROM sample72_x, sample72_y;
-- 또는 표준 SQL 방식
SELECT * FROM sample72_x CROSS JOIN sample72_y;

-- 내부 결합(Inner Join): 양쪽 테이블에 모두 존재하는 데이터만 추출
-- '상품' 테이블과 '재고수' 테이블을 상품코드로 연결
SELECT 상품.상품명, 재고수.재고수
FROM 상품 INNER JOIN 재고수
ON 상품.상품코드 = 재고수.상품코드;

-- 외부 결합(Outer Join): 한쪽 테이블의 데이터를 모두 보존하며 결합
-- LEFT JOIN: 왼쪽 테이블의 모든 행을 유지 (짝이 없으면 NULL)
SELECT 상품.상품명, 재고수.재고수
FROM 상품 LEFT JOIN 재고수
ON 상품.상품코드 = 재고수.상품코드;

-- 3. 관계형 모델과 관계 대수
-- 선택(Select), 투영(Project), 결합(Join), 합집합(Union) 등


-- ==========================================
-- 8장. 데이터베이스 설계 (Database Design)
-- ==========================================

-- 1. 데이터베이스 설계 단계 (34강)
-- [개념 설계] -> [논리 설계] -> [물리 설계]
-- ER 다이어그램(Entity-Relationship Diagram): 개체 간의 관계를 도식화

-- 2. 정규화 (Normalization) - 35강
-- 제1정규형: 모든 속성은 원자값(Atomic Value)을 가져야 함 (반복 그룹 제거)
-- 제2정규형: 부분 함수 종속성 제거 (기본키의 일부분에만 종속되는 속성 분리)
-- 제3정규형: 이행적 함수 종속성 제거 (기본키가 아닌 열끼리의 종속성 제거)

-- 3. 트랜잭션 (Transaction) - 36강
-- ACID 원칙: 원자성(Atomicity), 일관성(Consistency), 고립성(Isolation), 지속성(Durability)

-- 트랜잭션 시작
START TRANSACTION;

-- 실행할 쿼리들
UPDATE account SET balance = balance - 1000 WHERE id = 'A';
UPDATE account SET balance = balance + 1000 WHERE id = 'B';

-- 결과 확정 또는 취소
COMMIT;   -- 모든 변경 사항을 영구 반영
-- ROLLBACK; -- 오류 발생 시 모든 작업을 되돌림

-- ==========================================
-- 💡 실습 팁 (Self-Study Tips)
-- ==========================================
-- 1. 한글 식별자(테이블/열 이름) 사용 시 `백쿼트`로 감싸는 습관 들이기
-- 2. JOIN 사용 시 성능을 위해 연결 고리가 되는 열에 INDEX 설정 고려하기
-- 3. UNION 사용 시 ORDER BY는 항상 전체 쿼리의 맨 마지막에 배치하기