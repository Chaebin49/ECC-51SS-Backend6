-- 학습 범위: SQL 첫걸음 9강 ~ 16강 (정렬, 연산, 함수, CASE, INSERT)

-- 1. 정렬 (ORDER BY)
-- 가격이 비싼 순(DESC)으로 정렬하고, 가격이 같다면 이름순(ASC)으로 정렬
SELECT * FROM sample_table 
ORDER BY price DESC, name ASC;

-- 2. 결과 행 제한 (LIMIT)
-- 상위 5개 데이터만 가져오기 (게시판 페이징 등에 사용)
SELECT * FROM sample_table LIMIT 5 OFFSET 0;

-- 3. 수치 연산 및 함수 (ROUND)
-- 소수점 첫째 자리에서 반올림하여 '반올림가격' 별명으로 조회
SELECT price, ROUND(price, 0) AS "반올림가격" FROM sample_table;

-- 4. 문자열 연산 (CONCAT, SUBSTRING 등)
-- 문자열 일부 자르기 및 길이 구하기
SELECT SUBSTRING('2026-03-27', 1, 4) AS "연도",
       CHARACTER_LENGTH('데이터베이스') AS "글자수";

-- 5. 날짜 연산 (DATEDIFF)
-- 현재 날짜와 주문일 사이의 일수 차이 계산
SELECT order_id, DATEDIFF(CURDATE(), order_date) AS "경과일수" 
FROM my_orders;

-- 6. CASE 문 (조건 분기)
-- 숫자를 문자로 변환하여 출력
SELECT no,
    CASE 
        WHEN a = 1 THEN '기본'
        WHEN a = 2 THEN '중급'
        ELSE '기타'
    END AS "등급"
FROM sample41;

-- 7. 데이터 추가 (INSERT + 제약 조건)
-- NOT NULL과 DEFAULT가 설정된 테이블에 데이터 넣기
INSERT INTO sample411 (no, d) VALUES (1, 100); -- 직접 지정
INSERT INTO sample411 (no) VALUES (2);        -- d는 DEFAULT값(0) 자동 입력