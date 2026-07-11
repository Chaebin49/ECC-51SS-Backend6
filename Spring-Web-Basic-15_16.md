# [스프링 부트 3] 15-16단원 요약: 댓글 REST API CRUD 구현

## 15단원: 댓글 컨트롤러와 서비스

### 1. REST API 설계 개요
* **컨트롤러(`CommentApiController`)**: 웹 페이지(HTML)가 아닌 JSON 데이터를 반환하는 `@RestController` 사용
* **서비스(`CommentService`)**: 비즈니스 로직 처리 및 트랜잭션 관리
* **DTO(`CommentDto`)**: 엔티티 계층을 보호하고 클라이언트와 안전하게 데이터를 주고받기 위한 객체

### 2. 주요 기능 구현
* **댓글 조회 (`GET /api/articles/{articleId}/comments`)**
  * 특정 게시글의 모든 댓글 엔티티를 조회 후 `CommentDto` 리스트로 변환하여 반환
* **댓글 생성 (`POST /api/articles/{articleId}/comments`)**
  * 게시글 존재 여부 검증 후 댓글 엔티티 저장
  * 잘못된 접근 시 `IllegalArgumentException` 예외 처리

---

## 16단원: 댓글 데이터의 CRUD 처리 (수정/삭제)

### 1. 댓글 수정 (`PATCH /api/comments/{id}`)
* **수정 프로세스:**
  1. DB에서 대상 댓글 조회 (없으면 예외 발생)
  2. 요청된 데이터와 기존 엔티티 검증 및 병합(`patch`)
  3. DB 갱신 후 수정된 결과를 DTO로 변환하여 반환

### 2. 댓글 삭제 (`DELETE /api/comments/{id}`)
* **삭제 프로세스:**
  1. DB에서 대상 댓글 조회 및 검증
  2. `commentRepository.delete(target)` 실행
  3. 삭제 성공 시 대상 데이터를 DTO로 변환하여 클라이언트에 반환

### 3. 데이터 무결성과 `@Transactional`
* **역할**: 서비스 레이어의 CRUD 메서드에 `@Transactional`을 추가하여 작업 중 예외 발생 시 자동 롤백(Rollback) 보장
