# 스프링 부트 3 백엔드 개발 입문 - 12~14장 학습 정리

## 12장. 서비스 계층과 트랜잭션
- 컨트롤러 → 서비스 → 리파지터리로 역할 분리 (관심사 분리)
- `@Service`로 비즈니스 로직 계층 구현
- 트랜잭션: 여러 작업을 하나의 단위로 묶어 전부 성공/전부 롤백 처리
- `@Transactional`로 트랜잭션 자동 관리 (자체 호출 시 미적용 주의)

## 13장. 테스트 코드 작성하기
- 테스트 코드의 필요성: 회귀 방지, 문서화, 설계 검증
- JUnit 5 기반 `@Test` 작성, given-when-then 패턴
- `@SpringBootTest`로 통합 테스트, `MockMvc`로 컨트롤러(HTTP) 테스트

## 14장. 댓글 엔티티와 리파지터리 만들기 (Part 4 시작)
- 게시글(1) : 댓글(N) 연관관계 설계
- `@Entity` + `@ManyToOne` + `@JoinColumn`으로 댓글 엔티티 구현
- `JpaRepository` 상속 + 쿼리 메서드(`findByArticleId`)로 조건 조회 구현

## 핵심 키워드
`서비스 계층` `@Transactional` `JUnit 5` `MockMvc` `연관관계 매핑` `@ManyToOne` `쿼리 메서드`
