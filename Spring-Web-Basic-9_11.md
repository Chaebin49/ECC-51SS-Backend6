# 9장. CRUD와 SQL 쿼리 통합

## 📌 9.1 JPA 로깅 설정하기
- `application.properties`/`yml`에 SQL 로그 옵션 추가
- Hibernate가 생성하는 실제 SQL을 콘솔에서 확인 가능

## 📌 9.2 SQL 쿼리 로그 확인하기

| JPA 동작 | 실행 SQL |
|---------|---------|
| 데이터 생성 | INSERT |
| 데이터 조회 | SELECT |
| 데이터 수정 | UPDATE |
| 데이터 삭제 | DELETE |

## 📌 9.3 기본 SQL 쿼리 작성하기 (coffee 테이블 예제)

\`\`\`sql
-- 테이블 생성
CREATE TABLE coffee (...);

-- 데이터 생성
INSERT INTO coffee (...) VALUES (...);

-- 데이터 조회
SELECT * FROM coffee WHERE id = ?;

-- 데이터 수정
UPDATE coffee SET name = ? WHERE id = ?;

-- 데이터 삭제
DELETE FROM coffee WHERE id = ?;
\`\`\`

## ✅ 학습 체크리스트
- [ ] JPA SQL 로깅 설정 방법 이해
- [ ] CRUD 동작과 SQL 매핑 관계 파악
- [ ] coffee 테이블 기준 SQL 직접 작성 실습

---

# 10장. REST API와 JSON

## 📌 10.1 REST API와 JSON의 등장 배경
- REST: 자원(Resource) + HTTP Method로 동작을 표현하는 아키텍처 스타일
- JSON: key-value 기반의 경량 데이터 교환 형식 (XML 대체)

## 📌 10.2 REST API 동작 살펴보기

### 실습 도구
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) : 테스트용 가짜 REST API
- Talend API Tester : 크롬 확장 API 테스트 도구

### HTTP Method 요약

| Method | 역할     | 비유(CRUD) |
|--------|----------|-----------|
| GET    | 조회     | Read      |
| POST   | 생성     | Create    |
| PATCH  | 일부 수정 | Update    |
| DELETE | 삭제     | Delete    |

### 요청 예시

\`\`\`http
GET    /posts/1
POST   /posts
PATCH  /posts/1
DELETE /posts/1
\`\`\`

## ✅ 학습 체크리스트
- [ ] REST와 JSON의 등장 배경 이해
- [ ] JSONPlaceholder 사이트 구조 파악
- [ ] Talend API Tester 설치 및 사용법 숙지
- [ ] GET / POST / PATCH / DELETE 요청 직접 실습

---

# 11장. HTTP와 REST 컨트롤러

## 📌 11.1 REST API의 동작 이해하기
- 클라이언트 요청(Method + URI + Body) → 서버 처리 → JSON 응답

## 📌 11.2 REST API의 구현 과정
1. 엔드포인트(URI + Method) 설계
2. 컨트롤러 작성
3. 서비스 로직 처리
4. JSON 응답 반환

## 📌 11.3 REST API 구현하기

| Method | 어노테이션 | 설명 |
|--------|-----------|------|
| GET    | `@GetMapping`    | 데이터 조회, `@PathVariable` 활용 |
| POST   | `@PostMapping`   | 데이터 생성, `@RequestBody` 활용 |
| PATCH  | `@PatchMapping`  | 데이터 일부 수정 |
| DELETE | `@DeleteMapping` | 데이터 삭제 |

\`\`\`java
@RestController
@RequestMapping("/coffees")
public class CoffeeController {

    @GetMapping("/{id}")
    public Coffee getCoffee(@PathVariable Long id) { ... }

    @PostMapping
    public Coffee createCoffee(@RequestBody Coffee coffee) { ... }

    @PatchMapping("/{id}")
    public Coffee updateCoffee(@PathVariable Long id, @RequestBody Coffee coffee) { ... }

    @DeleteMapping("/{id}")
    public void deleteCoffee(@PathVariable Long id) { ... }
}
\`\`\`

## ✅ 학습 체크리스트
- [ ] REST 컨트롤러(@RestController) 개념 이해
- [ ] GET/POST/PATCH/DELETE 엔드포인트 직접 구현
- [ ] @PathVariable, @RequestBody 사용법 숙지
